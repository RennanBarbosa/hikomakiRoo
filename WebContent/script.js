$(document).ready(function() {
	$("#butget").click(function() {
		$.getJSON("http://localhost:8080/hikomki-gami/pratoes", function(data) {
			$.each(data, function() {
  				$.each(this, function(name, value) {
    				$("#main").append(name + ": "+ value + "<br>");
  				});
			});
		});
	});
});	


$("#").click(function() {
		$.getJSON("http://localhost:8080/hikomki-gami/pratoes", function(data) {
			$.each(data, function(name, value) {
  				$("#main").append(value.nome + "<br>" + value.ingredientes + "<br>");
			});
		});
	});
});