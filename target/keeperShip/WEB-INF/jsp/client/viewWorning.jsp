<%@ include file="header.jsp"%>



	<div class="well">
		<h3>Advertencia:</h3>		
		<b>Medio: </b>${worning.type.name}<br>
		<b>Destino(mail/telefono): </b>${worning.to}<br>
		<b>Hable con: </b>${worning.spokeTo}<br>
		<b>Titulo: </b>${worning.title}<br>
		<b>Comentarios/texto: </b><br>
		${worning.text}
	</div>
<%@ include file="../footer.jsp"%>