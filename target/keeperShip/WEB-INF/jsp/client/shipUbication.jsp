
<%@ include file="superheader.jsp" %>

<div class="dont-print" style="margin:4px">
	<b>Seleccine Galp&oacute;n:</b>
	<c:forEach items="${storHouses}" var="storHouse">
		<a class="sub_menu_button" href="shipUbication?storHouse=${storHouse}">${storHouse.name}</a>
	</c:forEach>
	<br>
</div>

<div class="lista dont-print" id="listaOrigen">
	<c:forEach items="${unubicatedClients}" var="client">
			<div>
			    <div class="item" client-id=${client.id}>
			    	<a href="<c:url value="view"><c:param name="clientId" value="${client.id}" /></c:url>">
			    		${fn:substring(client.shipName,0,7)}
			    	</a><br>
			    	<b class="only-print">${fn:substring(client.name,0,7)}</b>
			    	<c:if test="${not empty client.photo}">
						<img class="img-lancha dont-print" src="<c:url value="../photo/view"><c:param name="imageId" value="${client.photo.id}" /></c:url>" />
					</c:if>
					<c:if test="${empty client.photo}">
						<img class="img-lancha dont-print" src="../../imgs/lancha.jpg" />
					</c:if>
			    </div>
			</div>
	</c:forEach>
	
</div>
 
<form:form style="float:left" class="form-horizontal" method="POST" action="updateUbications" commandName="shipUbicationForm">
 
 	<h3>Galpon ${shipUbicationForm.storHouse.name}</h3>
 	
	<form:input type="hidden" path="storHouse"/>
 
 	<b>Pared derecha:</b>
	<table border=1>
    <c:set var="rows" value="1,2,3,4,5,6" />
    <c:forTokens var="row" items="${rows}" delims=",">
    		<tr>
    			<c:set var="columns" value="a,b,c,d,e,f,g,h,i,j,k,,m,n,o,p,q,r,s,t,u,v,w,x,y,z" />
    		    <c:forTokens var="column" items="${columns}" delims=",">
    				<c:set var="position" value="pared1-${column}${row}"/>
    		
			    		<td>
							<form:input type="hidden" path="ubicationMap[${position}]"/>
						    <div class="item-container">
						    	<c:if test="${not empty shipUbicationForm.ubicationMap[position]}">
									<div>
									    <div class="item" client-id="${shipUbicationForm.ubicationMap[position].id}">
									    	<a href="<c:url value="view"><c:param name="clientId" value="${shipUbicationForm.ubicationMap[position].id}" /></c:url>">
									    		${fn:substring(shipUbicationForm.ubicationMap[position].shipName,0,7)}
									    	</a><br>
			    							<b class="only-print">${fn:substring(shipUbicationForm.ubicationMap[position].name,0,7)}</b>
									    	<c:if test="${not empty shipUbicationForm.ubicationMap[position].photo}">
												<img class="img-lancha dont-print" src="<c:url value="../photo/view"><c:param name="imageId" value="${shipUbicationForm.ubicationMap[position].photo.id}" /></c:url>" />
											</c:if>
											<c:if test="${empty shipUbicationForm.ubicationMap[position].photo}">
												<img class="img-lancha dont-print" src="../../imgs/lancha.jpg" />
											</c:if>
									    </div>
									</div>
								</c:if>
						    </div>
						</td>
    		
    		
    		
    			</c:forTokens>
    		</tr>
    </c:forTokens>
	</table> 
	<br>
	<b>Pared izquierda:</b>
	<table border=1>
    <c:set var="rows" value="1,2,3,4,5,6" />
    <c:forTokens var="row" items="${rows}" delims=",">
    		<tr>
    			<c:set var="columns" value="a,b,c,d,e,f,g,h,i,j,k,,m,n,o,p,q,r,s,t,u,v,w,x,y,z" />
    		    <c:forTokens var="column" items="${columns}" delims=",">
    				<c:set var="position" value="pared2-${column}${row}"/>
			    		<td>
							<form:input type="hidden" path="ubicationMap[${position}]"/>
						    <div class="item-container">
						    	<c:if test="${not empty shipUbicationForm.ubicationMap[position]}">
									<div>
									    <div class="item" client-id="${shipUbicationForm.ubicationMap[position].id}">
									    	<a href="<c:url value="view"><c:param name="clientId" value="${shipUbicationForm.ubicationMap[position].id}" /></c:url>">
									    		${fn:substring(shipUbicationForm.ubicationMap[position].shipName,0,7)}
									    	</a><br>
			    							<b class="only-print">${fn:substring(shipUbicationForm.ubicationMap[position].name,0,7)}</b>
									    	<c:if test="${not empty shipUbicationForm.ubicationMap[position].photo}">
												<img class="img-lancha dont-print" src="<c:url value="../photo/view"><c:param name="imageId" value="${shipUbicationForm.ubicationMap[position].photo.id}" /></c:url>" />
											</c:if>
											<c:if test="${empty shipUbicationForm.ubicationMap[position].photo}">
												<img class="img-lancha dont-print" src="../../imgs/lancha.jpg" />
											</c:if>
									    </div>
									</div>
								</c:if>
						    </div>
						</td>
    			</c:forTokens>
    		</tr>
    </c:forTokens>
	</table> 
	
	<div class="form-actions dont-print">
		<button type="submit" class="btn btn-primary">Salvar ubicaciones</button>
		<a id="print-button" class="btn btn-primary">Imprimir</a>
	</div>
</form:form>

<%@ include file="../footer.jsp" %>