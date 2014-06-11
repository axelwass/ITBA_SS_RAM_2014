<%@ include file="../header.jsp"%>

<h2>Modificar cuenta de banco</h2>

<form:form class="form-horizontal" method="POST" action="edit"
	enctype="multipart/form-data" commandName="bankAccountForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="bankName">(*)Nombre de
				cuenta: (memo) </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="bankAccountName" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bankName">Titular: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="titular" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bankName">Número de cuenta:
			</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="accountNumber" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bankName">CBU: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="cbu" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bank">(*)Banco:</label>
			<div class="controls">
				<form:select path="bank">
					<form:options items="${bankList}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
		</div>
		<input type="hidden" name="baId"
			value=${bankAccountForm.bankAccountId } />
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Modificar
				cuenta</button>
		</div>
	</fieldset>

</form:form>
<div class="footer">Los datos con asterisco (*) son abligatorios</div>
<%@ include file="../footer.jsp"%>