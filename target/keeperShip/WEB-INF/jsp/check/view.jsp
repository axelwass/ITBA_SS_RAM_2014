<%@ include file="superheader.jsp" %>
				<c:if test="${empty check}">
					<h3>
						Cheque inexistente.
					</h3>
				</c:if>
						
				<c:if test="${!empty check}">
				<c:if test="${not empty param.isNew}">
					<h3>Se ingres&oacute; el siguiente cheque con ID: ${check.id}</h3>
				</c:if>
					<div class="well">
						<h3>Datos del cheque:</h3>
						<div class="blockquote">
							<b>ID: </b>${check.id}  <c:if test="${check.status eq 'NOTPAID'}"><img class="icon" alt="No depositado" src="../../imgs/notpaidIcon.png"/> <a href="deposit?checkId=${check.id}">Depositar</a> <a href="reject?checkId=${check.id}">Rechazar</a> <a href="give?checkId=${check.id}">Pagar</a></c:if>
				<c:if test="${check.status eq 'PAID'}"><img class="icon" alt="Depositado" src="../../imgs/paidIcon.png"/>  <a href="undoDeposit?checkId=${check.id}">Deshacer</a></c:if>
				<c:if test="${check.status eq 'GIVEN'}"><img class="icon" alt="Pago" src="../../imgs/paidIcon.png"/>  <a href="undoGive?checkId=${check.id}">Deshacer</a></c:if>
				<c:if test="${check.status eq 'REJECTED'}"><img class="icon" alt="Rechazado" src="../../imgs/rejectedIcon.png"/> <a href="undoReject?checkId=${check.id}">Deshacer</a></c:if><br/>
							<b>N&uacute;mero:</b> ${check.number}<br/>
							<b>Vencimiento:</b>${check.payDate.dayOfMonth}/${check.payDate.monthOfYear}/${check.payDate.year}<br/>
							<b>Monto: </b><fmt:formatNumber value="${check.value}" type="currency"/><br/>
							<b>Banco: </b>${check.bank.name}<br/>
							
							Ingresado por <b>${check.entryBy.name}</b> en la fecha ${check.entryDate.dayOfMonth}/${check.entryDate.monthOfYear}/${
					check.entryDate.year}<br/>
							 <a href="edit?checkId=${check.id}">Modificar</a>
						</div>
					</div>
					<c:if test="${!empty check.client}">
					<div class="well">
						<h3>Datos del cliente:</h3>
						<div class="blockquote">
							<b>Lancha: </b>${check.client.shipName}<br/>
							<b>N&uacute;mero:</b> ${check.client.number}<a href="<c:url value="../client/view">
													<c:param name="clientId" value="${check.client.id}" />
												</c:url>">
												ver
											</a><br/>
							<b>Nombre:</b>${check.client.name}<br/>
							<b>Direcci&oacute;n: </b>${check.client.dir}<br/>
							<b>Tel&eacute;fono: </b>${check.client.tel}<br/>
							<b>E-Mail: </b>${check.client.mail}
						</div>
					</div>
					</c:if>
				</c:if>
					
						
<%@ include file="../footer.jsp" %>