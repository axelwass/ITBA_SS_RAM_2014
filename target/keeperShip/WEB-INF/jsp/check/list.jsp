<%@ include file="superheader.jsp" %>

<c:if test="${checkStatus eq 'NOTPAID'}"><h2>Cheques en cartera</h2></c:if>
<c:if test="${checkStatus eq 'REJECTED'}"><h2>Cheques rechazados</h2></c:if>


<table class="table table-striped">
	<thead>
		<tr>
			<th>ID</th>
			<th>Ingreso</th>
			<th>Monto</th>
			<th>Vencimiento</th>
			<th>N&uacute;mero</th>
			<th>Banco</th>
			<th>Barco</th>
			<th>Ingresado por</th>
			<th>Detalle</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${resultPage.checks}" var="check">
			<tr>
				<td>${check.id}</td>
				<td>${check.entryDate.dayOfMonth}/${check.entryDate.monthOfYear}/${check.entryDate.year}</td>
				<td class="price"><fmt:formatNumber value="${check.value}" type="currency"/></td>
				<td>${check.payDate.dayOfMonth}/${check.payDate.monthOfYear}/${check.payDate.year}</td>
				<td>${check.number}</td>
				<td>${check.bank.name}</td>
				<td>${check.client.uniqueDesc}</td>
				<td>${check.entryBy.name}</td>
				<td><c:if test="${check.status eq 'NOTPAID'}"><img class="icon" src="../../imgs/notpaidIcon.png"/></c:if>
				<c:if test="${check.status eq 'PAID'}"><img class="icon" src="../../imgs/paidIcon.png"/></c:if>
				<c:if test="${check.status eq 'GIVEN'}"><img class="icon" src="../../imgs/paidIcon.png"/></c:if>
				<c:if test="${check.status eq 'REJECTED'}"><img class="icon" src="../../imgs/rejectedIcon.png"/></c:if>
				<a
					href="<c:url value="view">
													<c:param name="checkId" value="${check.id}" />
												</c:url>">
						ver </a></td>
			</tr>
		</c:forEach>
	</tbody>
	<c:if test="${checkStatus eq 'NOTPAID'}"><tfoot>
    <tr>
      <td><b>Monto total:</b></td>
				<td></td>
				<td class="price"><b><fmt:formatNumber value="${total}" type="currency"/></b></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
    </tr>
  </tfoot></c:if> 
</table>

<c:if test="${resultPage.pages > 1}">
	<c:forEach var="page" begin="0" end="${resultPage.pages -1}" step="1">

		<a
			href="<c:if test="${check.status eq 'REJECTED'}">rejected</c:if>?page=${page}&pageSize=${resultPage.pageSize}"><c:if
				test="${page == currentPage}">
				<b>
			</c:if>${page+1}<c:if test="${currentPage == page}">
				</b>
			</c:if></a>

	</c:forEach>
</c:if>



<%@ include file="../footer.jsp"%>