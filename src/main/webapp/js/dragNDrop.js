$(document).ready(function(){
	$(".item").draggable({revert:"invalid"});


	$(".item-container").droppable({
		accept: ".item",
		drop: function(ev, ui) {
			if($(this).html()){
				$("#listaOrigen").append($(this).children());
			}
			$(this).html("<div></div>");
			$(this).children().append($(ui.helper).parent().html());
			$(this).children().children().attr('style','');
			$(this).children().children().draggable({revert:"invalid"});
			$(this).parent().children("input").attr("value", $(ui.helper).attr("client-id"));
			if($(ui.helper).parent().parent().parent().children("input").attr("value")){
				$(ui.helper).parent().parent().parent().children("input").attr("value","");
			}
			$(ui.helper).parent().remove();
		}
	});
	
	$("#listaOrigen").droppable({
		accept: ".item",
		drop: function(ev, ui) {
			$(this).append("<div>" + $(ui.helper).parent().html() + "</div>");
			$("#listaOrigen div:last").attr('style','');
			$("#listaOrigen div:last").draggable({revert:"invalid"});
			if($(ui.helper).parent().parent().parent().children("input").attr("value")){
				$(ui.helper).parent().parent().parent().children("input").attr("value","");
			}
			$(ui.helper).parent().remove();
		}
	});
});