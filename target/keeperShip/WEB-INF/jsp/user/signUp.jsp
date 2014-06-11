<%@ include file="../header.jsp"%>

<h2>Crear usuario</h2>

<form:form class="form-horizontal" method="POST" action="signUp"
	enctype="multipart/form-data" commandName="userForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="name">Nombre y apellido: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="name" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="username">Nombre de usuario:</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="username" />
			</div>
		</div>
				<div class="control-group">
			<label class="control-label" for="password">Contrase&ntilde;a:</label>
			<div class="controls">
				<form:input type="password" class="input-xlarge" path="password" />
			</div>
		</div>
				<div class="control-group">
			<label class="control-label" for="password2">Ingrese contrase&ntilde;a
			nuevamente:</label>
			<div class="controls">
				<form:input type="password" class="input-xlarge" path="password2" />
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="admin">Es administrador?</label>
			<div class="controls">
				<label class="checkbox"> <form:checkbox path="admin" />
				</label>
			</div>
		</div>
	
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Crear usuario</button>
		</div>
	</fieldset>

</form:form>
<div class="footer">Los datos con asterisco (*) son abligatorios</div>
<%@ include file="../footer.jsp"%>