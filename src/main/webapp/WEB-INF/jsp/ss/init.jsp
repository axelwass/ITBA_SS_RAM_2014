<%@ include file="../header.jsp" %>

			<img src="getHisogram" onload="refreshIt(this)" onerror="refreshIt(this)">

			<form action="stop" method="POST">
			    <button type="submit"  class="btn btn-primary">Parar Simulacion</input>
			</form>

<%@ include file="../footer.jsp" %>