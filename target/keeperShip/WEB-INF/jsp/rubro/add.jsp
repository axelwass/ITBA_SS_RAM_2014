<%@ include file="superheader.jsp"%>

<h2>Ingresar rubro</h2>

<form:form class="form-horizontal" method="POST" action="add"
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
		
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Ingresar rubro</button>
		</div>
	</fieldset>

</form:form>
<div class="footer">Todos los datos son abligatorios</div>
<%@ include file="../footer.jsp"%>