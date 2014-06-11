<%@ include file="header.jsp" %>
<h2>Caja del d&iacute;a</h2><h4>${todayDate} </h4> <c:if test="${resultPage.pages > 1}"><a href="todayCashPrintable"> Ver en una p&aacute;gina</a></c:if>




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
		<tr>
			<th>Saldo inicial:</th>
			<th></th>
			<th></th>
			<th class="price"><c:if test="${previousAmmount < 0}"><font color="red"></c:if><fmt:formatNumber value="${previousAmmount}" 
            type="currency"/><c:if test="${previousAmmount < 0}"></font></c:if></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
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
				<td>${transaction.client.uniqueDesc}</td>
				<td>${transaction.user.name}</td>
				<td><a
					href="<c:url value="view">
													<c:param name="transactionId" value="${transaction.id}" />
												</c:url>">
						ver </a></td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
    <tr>
      <th>Saldo total:</th>
				<td></td>
				<td></td>
				<th class="price"><c:if test="${finalAmmount < 0}"><font color="red"></c:if><fmt:formatNumber value="${finalAmmount}" 
            type="currency"/><c:if test="${finalAmmount < 0}"></font></c:if></th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
    </tr>
  </tfoot> 
</table>

<c:if test="${resultPage.pages > 1}">
	<c:forEach var="page" begin="0" end="${resultPage.pages -1}" step="1">

		<a
			href="todayCash?actualPage=${page}&pageSize=${pageSize}"><c:if
				test="${actualPage == page}">
				<b>
			</c:if>${page+1}<c:if test="${actualPage == page}">
				</b>
			</c:if> </a>

	</c:forEach>
</c:if>

<div class="form-actions dont-print">
		<a class="btn btn-primary" href="../transaction/addCashTransaction">Ingreso de caja</a>
		<a class="btn btn-primary" href="../transaction/addNegativeCashTransaction">Egreso de caja</a>
</div>
<c:if test="${resultPage.pages <= 1}">
<div class="form-actions dont-print">
	<a id="print-button" class="btn btn-primary">Imprimir</a>
</div>
</c:if>

<%@ include file="../footer.jsp"%>