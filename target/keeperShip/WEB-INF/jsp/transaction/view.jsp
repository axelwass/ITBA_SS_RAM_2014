<%@ include file="header.jsp" %>
				<c:if test="${empty transaction}">
					<h3>
						Transacci&oacute;n inexistente.
					</h3>
				</c:if>
						
				
				<c:if test="${!empty transaction}">
					<div class="well">
						<h3>Datos de la transacci&oacute;n:</h3>
						<div class="blockquote">
							<b>Rubro: </b>${transaction.rubro.description} (${transaction.rubro.name})<br/>
							<b>ID: </b>${transaction.id}<br/>
							<b>Descripci&oacute;n:</b> ${transaction.name}<br/>
							<b>Fecha: </b>${transaction.date.dayOfMonth}/${transaction.date.monthOfYear}/${
					transaction.date.year}<br/>
							<b>Monto: </b><c:if test="${transaction.ammount < 0}"><font color="red"></c:if><fmt:formatNumber value="${transaction.ammount}" 
            type="currency"/><c:if test="${transaction.ammount < 0}"></font></c:if><br/>
							<c:if test="${transaction.method eq 'NEWCHECK' or transaction.method eq 'OLDCHECK'}"><b>Cheque:  <a href="../check/view?checkId=${transaction.check.id}">${transaction.check.id}</a></b><br/></c:if>
							<c:if test="${transaction.method eq 'BANK' or transaction.method eq 'NEWCHECK' or transaction.method eq 'OLDCHECK'}"><b>Cuenta de banco:  <a href="../transaction/todayBankAccount?bankAccountId=${transaction.bankAccount.id}&actualPage=0&pageSize=100">${transaction.bankAccount.name}</a></b><br/></c:if>
							Efectuada por <b>${transaction.user.name}</b><br/>
						</div>
					</div>
					<c:if test="${not empty transaction.client}">
					<div class="well">
						<h3>Datos del cliente:</h3>
						<div class="blockquote">
							<b>Lancha: </b>${transaction.client.shipName}<br/>
							<b>N&uacute;mero:</b> ${transaction.client.number}<a href="<c:url value="../client/view">
													<c:param name="clientId" value="${transaction.client.id}" />
												</c:url>">
												ver
											</a><br/>
							<b>Nombre: </b>${transaction.client.name}<br/>
							<b>Direcci&oacute;n: </b>${transaction.client.dir}<br/>
							<b>Tel&eacute;fono: </b>${transaction.client.tel}<br/>
							<b>E-Mail: </b>${transaction.client.mail}
						</div>
					</div>
					</c:if>
					
				</c:if>
					
						
<%@ include file="../footer.jsp" %>