
<%@ include file="superheader.jsp" %>

<c:if test="${not empty clientForm}">

<form:form class="form-horizontal" method="POST" action="saveChanges" commandName="clientForm">

	<div class="error"><form:errors path="*" /></div>

	<fieldset>
		

		<form:input type="hidden" path="clientId" />
		
		<div class="well">
			<h3>Datos del cliente:</h3>
			<div class="control-group">
				<label class="control-label" for="number">N&uacute;mero: </label>
				<div class="controls">
					<form:select path="number">
						<form:option value="0" label="NINGUNO(0)"/>
						<c:if test="${not empty clientForm.number and not (clientForm.number eq '0')}"><form:option value="${clientForm.number}" label="${clientForm.number}"/></c:if>			
						<form:options items="${availableNumbers}" />
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="payCategory">Categor&iacute;a: </label>
				<div class="controls">
					<form:select path="payCategory">
						<form:options items="${payCategoryList}" itemValue="id" itemLabel="name" />
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="name">Nombre y apellido: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="name" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="dir">Direcci&oacute;n: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="dir" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="tel">Tel&eacute;fono: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="tel" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="mail">E-Mail: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="mail" />
				</div>
			</div>
		</div>
				
				
		<div class="well">
			<h3>Datos de la lancha:</h3>
			<div class="control-group">
				<label class="control-label" for="shipName">Nombre: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="shipName" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="shipModel">Modelo: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="shipModel" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="shipMotor">Motor: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="shipMotor" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="shipMatricle">Matricula: </label>
				<div class="controls">
					<form:input type="text" class="input-xlarge" path="shipMatricle" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="storHouse">Galpon: </label>
				<div class="controls">
					<form:select path="storHouse">
						<form:options items="${storHouses}" itemLabel="name" />
					</form:select>
				</div>
			</div>
		</div>
		
		
		<div class="control-group">
			<label class="control-label" for="autorizated">Autorizados:</label>
			<div class="controls">
				<form:textarea name="autorizated" rows="10" cols="20" path="autorizated" style="height: 50px; width: 290px;"></form:textarea>
				
			</div>
		</div>
		
		
		
		<div class="control-group">
			<label class="control-label" for="contratated">Tiene contrato?</label>
			<div class="controls">
				<label class="checkbox"> <form:checkbox path="contratated" />
				</label>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="active">Esta activo?</label>
			<div class="controls">
				<label class="checkbox"> <form:checkbox path="active" />
				</label>
			</div>
		</div>
		
		
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Guardar</button>
		</div>

	</fieldset>
</form:form>

</c:if>
<c:if test="${empty clientForm}">
	<h2>No hay mas numeros de cliente disponibles, entre a algun cliente no activo y saquele el numero (poner en el campo nombre el valor "NINGUNO(0)" )</h2>
</c:if>
<%@ include file="../footer.jsp" %>