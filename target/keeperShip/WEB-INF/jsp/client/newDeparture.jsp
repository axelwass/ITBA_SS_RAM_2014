<%@ include file="header.jsp"%>

<form:form class="form-horizontal" method="POST" action="saveDeparture" commandName="departureForm">


	<input type="hidden" name="clientId" value="${client.id}" />

	<fieldset>
		<div class="well">
			<h3>Nueva salida:</h3>		
			<div class="error"><form:errors path="*" /></div>
			
			
			<div class="control-group">
				<label class="control-label" for="tripulation">Tripulacion: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="tripulation" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="section">Seccion: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="section" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="returnDate">Dia de retorno(dd/mm/aaaa): </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="returnDate" />
				</div>
			</div>
			
			<c:if test="${client.debt > client.payCategory.price}">
				<b  class="error">El usuario tiene deudas, introducir clave para permitir la salida de todas formas.</b>
				<div class="control-group">
					<label class="control-label" for="password">Clave de autenticacion: </label>
					<div class="controls">
						<form:input type="password" class="input-xlarge" path="password" />
					</div>
				</div>
			</c:if>
			
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
			
		</div>
	</fieldset>
</form:form>

<%@ include file="../footer.jsp"%>