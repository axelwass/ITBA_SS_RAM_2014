
<%@ include file="../header.jsp" %>

<h2>Registro</h2>
						
						<form:form class="form-horizontal" method="GET" action="searchResults" commandName="registerSearchForm">
						<div class="error"><form:errors path="*" /></div>
							<form:input type="hidden" path="page" value="0"/>
							<fieldset>
							
								<div class="control-group">
									<label class="control-label" for="levelOfDetail">Nivel de detalle: </label>
									<div class="controls">
										<form:select path="levelOfDetail">
											<form:options items="${detailLevels}" itemLabel="levelOfDetail" />
										</form:select>
									</div>
								</div>
							
								<div class="control-group">
									<label class="control-label" for="from">Desde (dd/mm/aaaa): </label>
									<div class="controls">
										<form:input type="text" class="input-xlarge" path="from" />
									</div>
								</div>
						
								<div class="control-group">
									<label class="control-label" for="to">Hasta (dd/mm/aaaa): </label>
									<div class="controls">
										<form:input type="text" class="input-xlarge" path="to" />
									</div>
								</div>
							
							
								<div class="control-group">
									<label class="control-label" for="pageSize">Datos por p&aacute;gina:</label>
									<div class="controls">
										<form:select path="pageSize">
											<form:option value="10" label="10" />
											<form:option value="50" label="50" />
											<form:option value="100" label="100" />
											<form:option value="500" label="500" />
											</form:select>
									</div>
								</div>
										
								<div class="form-actions">
            						<button type="submit" class="btn btn-primary">Buscar</button>
          						</div>
							</fieldset>
						</form:form>
						
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Dia</th>
									<th>Usuario</th>
									<th>En</th>
									<th>Tipo</th>
									<th>Cambios</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${resultPage.entrys}" var="entry">
									<tr>
										<td>${entry.date.dayOfMonth}/${entry.date.monthOfYear}/${
									entry.date.year}</td>
										<td>${entry.user.name}</td>
										<td>${entry.applyer}</td>
										<td>${entry.type.name}</td>
										<td>
											<ul>
											<c:forEach items="${entry.changes}" var="change">
												<c:if test="${change.priority.value <= resultPage.levelOfDetail.value}">
													<li>${change.field}(<c:if test="${not empty change.oldVal}"> ${change.oldVal}-></c:if>${change.newVal})</li>
												</c:if>
											</c:forEach>
											</ul>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:if test="${resultPage.pages > 0}">
							<c:forEach var="page" begin="0" end="${resultPage.pages -1}" step="1">
							 <a href="searchResults?page=${page}&pageSize=${registerSearchForm.pageSize}&from=${registerSearchForm.from}&to=${registerSearchForm.to}&levelOfDetail=${registerSearchForm.levelOfDetail}"><c:if test="${page == registerSearchForm.page}"><b></c:if>${page+1}<c:if test="${registerSearchForm.page == page}"></b></c:if></a>
							 
							 </c:forEach>
						</c:if>
	
						
<%@ include file="../footer.jsp" %>