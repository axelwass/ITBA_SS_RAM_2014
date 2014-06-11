<%@ include file="header.jsp"%>
<c:if test="${!empty client}">

	<div class="well">
		<h3>Se ingresar&aacute; el pago del cliente ${client.name},
			lancha ${client.shipName} (${client.number}):</h3>

	</div>

	<form:form class="form-horizontal" method="POST" action="payBank" commandName="payBankForm">
						

		<input type="hidden" name="clientId" value="${client.id}" />
		<div class="control-group">
			<label class="control-label">Deuda total: </label>
			<div class="controls">
				<b><c:if test="${client.debt < 0}"><fmt:formatNumber value="0" 
            type="currency"/></c:if><c:if test="${client.debt >= 0}"><fmt:formatNumber value="${client.debt}" 
            type="currency"/></c:if></b>
			</div>
		</div>
		<c:if test="${payBankForm.special == true}">
		<div class="control-group">
			<label class="control-label">Meses por pagar: </label>
			<div class="controls">
				<b>${payBankForm.months}</b>
			</div>
		</div>
		</c:if>
		<form:hidden path="months"/>
		<form:hidden path="special"/>
		<div class="control-group">
			<label class="control-label" for="bank">Cuenta de banco:</label>
			<div class="controls">
				<form:select path="bankAccount">
					<form:options items="${bankAccountList}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="ammount">Monto a pagar: </label>
			<div class="controls">
					<form:input type="text" class="input-xlarge" path="ammount" />
			</div>
		</div>
		<input type="submit" name="submit" value="Ingresar pago" class="btn" />
	</form:form>
</c:if>


<%@ include file="../footer.jsp"%>