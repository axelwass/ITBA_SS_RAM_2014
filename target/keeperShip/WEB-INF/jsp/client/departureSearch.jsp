
<%@ include file="superheader.jsp" %>
					<div class="dont-print">
						<h2>Busqueda de salidas:</h2>
						<form:form class="form-horizontal" method="GET" action="departureSearchResults" commandName="departureSearchForm">
						<div class="error"><form:errors path="*" /></div>
							<fieldset>
							
								<div class="control-group">
									<label class="control-label" for="type">Tipo:</label>
									<div class="controls">
										<form:select path="type">
											<form:options items="${departureSearchTypes}" itemLabel="name" />
										</form:select>
									</div>
								</div>
							
								<div class="control-group">
									<label class="control-label" for="day">Dia (dd/mm/aaaa): </label>
									<div class="controls">
										<form:input type="text" class="input-xlarge" path="day" />
									</div>
								</div>
										
								<div class="form-actions">
            						<button type="submit" class="btn btn-primary">Buscar</button>
									<a id="print-button" class="btn btn-primary">Imprimir</a>
          						</div>
							</fieldset>
						</form:form>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Dia de salida</th>
									<th>Dia de retorno planificado</th>
									<th>Galpon</th>
									<th>Tripulacion</th>
									<th>Seccion</th>
									<th>Lancha</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${departures}" var="departure">
									<tr>
										<td>${departure.date.dayOfMonth}/${departure.date.monthOfYear}/${
													departure.date.year}</td>
										<td>${departure.returnDate.dayOfMonth}/${departure.returnDate.monthOfYear}/${
												departure.returnDate.year}</td>
										<td>${departure.client.storHouse.name }</td>
										<td>${departure.tripulation}</td>
										<td>${departure.section}</td>
										<td>
											<a href="<c:url value="traceDepartures">
													<c:param name="clientId" value="${departure.client.id}" />
												</c:url>">${departure.client.uniqueDesc}
											</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="only-print">
						<br>
						<div class="factura">
							<c:forEach items="${StorHouses}" var="storHouse">
								-----------------------<br>
								* ${departureSearchForm.type.name} *<br> 
								* dia ${departureSearchForm.day} *<br>
								* galpon: ${storHouse.name} *<br>
								-----------------------<br>
								<c:forEach items="${departures}" var="departure">
									<c:if test="${departure.client.storHouse eq storHouse}">${departure.client.shipName}(${departure.client.shipModel})<br></c:if>
								</c:forEach>
								-----------------------<br>
								<br>
								<br>
							</c:forEach>
						</div>
					</div>
						
<%@ include file="../footer.jsp" %>