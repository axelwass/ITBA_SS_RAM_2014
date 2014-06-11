
<%@ include file="header.jsp"%>
<c:if test="${empty client}">
	<h3>Usuario inexistente.</h3>
</c:if>

<c:if test="${!empty client}">
	<div class="well">
		<h3>Datos del cliente:</h3>
		<div class="blockquote">
			<b>N&uacute;mero:</b> ${client.number}<br /> <b>Categor&iacute;a:</b>
			${client.payCategory.name}
			(<fmt:formatNumber value="${client.payCategory.price}" type="currency"/>/<fmt:formatNumber value="${client.payCategory.latePrice}" type="currency"/>)<br />
			<b>Saldo a favor: </b><c:if test="${client.advance < 0}"><font color="red"></c:if><fmt:formatNumber value="${client.advance}" 
            type="currency"/><c:if test="${client.advance < 0}"></font></c:if><br /> <b>Deuda total: </b><c:if test="${client.debt < 0}"><fmt:formatNumber value="0" 
            type="currency"/></c:if><c:if test="${client.debt >= 0}"><fmt:formatNumber value="${client.debt}" 
            type="currency"/></c:if><br />
			<b>Nombre: </b>${client.name}<br /> <b>Direcci&oacute;n: </b>${client.dir}<br />
			<b>Tel&eacute;fono: </b>${client.tel}<br /> <b>E-Mail: </b>${client.mail}
		</div>
	</div>
	<div class="well" style="height: 150px;">
		<div style="float:left;">
			<h3>Datos de la lancha:</h3>
			<b>Nombre: </b>${client.shipName}<br /> <b>Modelo: </b>${client.shipModel}<br />
			<b>Motor: </b>${client.shipMotor}<br /> <b>Matricula: </b>${client.shipMatricle}<br />
			<b>Galpon:</b> ${client.storHouse.name}
		</div>
		<c:if test="${not empty client.photo}">
			<img class="ship-view-image" src="<c:url value="../photo/view"><c:param name="imageId" value="${client.photo.id}" /></c:url>" />
		</c:if>
		<c:if test="${empty client.photo}">
			<img class="ship-view-image" src="../../imgs/lancha.jpg" />
		</c:if>
	</div>

	<b>${client.contratated?"Tiene contrato.":"No tiene contrato."}</b>
	<br />
	<b>${client.active?"Esta activo":"No esta activo"}</b>

	<form:form class="well form-horizontal" method="POST"
		action="saveOther" commandName="otherForm">

		<div class="error">
			<form:errors path="*" />
		</div>

		<input type="hidden" name="clientId" value="${client.id}" />
		<div class="control-group">
			<label class="control-label" for="other">Varios:</label>
			<div class="controls">
				<form:textarea name="other" rows="10" cols="20" path="other" style="height: 50px; width: 290px;"></form:textarea>
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn">Guardar</button>
		</div>
	</form:form>
</c:if>


<%@ include file="../footer.jsp"%>