<%@ include file="header.jsp"%>

<c:if test="${!empty client}">
	<a class="sub_menu_button" href="view?clientId=${client.id}">Volver</a>
	
		<div class="well">
			<h3>Modificar monto de cuota:</h3>

		</div>

		<form:form class="form-horizontal" method="POST" action="editMonthlyFee"
			commandName="singleDoubleForm">


			<input type="hidden" name="clientId" value="${client.id}" />
			<input type="hidden" name="feeId" value="${monthlyFee.id}" />
			<div class="control-group">
				<label class="control-label">Monto actual: </label>
				<div class="controls">
					<b>${monthlyFee.ammount}</b>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="ammount">Nuevo monto:</label>
				<div class="controls">
				<form:input type="text" class="input-xlarge" path="ammount" />
				</div>
			</div>

			<input type="submit" name="submit" value="Modificar monto" class="btn" />
		</form:form>


</c:if>
<%@ include file="../footer.jsp"%>