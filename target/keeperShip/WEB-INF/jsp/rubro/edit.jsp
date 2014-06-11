<%@ include file="superheader.jsp"%>
<h2>Modificar rubro</h2>

<form:form class="form-horizontal" method="POST" action="edit"
	enctype="multipart/form-data" commandName="rubroForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="rubroName">Nombre: (memo) </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="rubroName" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="rubroDescription">Descripci&oacute;n: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="rubroDescription" />
			</div>
		</div>
		<input type="hidden" name="rubroId"
			value=${rubroForm.rubroId } />
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Modificar rubro</button>
		</div>
		
	</fieldset>

</form:form>
<div class="footer">Todos los datos son abligatorios</div>
<%@ include file="../footer.jsp"%>