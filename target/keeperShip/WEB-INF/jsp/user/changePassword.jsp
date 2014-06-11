<%@ include file="../header.jsp"%>

<h2>Cambiar contrase&ntilde;a</h2>

<form:form class="form-horizontal" method="POST" action="changePassword"
	enctype="multipart/form-data" commandName="changePasswordForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="oldPassword">Contrase&ntilde;a actual: </label>
			<div class="controls">
				<form:input type="password" class="input-xlarge" path="oldPassword" />
			</div>
		</div>
				<div class="control-group">
			<label class="control-label" for="password">Contrase&ntilde;a nueva:</label>
			<div class="controls">
				<form:input type="password" class="input-xlarge" path="password" />
			</div>
		</div>
				<div class="control-group">
			<label class="control-label" for="password2">Ingrese contrase&ntilde;a nueva
			nuevamente:</label>
			<div class="controls">
				<form:input type="password" class="input-xlarge" path="password2" />
			</div>
		</div>
	
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Cambiar contrase&ntilde;a</button>
		</div>
	</fieldset>

</form:form>
<%@ include file="../footer.jsp"%>