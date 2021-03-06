$(document).ready(function() {
	$("#butget").click(function() {
		$.getJSON("http://localhost:8080/hikomki-gami/funcionarios", function(data) {
			for (var i = data.length - 1; i >= 0; i--) {
				$("#tabela > tbody").append("<tr><td id='cod'>"+ data[i].id +"</td><td id='nome'>"+ data[i].nome + "</td>" + "<td id='tel'>"+ data[i].telefone + "</td>" + "<td id='turno'>"+ data[i].turno + "</td></tr>");
			};
		});
	});

	$("#butpost").click(function(){
		var j = {"dataNasc":$("#data").val(), "nome":$("#nome").val(), "telefone":$("#tel").val(), "turno":$("#turno").val()};

		$.ajax ({
			type: "POST",
    		url: "http://localhost:8080/hikomki-gami/funcionarios",
    		data: JSON.stringify(j),
    		processData: true,
    		contentType: "application/json"
		});

		$("#tabela > tbody").html("");
		alert($("#nome").val()+ " adicionado com sucesso! Use o get e o verá na tabela.");
	});


	$("#butput").click(function(){		

		$.getJSON("http://localhost:8080/hikomki-gami/funcionarios", function(data) {
			for (var i = data.length - 1; i >= 0; i--) {
				if(data[i].id == $("#idt").val()){
					var j = {"dataNasc":$("#data").val(), "id":$("#idt").val(), "nome":$("#nome").val(), "telefone":$("#tel").val(), "turno":$("#turno").val(), "version":data[i].version};

					$.ajax ({
						type: "PUT",
    					url: "http://localhost:8080/hikomki-gami/funcionarios",
    					data: JSON.stringify(j),
    					processData: true,
    					contentType: "application/json"
					});
		
					$("#tabela > tbody").html("");
					alert($("#nome").val()+ " alterado com sucesso! Use o get e o verá na tabela.");
				}
			};
		});

	});

	$("#butdel").click(function(){
		
		$.ajax ({
			type: "DELETE",
    		url: "http://localhost:8080/hikomki-gami/funcionarios/"+$("#idt").val(),
    		processData: true,
    		contentType: "application/json"
		});

		$("#tabela > tbody").html("");
		alert("Excluído com sucesso! Use o get e o verá na tabela.");

	});
});