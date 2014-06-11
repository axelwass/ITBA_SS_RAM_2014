<%@ include file="superheader.jsp" %>


<h2>Crear banco</h2>

<form:form class="form-horizontal" method="POST" action="add"
	enctype="multipart/form-data" commandName="bankForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="bankName">Nombre del banco: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="bankName" />
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Crear banco</button>
		</div>
	</fieldset>

</form:form>
<div class="footer">Los datos con asterisco (*) son abligatorios</div>
<%@ include file="../footer.jsp"%>