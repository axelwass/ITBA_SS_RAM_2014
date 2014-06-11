<%@ include file="header.jsp"%>



<c:if test="${!empty client}">

	<div class="well dont-print">
		<b>Autorizados: </b>${client.autorizated}
	</div>


	<div class="well dont-print">
		<h3>Salidas:</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Dia de salida</th>
					<th>Dia de retorno planificado</th>
					<th>Dia de retorno</th>
					<th>Tripulacion</th>
					<th>Seccion</th>
					<th>Autorizacion especial</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${departureList}" var="departure">
					<c:if test="${!empty departure.realReturnDate}">
						<tr>
							<td>${departure.date.dayOfMonth}/${departure.date.monthOfYear}/${
										departure.date.year}</td>
							<td>${departure.returnDate.dayOfMonth}/${departure.returnDate.monthOfYear}/${
									departure.returnDate.year}</td>
							<td>${departure.realReturnDate.dayOfMonth}/${departure.realReturnDate.monthOfYear}/${
									departure.realReturnDate.year}</td>
							<td>${departure.tripulation}</td>
							<td>${departure.section}</td>
							<td><c:if test="${not empty departure.user}">${departure.user.name}</c:if></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${pages > 1}">
	<c:forEach var="page" begin="0" end="${pages -1}" step="1">

		<a
			href="traceDepartures?clientId=${client.id}&page=${page}&pageSize=${pageSize}"><c:if
				test="${page == currentPage}">
				<b>
			</c:if>${page+1}<c:if test="${currentPage == page}">
				</b>
			</c:if></a>

	</c:forEach>
</c:if>
	</div>
	
	<c:if test="${empty client.actualDeparture}">
		
		<div class="form-actions dont-print">
			<a class="btn btn-primary" href="newDeparture?clientId=${client.id}">Nueva Salida</a>
		</div>
	</c:if>
	<c:if test="${!empty client.actualDeparture}">
		<div class="only-print">
			<br>
			<div class="factura">
				-----------------------<br>
				*      Tiket de salida    *<br>
				-----------------------<br>
				${client.number} ${client.name}<br>
				<br>
				${client.shipName}(${client.shipModel})<br>
				${client.shipMatricle}<br>
				<br>
				${client.actualDeparture.date.dayOfMonth}/${client.actualDeparture.date.monthOfYear}/${
										client.actualDeparture.date.year}<br>
				<br>
				Autorizados:<br> 
				${client.autorizated}<br>
				
				
				-----------------------<br>
				<br>
			</div>
		</div>
	
		<div class="well dont-print">
			<h3>Salida actual:</h3>
			
			<b>Dia de salida:</b>${client.actualDeparture.date.dayOfMonth}/${client.actualDeparture.date.monthOfYear}/${
										client.actualDeparture.date.year}
				<br/>			
			<b>Tripulacion:</b>${client.actualDeparture.tripulation}
			<br/>
			<b>Seccion:</b>${client.actualDeparture.section}
			<br/>
			<b>Dia de regreso:</b>${client.actualDeparture.returnDate.dayOfMonth}/${client.actualDeparture.returnDate.monthOfYear}/${
										client.actualDeparture.returnDate.year}
			
			<a class="btn btn-primary" style="float:right" href="newDeparture?clientId=${client.id}">Modificar Salida</a>
		
			<form:form method="POST" action="newArrival" style="float:right">
					<input type="hidden" name="clientId" value="${client.id}" />
					<button type="submit" class="btn btn-primary">Retorno</button>
			</form:form>
			<a class="btn btn-primary" style="float:right" id="print-button">Imprimir</a>
		</div>
		
	</c:if>
</c:if>

<%@ include file="../footer.jsp"%>