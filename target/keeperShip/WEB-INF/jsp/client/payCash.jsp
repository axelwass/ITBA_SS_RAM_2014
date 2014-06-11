<%@ include file="header.jsp"%>

<c:if test="${!empty client}">


	<div class="well">
		<h3>Se ingresar&aacute; el pago del cliente ${client.name},
			lancha ${client.shipName} (${client.number}):</h3>

	</div>

	<form class="well form-horizontal" method="POST" action="payCash">


		<input type="hidden" name="clientId" value="${client.id}" />
		<div class="control-group">
			<label class="control-label">Deuda total: </label>
			<div class="controls">
				<b><c:if test="${client.debt < 0}"><fmt:formatNumber value="0" 
            type="currency"/></c:if><c:if test="${client.debt >= 0}"><fmt:formatNumber value="${client.debt}" 
            type="currency"/></c:if></b>
			</div>
		</div>
		<c:if test="${special == true}">
		<div class="control-group">
			<label class="control-label">Meses por pagar: </label>
			<div class="controls">
				<b>${months}</b>
			</div>
		</div>
		</c:if>
		<input type="hidden" name="months" value="${months}" />
		<input type="hidden" name="special" value="${special}" />
		<div class="control-group">
			<label class="control-label" for="ammount">Monto a pagar: </label>
			<div class="controls">
				<input type="text" class="input-large" name="ammount"
					value=<%= request.getParameter("ammount") %> />
			</div>
		</div>
		<input type="submit" name="submit" value="Ingresar pago" class="btn" />
	</form>
</c:if>


<%@ include file="../footer.jsp"%>