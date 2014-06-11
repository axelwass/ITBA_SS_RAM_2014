<%@ include file="../header.jsp"%>



<div class="well">
	<h2>Agenda de advertencias:</h2>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Fecha</th>
				<th>Horario</th>
				<th>Destino</th>
				<th>Se hablo con</th>
				<th>Cliente</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${scheduledWornings}" var="worningPlan">
				<tr>
					<td>${worningPlan.date.dayOfMonth}/${worningPlan.date.monthOfYear}/${
								worningPlan.date.year}</td>
					<td>${worningPlan.hours}</td>
					<td>${worningPlan.to}</td>
					<td>${worningPlan.spokeTo}</td>
					<td>
						<a href="<c:url value="traceWornings">
								<c:param name="clientId" value="${worningPlan.client.id}" />
							</c:url>">${worningPlan.client.name}
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="../footer.jsp"%>