<%@ include file="header.jsp"%>

<c:if test="${!empty client}">
	
		<div class="well">
			<h3>Se ingresar&aacute; el pago del cliente ${client.name},
				lancha ${client.shipName} (${client.number}):</h3>

		</div>
		<h2>Ingresar cheque</h2>

<form:form class="form-horizontal" method="POST" action="payNewCheck"
	enctype="multipart/form-data" commandName="checkForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
	<div class="control-group">
				<label class="control-label">Deuda total: </label>
				<div class="controls">
					<b><c:if test="${client.debt < 0}"><fmt:formatNumber value="0" 
            type="currency"/></c:if><c:if test="${client.debt >= 0}"><fmt:formatNumber value="${client.debt}" 
            type="currency"/></c:if></b>
				</div>
			</div>
			<c:if test="${special == true}">
		<div class="control-group">
			<label class="control-label">Meses por pagar: </label>
			<div class="controls">
				<b>${months}</b>
			</div>
		</div>
		</c:if>
		<div class="control-group">
			<label class="control-label" for="number">N&uacute;mero de cheque:
			</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="number" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="value">Monto:
			</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="value" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="payDate">Vencimiento (dd/mm/aaaa):
			</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="payDate" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bank">Banco:</label>
			<div class="controls">
				<form:select path="bank">
					<form:options items="${bankList}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
		</div>
		<input type="hidden" name="clientId" value="${client.id}" />
		<input type="hidden" name="months" value="${months}" />
		<input type="hidden" name="special" value="${special}" />
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Ingresar cheque</button>
		</div>
	</fieldset>

</form:form>


</c:if>
<%@ include file="../footer.jsp"%>