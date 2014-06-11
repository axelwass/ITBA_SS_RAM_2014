<%@ include file="header.jsp"%>

<h2>Ingreso de caja</h2>

<form:form class="form-horizontal" method="POST" action="addCashTransaction"
	enctype="multipart/form-data" commandName="bankAccountTransactionForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
		<div class="control-group">
			<label class="control-label" for="date">Fecha: (dd/mm/aaaa) </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="date" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="ammount">Monto: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="ammount" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name">Descripci&oacute;n: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="name" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="rubro">Rubro:</label>
			<div class="controls">
				<form:select path="rubro">
					<form:option value="0" label="Seleccione rubro" />
					<form:options items="${rubroList}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Ingresar movimiento</button>
		</div>
	</fieldset>

</form:form>
<%@ include file="../footer.jsp"%>