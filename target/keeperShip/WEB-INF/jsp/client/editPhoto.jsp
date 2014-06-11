<%@ include file="header.jsp"%>
	
	<form:form class="well form-horizontal" method="POST" action="uploadPhoto" enctype="multipart/form-data" commandName="photoForm">
				<div class="error"><form:errors path="*" /></div>	
						
				<input type="hidden" name="clientId" value="${client.id}"/>
				
				<div class="control-group">
					<label class="control-label" for="active">Imagen:</label>
					<div class="controls">
						<form:input name="photo" type="file" path="fileData"/>
					</div>
				</div>
				
				
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">Enviar</button>
				</div>
				
	</form:form>
	
<%@ include file="../footer.jsp" %>	