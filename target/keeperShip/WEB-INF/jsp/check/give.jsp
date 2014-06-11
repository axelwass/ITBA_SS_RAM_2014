<%@ include file="superheader.jsp" %>

<h2>Pagar con cheque</h2>

<form:form class="form-horizontal" method="POST" action="give"
	enctype="multipart/form-data" commandName="otherForm">
	<div class="error">
		<form:errors path="*" />
	</div>
	<fieldset>
		<input type="hidden" name="checkId" value="${check.id}"/>
		<div class="control-group">
			<label class="control-label" for="other">Descripci&oacute;n del pago:
			</label>
			<div class="controls">
				<form:input type="text" class="input-xlarge" path="other" />
			</div>
		</div>
		
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Pagar</button>
		</div>
	</fieldset>

</form:form>
<div class="footer">Los datos con asterisco (*) son abligatorios</div>
<%@ include file="../footer.jsp"%>