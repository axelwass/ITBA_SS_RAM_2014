<%@ include file="superheader.jsp"%>

<h2>Categor&iacute;as</h2>
<table class="table table-striped">
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Descripc&oacute;n</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${rubroList}" var="rubro">
			<tr>
				<td>${rubro.name}</td>
				<td>${rubro.description}</td>
				<td><a
					href="<c:url value="edit">
													<c:param name="rubroId" value="${rubro.id}" />
												</c:url>">
						editar </a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%@ include file="../footer.jsp"%>