<%@ include file="header.jsp"%>

<form:form class="form-horizontal" method="POST" action="saveWorningPlan" commandName="worningPlanForm">


	<input type="hidden" name="clientId" value="${client.id}" />

	<fieldset>
		<div class="well">
			<h3>Planificar una advertencia:</h3>		
			<div class="error"><form:errors path="*" /></div>
			
			
			<div class="control-group">
				<label class="control-label" for="date">Date(dd/mm/aaaa): </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="date" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="to">Destino(mail/telefono): </label>
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
				<label class="control-label" for="hours">Horario: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="hours" />
				</div>
			</div>
			
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
			
		</div>
	</fieldset>
</form:form>

<%@ include file="../footer.jsp"%>