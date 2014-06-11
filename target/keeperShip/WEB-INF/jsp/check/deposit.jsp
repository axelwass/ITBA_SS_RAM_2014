<%@ include file="superheader.jsp" %>

<h2>Modificar cheque</h2>

<form:form class="form-horizontal" method="POST" action="deposit"
	enctype="multipart/form-data" commandName="depositCheckForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
		<input type="hidden" name="checkId" value="${depositCheckForm.check.id}"/>
		<div class="control-group">
			<label class="control-label" for="bankAccount">Cuenta de banco:</label>
			<div class="controls">
				<form:select path="bankAccount">
					<form:options items="${bankAccountList}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
		</div>
		
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Depositar</button>
		</div>
	</fieldset>

</form:form>
<div class="footer">Los datos con asterisco (*) son abligatorios</div>
<%@ include file="../footer.jsp"%>