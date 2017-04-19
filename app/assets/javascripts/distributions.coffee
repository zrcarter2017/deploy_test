# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#distributions').DataTable();

	$(document).ready(function() {
		var slider = $("#the_slider").slider({
		    range: true,
		    min: 200,
		    max: 500,
		    values: [250, 450],
		    slide: function(event, ui) {
		        $("#thing_data1").val(ui.values[0]);
		        $("#thing_data2").val(ui.values[1]);
		    }
		});
		$("#thing_data1").val(slider.slider("values")[0]);
		$("#thing_data2").val(slider.slider("values")[1]);
	});
