<%@ include file="header.jsp"%>
<c:if test="${!empty client}">
	<c:if test="${!empty param.newCheck}">
					<h3>Se ingres&oacute; el pago con el cheque con ID: <a href="../check/view?checkId=${param.checkId}">${param.checkId}</a></h3>
	</c:if>

	<div class="well">
		<h3>Datos del cliente:</h3>
		<div class="blockquote">
			<b>N&uacute;mero:</b> ${client.number}<br /> <b>Categor&iacute;a:</b>
			${client.payCategory.name}
			(<fmt:formatNumber value="${client.payCategory.price}" type="currency"/>/<fmt:formatNumber value="${client.payCategory.latePrice}" type="currency"/>)<br />
			<b>Nombre:</b>${client.name}<br /> <b>Nombre de la lancha: </b>${client.shipName}<br />
			<b>Saldo a favor: </b><c:if test="${client.advance < 0}"><font color="red"></c:if><fmt:formatNumber value="${client.advance}" 
            type="currency"/><c:if test="${client.advance < 0}"></font></c:if><br /> <b>Deuda total: </b><c:if test="${client.debt < 0}"><fmt:formatNumber value="0" 
            type="currency"/></c:if><c:if test="${client.debt >= 0}"><fmt:formatNumber value="${client.debt}" 
            type="currency"/></c:if><br />


		</div>
	</div>
	<c:if test="${!empty monthlyFeeList}">
		<div class="well">
			<h3>Meses adeudados:</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Fecha</th>
						<th>Monto</th>
						<th>Opciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${monthlyFeeList}" var="month">
						<tr>
							<td>${month.date.dayOfMonth}/${month.date.monthOfYear}/${
								month.date.year}</td>
							<td><c:if test="${month.late}"><c:if test="${month.lateAmmount < 0}"><font color="red"></c:if><fmt:formatNumber value="${month.lateAmmount}" 
            type="currency"/><c:if test="${month.lateAmmount < 0}"></font></c:if></c:if> <c:if
									test="${!month.late}"><c:if test="${month.ammount < 0}"><font color="red"></c:if><fmt:formatNumber value="${month.ammount}" 
            type="currency"/><c:if test="${month.ammount < 0}"></font></c:if></c:if></td>
							<td><a
								href="editMonthlyFee?clientId=${client.id}&feeId=${month.id}">Modificar</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	
	

	<b>${client.active?"Esta activo":"No esta activo"}</b>

	<form:form class="well form-horizontal" method="POST" action="pay"
		commandName="paySelectForm">

		<div class="error">
			<form:errors path="*" />
		</div>

		<input type="hidden" name="clientId" value="${client.id}" />
		<c:if test="${paySelectForm.special == true}">
		<form:hidden path="special" />
		<div class="control-group">
			<label class="control-label" for="method">Meses a pagar: </label>
			<div class="controls">
				<form:select path="months">
					<form:option value="0" label="0" />
					<form:option value="1" label="1" selected="true"/>
					<form:option value="2" label="2" />
					<form:option value="3" label="3" />
					<form:option value="4" label="4" />
					<form:option value="5" label="5" />
					<form:option value="6" label="6" />
					<form:option value="7" label="7" />
					<form:option value="8" label="8" />
					<form:option value="9" label="9" />
					<form:option value="10" label="10" />
					<form:option value="11" label="11" />
					<form:option value="12" label="12" />
				</form:select>
			</div>
		</div>
		</c:if>
		<div class="control-group">
			<label class="control-label" for="method">M&eacute;todo de
				pago: </label>
			<div class="controls">
				<form:select path="method">
					<form:options />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="ammount">Monto: </label>
			<div class="controls">
				<form:input type="text" class="input-large" path="ammount" />
			</div>
		</div>
		<input type="submit" name="submit" value="Ingresar pago" class="btn" />
	</form:form>
</c:if>

<c:if test="${!empty paidMonthsList}">
		<div class="well">
			<h3>Meses pagos:</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Mes</th>
						<th>Monto</th>
						<th>Opciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${paidMonthsList}" var="month">
						<tr>
							<td>${month.date.monthOfYear}/${
								month.date.year}</td>
							<td><c:if test="${month.late}"><c:if test="${month.lateAmmount < 0}"><font color="red"></c:if><fmt:formatNumber value="${month.lateAmmount}" 
            type="currency"/><c:if test="${month.lateAmmount < 0}"></font></c:if></c:if> <c:if
									test="${!month.late}"><c:if test="${month.ammount < 0}"><font color="red"></c:if><fmt:formatNumber value="${month.ammount}" 
            type="currency"/><c:if test="${month.ammount < 0}"></font></c:if></c:if></td>
							<td><a
								href="factura?clientId=${client.id}&feeId=${month.id}">Ver Factura</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>


<%@ include file="../footer.jsp"%>