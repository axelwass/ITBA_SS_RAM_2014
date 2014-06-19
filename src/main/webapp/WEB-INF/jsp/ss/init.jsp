<%@ include file="../header.jsp" %>

			<img style="float:left;" src="getHisogram" onload="refreshIt(this)" onerror="refreshIt(this)">


			<div class="well" style="float:right;">
				Simulation time: ${simulationForm.simulationTime} <br>
				Memory size: ${simulationForm.memorySize} <br>
				List order: ${simulationForm.order} <br>
				Bin range: ${simulationForm.range} <br>
				Context aplication: ${simulationForm.context} <br>
				<br>
				<br>
				<br>
				<form action="stop" method="POST">
				    <button type="submit"  class="btn btn-primary">Parar Simulacion</input>
				</form>
			</div>

<%@ include file="../footer.jsp" %>