
<%@ include file="header.jsp" %>

<div>
	<br>
	<div class="factura">
		${keepership.name}<br>
		${keepership.dir}<br>
		${keepership.cuit}<br>
		IVA Resp. Inscripto<br>
		<br>
		Socio Nro.: ${client.number}<br>
		<br>
		${client.name}<br>
		<br>
		${client.shipName}(${client.shipModel})<br>
		<br>
		${client.shipMatricle}<br>
		<br>
		${fee.date.monthOfYear}/${fee.date.year}<br>
		<br>
		Total pesos: <c:if test="${fee.late}">${fee.lateAmmount}</c:if><c:if test="${!fee.late}">${fee.ammount}</c:if><br>
		<br>
		-----------------------<br>
		<br>
	</div>
</div>

<div class="form-actions dont-print">
	<a id="print-button" class="btn btn-primary">Imprimir</a>
</div>

<%@ include file="../footer.jsp" %>