<%@ include file="header.jsp"%>
<c:if test="${!empty client}">
	
	<c:if test="${!empty fileList}">
		<div class="well">
			<h3>Archivos:</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Descripc&oacute;n</th>
						<th>Opciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${fileList}" var="file">
						<tr>
							<td>${file.name}</td>
							<td>${file.description}</td>
							<td><a
								href="download?clientId=${client.id}">Descargar</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	

	<form:form class="well form-horizontal" method="POST" action="saveFile"
		commandName="fileForm">

		<div class="error">
			<form:errors path="*" />
		</div>

		<input type="hidden" name="clientId" value="${client.id}" />
		<div class="control-group">
			<label class="control-label" for="method">Nombre: </label>
			<div class="controls">
				<form:input type="text" class="input-large" path="name" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="ammount">Descripci&oacute;n: </label>
			<div class="controls">
				<form:input type="text" class="input-large" path="description" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="ammount">Archivo: </label>
			<div class="controls">
				<input type="file" name="file" id="file"></input>
			</div>
		</div>
		<input type="submit" name="submit" value="Guardar" class="btn" />
	</form:form>
</c:if>



<%@ include file="../footer.jsp"%>