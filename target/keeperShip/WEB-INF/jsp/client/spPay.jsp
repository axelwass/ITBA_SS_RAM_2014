<%@ include file="header.jsp"%>

<c:if test="${!empty client}">

	<div class="well">
		<h3>Se ingresar&aacute; el descuento al cliente ${client.name},
			lancha ${client.shipName} (${client.number}):</h3>

	</div>
	<form class="well form-horizontal" method="POST" action="spPay">


		<input type="hidden" name="clientId" value="${client.id}" />
		
		<div class="control-group">
			<label class="control-label" for="ammount">Monto: </label>
			<div class="controls">
				<input type="text" class="input-large" name="ammount"
					value=${ammount} />
			</div>
		</div>
		<input type="submit" name="submit" value="Ingresar descuento" class="btn" />
	</form>
</c:if>


<%@ include file="../footer.jsp"%>