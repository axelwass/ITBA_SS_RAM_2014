<%@ include file="superheader.jsp" %>


<h2>Modificar banco</h2>
						
						<form:form class="form-horizontal" method="POST" action="edit" commandName="bankForm">
						<div class="error"><form:errors path="*" /></div>
							<fieldset>
								<div class="control-group">
									<label class="control-label" for="bankId">Nombre anterior:</label>
										<div class="controls">
              								<form:select path="bankId">
												<form:options items="${bankList}" itemValue="id" itemLabel="name"/>
     								         </form:select>
      							      </div>
								</div>
						
								<div class="control-group">
        						    <label class="control-label" for="bankName">Nombre del banco: </label>
        						    <div class="controls">
        						    	<form:input type="text" class="input-xlarge" path="bankName"/>
       							    </div>
          						</div>
								<div class="form-actions">
            						<button type="submit" class="btn btn-primary">Modificar</button>
          						</div>
							</fieldset>
						</form:form>
<%@ include file="../footer.jsp" %>