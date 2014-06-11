
<%@ include file="header.jsp"%>

<form:form class="form-horizontal" method="POST" action="saveWorning" commandName="worningForm">


	<input type="hidden" name="clientId" value="${client.id}" />

	<fieldset>
		<div class="well">
			<h3>Registrar advertencia:</h3>		
			<div class="error"><form:errors path="*" /></div>
			<div class="control-group">
				<label class="control-label" for="type">Medio: </label>
				<div class="controls">
					<form:select path="type">
						<form:options items="${worningTypes}" itemLabel="name" />
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="to">Destino(mail/tel&eacute;fono): </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="to" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="spokeTo">Hable con: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="spokeTo" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="title">T&iacute;tulo: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="title" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="text">Comentarios/texto: </label>
				<div class="controls">
					<form:textarea name="text" rows="10" cols="20" path="text"></form:textarea>
				</div>
			</div>
			
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Registrar</button>
			</div>
			
		</div>
	</fieldset>
</form:form>

<%@ include file="../footer.jsp"%>