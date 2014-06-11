
<%@ include file="../header.jsp"%>

<h2>Cuentas de banco</h2>
<table class="table table-striped">
	<thead>
		<tr>
			<th>Nombre de cuenta</th>
			<th>Titular</th>
			<th>N&uacute;mero de cuenta</th>
			<th>CBU</th>
			<th>Banco</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${bankAccountList}" var="ba">
			<tr>
				<td>${ba.name}</td>
				<td>${ba.titular}</td>
				<td>${ba.number}</td>
				<td>${ba.cbu}</td>
				<td>${ba.bank.name}</td>
				<td><a
					href="<c:url value="../transaction/todayBankAccount">
													<c:param name="bankAccountId" value="${ba.id}" />
													<c:param name="actualPage" value="0" />
													<c:param name="pageSize" value="100" />
												</c:url>">
						Movimientos </a>
						<a
					href="<c:url value="edit">
													<c:param name="baId" value="${ba.id}" />
												</c:url>">
						editar </a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="form-actions">
		<a class="btn btn-primary" href="add">Agregar cuenta</a>
</div>
<%@ include file="../footer.jsp"%>