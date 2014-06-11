<%@ include file="superheader.jsp" %>

<h2>Busqueda de cheques</h2>

<form:form class="form-horizontal" method="GET" action="searchResults"
	commandName="checkSearchForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<form:input type="hidden" path="page" value="0" />
	<fieldset>

		<div class="control-group">
			<label class="control-label" for="id">ID de cheque: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="id" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="number">N&uacute;mero de
				cheque: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="number" />
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
			<label class="control-label" for="fromPayDate">Vencimiento
				(DD/MM/AAAA) desde: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="fromPayDate" />
			</div>
			<label class="control-label" for="toPayDate">Hasta: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="toPayDate" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="fromEntryDate">Ingresado
				(DD/MM/AAAA) desde: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="fromEntryDate" />
			</div>
			<label class="control-label" for="toEntryDate">Hasta: </label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="toEntryDate" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="entryBy">Ingresado por:</label>
			<div class="controls">
				<form:select path="entryBy">
					<form:option value="0" label="Todos" />
					<form:options items="${userList}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bankAccount">Depositado en:</label>
			<div class="controls">
				<form:select path="bankAccount">
					<form:option value="0" label="Todos" />
					<form:options items="${bankAccountList}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bank">Banco:</label>
			<div class="controls">
				<form:select path="bank">
					<form:option value="0" label="Todos" />
					<form:options items="${bankList}" itemValue="id" itemLabel="name" />
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
			<label class="control-label" for="status">Estado:</label>
			<div class="controls">
				<form:select path="status">
					<form:option value="">Seleccione estado</form:option>
					<form:options />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="pageSize">Cheques por
				p&aacute;gina:</label>
			<div class="controls">
				<form:select path="pageSize">
					<form:option value="20" label="20" />
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
</table>

<c:if test="${resultPage.pages > 0}">
	<c:forEach var="page" begin="0" end="${resultPage.pages -1}" step="1">

		<a
			href="searchResults?page=${page}&id=${checkSearchForm.id}&number=${checkSearchForm.number}&fromValue=${checkSearchForm.fromValue}&toValue=${checkSearchForm.toValue}&fromPayDate=${checkSearchForm.fromPayDate}&toPayDate=${checkSearchForm.toPayDate}&fromEntryDate=${checkSearchForm.fromEntryDate}&toEntryDate=${checkSearchForm.toEntryDate}<c:if test="${not empty checkSearchForm.entryBy}">&entryBy=${checkSearchForm.entryBy.id}</c:if><c:if test="${not empty checkSearchForm.bank}">&bank=${checkSearchForm.bank.id}</c:if><c:if test="${not empty checkSearchForm.client}">&client=${checkSearchForm.client.id}</c:if>&status=${checkSearchForm.status}&pageSize=${checkSearchForm.pageSize}"><c:if
				test="${page == checkSearchForm.page}">
				<b>
			</c:if>${page+1}<c:if test="${checkSearchForm.page == page}">
				</b>
			</c:if></a>

	</c:forEach>
</c:if>



<%@ include file="../footer.jsp"%>