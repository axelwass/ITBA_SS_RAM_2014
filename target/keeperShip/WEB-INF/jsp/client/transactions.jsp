<%@ include file="header.jsp"%>

<h2>Transacciones de ${client.name}, lancha ${client.shipName} (${client.number})</h2><br/>




<table class="table table-striped">
	<thead>
		<tr>
			<th>Rubro</th>
			<th>ID</th>
			<th>Fecha</th>
			<th>Monto</th>
			<th>Descripci&oacute;n</th>
			<th>Banco</th>
			<th>Barco</th>
			<th>Ingresado por</th>
			<th>Detalle</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${resultPage.transactions}" var="transaction">
			<tr>
				<td>${transaction.rubro.name}</td>
				<td>${transaction.id}</td>
				<td>${transaction.date.dayOfMonth}/${transaction.date.monthOfYear}/${
					transaction.date.year}</td>
				<td class="price"><c:if test="${transaction.ammount < 0}"><font color="red"></c:if><fmt:formatNumber value="${transaction.ammount}" 
            type="currency"/><c:if test="${transaction.ammount < 0}"></font></c:if></td>
				<td>${transaction.name}</td>
				<td>${transaction.bankAccount.name}</td>
				<td>${transaction.client.shipName}</td>
				<td>${transaction.user.name}</td>
				<td><a
					href="<c:url value="../transaction/view">
													<c:param name="transactionId" value="${transaction.id}" />
												</c:url>">
						ver </a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:if test="${resultPage.pages > 0}">
	<c:forEach var="page" begin="0" end="${resultPage.pages -1}" step="1">

		<a
			href="transactions?clientId=${client.id}&actualPage=${page}&pageSize=${pageSize}"><c:if
				test="${actualPage == page}">
				<b>
			</c:if>${page+1}<c:if test="${actualPage == page}">
				</b>
			</c:if> </a>

	</c:forEach>
</c:if>



<%@ include file="../footer.jsp"%>