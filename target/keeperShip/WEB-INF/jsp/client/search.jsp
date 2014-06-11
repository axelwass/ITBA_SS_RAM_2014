
<%@ include file="superheader.jsp" %>

<h2>Busqueda de clientes</h2>
						
						<form:form class="form-horizontal" method="GET" action="searchResults" commandName="searchForm">
						<div class="error"><form:errors path="*" /></div>
							<form:input type="hidden" path="page" value="0"/>
							<fieldset>
							
								<div class="control-group">
									<label class="control-label" for="number">N&uacute;mero de cliente: </label>
									<div class="controls">
										<form:input type="text" class="input-xlarge" path="number" />
									</div>
								</div>
						
								<div class="control-group">
									<label class="control-label" for="name">Nombre del cliente: </label>
									<div class="controls">
										<form:input type="text" class="input-xlarge" path="name" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="shipName">Nombre de la lancha: </label>
									<div class="controls">
										<form:input type="text" class="input-xlarge" path="shipName" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="debthMin">Debe más de: </label>
									<div class="controls">
										<form:input type="text" class="input-xlarge" path="debthMin" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="active">Activo?</label>
									<div class="controls">
										<label class="checkbox"> <form:checkbox path="active" />
										</label>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="pageSize">Clientes por p&aacute;gina:</label>
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
									<th>Numero de cliente</th>
									<th>Nombre del cliente</th>
									<th>Categor&iacute;a</th>
									<th>Tel&eacute;fono</th>
									<th>E-Mail</th>
									<th>Nombre de la lancha</th>
									<th>Deuda</th>
									<th>Ficha</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${resultPage.clients}" var="client">
									<tr>
										<td>${client.number}</td>
										<td>${client.name}</td>
										<td>${client.payCategory.name}</td>
										<td>${client.tel}</td>
										<td>${client.mail}</td>
										<td>${client.shipName}</td>
										<td><c:if test="${client.debt < 0}"><fmt:formatNumber value="0" 
            type="currency"/></c:if><c:if test="${client.debt >= 0}"><fmt:formatNumber value="${client.debt}" 
            type="currency"/></c:if></td>
										<td>
											<a href="<c:url value="view">
													<c:param name="clientId" value="${client.id}" />
												</c:url>">
												ver
											</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:if test="${resultPage.pages > 0}">
							<c:forEach var="page" begin="0" end="${resultPage.pages -1}" step="1">
							 <a href="searchResults?page=${page}&number=${searchForm.number}&name=${searchForm.name}&shipName=${searchForm.shipName}&active=${searchForm.active}&pageSize=${searchForm.pageSize}"><c:if test="${page == searchForm.page}"><b></c:if>${page+1}<c:if test="${searchForm.page == page}"></b></c:if></a>
							 
							 </c:forEach>
						</c:if>
	
						
<%@ include file="../footer.jsp" %>