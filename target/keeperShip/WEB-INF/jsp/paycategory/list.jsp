
<%@ include file="../header.jsp"%>

<h2>Categor&iacute;as</h2>
<table class="table table-striped">
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Precio</th>
			<th>Precio tard&iacute;o</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${payCategoryList}" var="pc">
			<tr>
				<td>${pc.name}</td>
				<td><fmt:formatNumber value="${pc.price}" type="currency"/></td>
				<td><fmt:formatNumber value="${pc.latePrice}" type="currency"/></td>
				<td><a
					href="<c:url value="edit">
													<c:param name="payCategoryId" value="${pc.id}" />
												</c:url>">
						editar </a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="form-actions">
		<a class="btn btn-primary" href="add">Agregar categor&iacute;a</a>
</div>
<%@ include file="../footer.jsp"%>