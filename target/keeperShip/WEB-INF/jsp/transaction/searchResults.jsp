<%@ include file="header.jsp" %>
<h2>Busqueda de transacciones</h2>

<form:form class="form-horizontal" method="GET" action="searchResults"
	commandName="transactionSearchForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<form:input type="hidden" path="page" value="0" />
	<fieldset>

		<div class="control-group">
			<label class="control-label" for="id">ID de
				transacci&oacute;n: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="id" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name">Descripci&oacute;n: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="name" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="client">Rubro:</label>
			<div class="controls">
				<form:select path="rubro">
					<form:option value="0" label="Todos" />
					<form:options items="${rubroList}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="fromValue">Desde: ($)</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="fromValue" />
			</div>
			<label class="control-label" for="toValue">Hasta: ($)</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="toValue" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="fromTransactionDate">Ingresada
				(DD/MM/AAAA) desde: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge"
					path="fromTransactionDate" />
			</div>
			<label class="control-label" for="toTransactionDate">Hasta: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge"
					path="toTransactionDate" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="transactionBy">Ingresado
				por:</label>
			<div class="controls">
				<form:select path="transactionBy">
					<form:option value="0" label="Todos" />
					<form:options items="${userList}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bank">Cuenta de banco:</label>
			<div class="controls">
				<form:select path="bankAccount">
					<form:option value="0" label="Todos" />
					<form:options items="${bankAccountList}" itemValue="id"
						itemLabel="name" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="client">Cliente:</label>
			<div class="controls">
				<form:select path="client">
					<form:option value="0" label="Todos" />
					<form:options items="${clientList}" itemValue="id" itemLabel="uniqueDesc" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="pageSize">Transacciones por
				p&aacute;gina:</label>
			<div class="controls">
				<form:select path="pageSize">
					<form:option value="10" label="10" />
					<form:option value="50" label="50" />
					<form:option value="100" label="100" />
					<form:option value="500" label="500" />
				</form:select>
			</div>
		</div>

		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Buscar</button>
		</div>
	</fieldset>
</form:form>


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
				<td  class="price"><c:if test="${transaction.ammount < 0}"><font color="red"></c:if><fmt:formatNumber value="${transaction.ammount}" 
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
				<th class="price"><c:if test="${totalAmmount < 0}"><font color="red"></c:if><fmt:formatNumber value="${totalAmmount}" 
            type="currency"/><c:if test="${totalAmmount < 0}"></font></c:if></th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
    </tr>
  </tfoot> 
</table>

<c:if test="${resultPage.pages > 0}">
	<c:forEach var="page" begin="0" end="${resultPage.pages -1}" step="1">

		<a
			href="searchResults?page=${page}&id=${transactionSearchForm.id}&name=${transactionSearchForm.name}<c:if test="${not empty transactionSearchForm.rubro}">&rubro=${transactionSearchForm.rubro.id}</c:if>&fromValue=${transactionSearchForm.fromValue}&toValue=${transactionSearchForm.toValue}&fromTransactionDate=${transactionSearchForm.fromTransactionDate}&toTransactionDate=${transactionSearchForm.toTransactionDate}<c:if test="${not empty transactionSearchForm.transactionBy}">&transactionBy=${transactionSearchForm.transactionBy.id}</c:if><c:if test="${not empty transactionSearchForm.bankAccount}">&bankAccount=${transactionSearchForm.bankAccount.id}</c:if><c:if test="${not empty transactionSearchForm.client}">&client=${transactionSearchForm.client.id}</c:if>&pageSize=${transactionSearchForm.pageSize}"><c:if
				test="${transactionSearchForm.page == page}">
				<b>
			</c:if>${page+1}<c:if test="${transactionSearchForm.page == page}">
				</b>
			</c:if> </a>

	</c:forEach>
</c:if>



<%@ include file="../footer.jsp"%>