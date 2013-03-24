$(document).ready(function() {
	$("#butget").click(function() {
		$.getJSON("http://localhost:8080/hikomki-gami/funcionarios", function(data) {
			for (var i = data.length - 1; i >= 0; i--) {
				$("#tabela").append("<tr><td>"+ data[i].nome + "</td>" + "<td>"+ data[i].telefone + "</td>" + "<td>"+ data[i].turno + "</td></tr>");
			};
		});
	});

	$("#butpost").click(function(){
		var j = {"dataNasc":$("#data").val(), "nome":$("#nome").val(), "telefone":$("#tel").val(), "turno":$("#turno").val()};
		//var j = {"dataNasc": "10/10/1010", "nome":"luluzinha", "telefone": "88888888", "turno":"night"};
		
		//alert(JSON.stringify(j));

		$.ajax ({
			type: "POST",
    		url: "http://localhost:8080/hikomki-gami/funcionarios",
    		data: JSON.stringify(j),
    		processData: true,
    		contentType: "application/json"
		}).done(function(res) { 
			alert('done') 
		});
		
		//$.post("http://localhost:8080/hikomki-gami/funcionarios", {"dataNasc":25/03/1666, "nome":HellBitch, "telefone":(83)00001000, "turno":Manhã});

	});
});