<%@ include file="../header.jsp" %>

<form:form class="form-horizontal" method="POST" action="init" commandName="simulationForm">

	<div class="error"><form:errors path="*" /></div>

	<fieldset>
		
		<div class="well">
			<h3>Datos de la simulacion:</h3>
			
			<div class="control-group">
				<label class="control-label" for="simulationTime">Simulation time: </label>
				<div class="controls">
					<form:select path="simulationTime">
						<form:options items="${time}"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="memorySize">Memory size: </label>
				<div class="controls">
					<form:select path="memorySize">
						<form:options items="${memory}"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="order">List order: </label>
				<div class="controls">
					<form:select path="order">
						<form:options items="${orderConfiguration}"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="range">Bin range: </label>
				<div class="controls">
					<form:select path="range">
						<form:options items="${range}"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="context">Context aplication: </label>
				<div class="controls">
					<form:select path="context">
						<form:options items="${context}"/>
					</form:select>
				</div>
			</div>
		
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Iniciar</button>
		</div>

	</fieldset>
</form:form>

<%@ include file="../footer.jsp" %>