$(document).ready(function() {
	//Botao GET para funcionario
	$("#butget").click(function() {
		//$("#tabela > tbody").html("");
		$.getJSON("http://localhost:8080/hikomki-gami/funcionarios", function(data) {
			$.each(data, function(name, value) {
				$("#tabela > tbody").append("<tr><td id='cod'>"+ value.id +"</td><td id='nome'>"+ value.nome + "</td><td id='tel'>"+ value.telefone + "</td><td id='turno'>"+ value.turno + "</td></tr>");
			});
		});
	});

	//Botao GET para prato
	$("#butgetP").click(function() {
		$("#tabelaPratos > tbody").html("");
		$.getJSON("http://localhost:8080/hikomki-gami/pratoes", function(data) {
			$.each(data, function(name, value) {
				$("#tabelaPratos > tbody").append("<tr><td id='cod'>"+ value.id +"</td><td id='nome'>"+ value.nome +"</td><td id='ingredientes'>"+ value.ingredientes +"</td><td id='preco'>"+ value.preco +"</td></tr>");
			});
		});
	});

	//Botao POST para funcionario
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

	//Botao POST para prato
	$("#butpostP").click(function(){
		var j = {"nome":$("#nomep").val(), "ingredientes":$("#ingred").val(), "preco":$("#preco").val()};

		$.ajax ({
			type: "POST",
    		url: "http://localhost:8080/hikomki-gami/pratoes",
    		data: JSON.stringify(j),
    		processData: true,
    		contentType: "application/json"
		});

		$("#tabelaPratos > tbody").html("");
		alert($("#nomep").val()+ " adicionado com sucesso! Use o get e o verá na tabela.");
	});

	//Botao PUT para funcionario
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

	//Botao PUT para Prato
	$("#butputP").click(function(){		
		$.getJSON("http://localhost:8080/hikomki-gami/pratoes", function(data) {
			for (var i = data.length - 1; i >= 0; i--) {
				if(data[i].id == $("#idm").val()){
					var j = {"id":$("#idm").val(), "nome":$("#nomep").val(), "ingredientes":$("#ingred").val(), "preco":$("#preco").val(), "version":data[i].version};
					$.ajax ({
						type: "PUT",
    					url: "http://localhost:8080/hikomki-gami/pratoes",
    					data: JSON.stringify(j),
    					processData: true,
    					contentType: "application/json"
					});
		
					$("#tabelaPratos > tbody").html("");
					alert($("#nomep").val()+ " alterado com sucesso! Use o get e o verá na tabela.");
				}
			};
		});
	});

	//Botao DELETE para funcionario
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

	//Botao DELETE pra prato
	$("#butdelP").click(function(){
		$.ajax ({
			type: "DELETE",
    		url: "http://localhost:8080/hikomki-gami/pratoes/"+$("#idm").val(),
    		processData: true,
    		contentType: "application/json"
		});

		$("#tabelaPratos > tbody").html("");
		alert("Excluído com sucesso! Use o get e o verá na tabela.");
	});
});