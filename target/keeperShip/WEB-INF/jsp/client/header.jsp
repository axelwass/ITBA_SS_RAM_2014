<%@ include file="superheader.jsp"%>
<c:if test="${empty client}">
	<h3>Usuario inexistente.</h3>
</c:if>


<c:if test="${!empty client}">
	<div class="supermenu dont-print">
		<a class="sub_menu_button" href="view?clientId=${client.id}">Ver</a>
		<a class="sub_menu_button" href="pay?clientId=${client.id}">Ingresar pago</a>
		<a class="sub_menu_button" href="transactions?clientId=${client.id}&actualPage=0&pageSize=100">Registro de pagos</a>
		<a class="sub_menu_button" href="fixedPay?clientId=${client.id}">Pago especial/Descuento</a>
		<a class="sub_menu_button" href="traceWornings?clientId=${client.id}">Advertencias</a>
		<a class="sub_menu_button" href="traceDepartures?clientId=${client.id}">Salidas</a>
		<a class="sub_menu_button" href="modify?clientId=${client.id}">Modificar datos</a>
		<a class="sub_menu_button" href="editPhoto?clientId=${client.id}">Modificar foto</a>
	</div>

</c:if>