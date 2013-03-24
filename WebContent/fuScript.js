$(document).ready(function() {
	$("#butget").click(function() {
		$.getJSON("http://localhost:8080/hikomki-gami/funcionarios", function(data) {
			$.each(data, function() {
  				$.each(this, function(name, value) {
    				$("#main").append(name + ": "+ value + "<br>");
  				});
			});
		});
	});
});	