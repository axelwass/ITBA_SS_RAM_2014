<%@ include file="header.jsp"%>

<c:if test="${!empty client}">
	<c:if test="${empty checkList}">
		<div class="well">
			<h3>No se ingresaron cheques de este cliente</h3>

		</div>
	</c:if>
	<c:if test="${!empty checkList}">
		<div class="well">
			<h3>Se ingresar&aacute; el pago del cliente ${client.name},
				lancha ${client.shipName} (${client.number}):</h3>

		</div>

		<form:form class="form-horizontal" method="POST" action="payOldCheck"
			commandName="payCheckForm">


			<input type="hidden" name="clientId" value="${client.id}" />
			<div class="control-group">
				<label class="control-label">Deuda total: </label>
				<div class="controls">
					<b><c:if test="${client.debt < 0}"><fmt:formatNumber value="0" 
            type="currency"/></c:if><c:if test="${client.debt >= 0}"><fmt:formatNumber value="${client.debt}" 
            type="currency"/></c:if></b>
				</div>
			</div>
			<c:if test="${payCheckForm.special == true}">
		<div class="control-group">
			<label class="control-label">Meses por pagar: </label>
			<div class="controls">
				<b>${payCheckForm.months}</b>
			</div>
		</div>
		</c:if>
		<form:hidden path="months"/>
		<form:hidden path="special"/>
			<div class="control-group">
				<label class="control-label" for="bank">Cheque (ID):</label>
				<div class="controls">
					<form:select path="check">
						<form:options items="${checkList}" itemValue="id" itemLabel="id" />
					</form:select>
				</div>
			</div>

			<input type="submit" name="submit" value="Ingresar pago" class="btn" />
		</form:form>
	</c:if>

</c:if>
<%@ include file="../footer.jsp"%>