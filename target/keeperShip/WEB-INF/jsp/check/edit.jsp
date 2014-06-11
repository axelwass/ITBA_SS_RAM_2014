<%@ include file="superheader.jsp" %>

<h2>Modificar cheque</h2>

<form:form class="form-horizontal" method="POST" action="edit"
	enctype="multipart/form-data" commandName="checkForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
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
			<label class="control-label" for="payDate">Vencimiento (DD/MM/AAAA):
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
		<div class="control-group">
			<label class="control-label" for="client">Cliente:</label>
			<div class="controls">
				<form:select path="client">
					<form:option value="0" label="Sin cliente"/>
					<form:options items="${clientList}" itemValue="id" itemLabel="uniqueDesc" />
				</form:select>
			</div>
		</div>
		<input type="hidden" name="checkId" value="${checkForm.id}"/>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Modificar</button>
		</div>
	</fieldset>

</form:form>
<div class="footer">Los datos con asterisco (*) son abligatorios</div>
<%@ include file="../footer.jsp"%>