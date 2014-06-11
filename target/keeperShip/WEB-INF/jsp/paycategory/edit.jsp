<%@ include file="../header.jsp"%>

<h2>Modificar cuenta de banco</h2>

<form:form class="form-horizontal" method="POST" action="edit"
	enctype="multipart/form-data" commandName="payCategoryForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="pcName">Nombre: (memo) </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="pcName" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="price">Precio: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="price" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="latePrice">Precio pago tard&iacute;o: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="latePrice" />
			</div>
		</div>
		<input type="hidden" name="payCategoryId"
			value=${payCategoryForm.pcId } />
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Modificar categor&iacute;a</button>
		</div>
		
	</fieldset>

</form:form>
<div class="footer">Todos los datos son abligatorios</div>
<%@ include file="../footer.jsp"%>