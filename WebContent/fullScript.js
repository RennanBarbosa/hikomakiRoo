$(document).ready(function() {
	
	$('.dropdown-toggle').dropdown();
	
	//Botao GET para menu
	$.getJSON("http://localhost:8080/hikomki-gami/funcionarios", function(data) {
		$.each(data, function(name, value) {
			$(".dropdown-menu").append("<li><a id="+value.id+" href='#'>ID "+ value.id +" - "+ value.nome + "</a></li>");
		});
	});

	$(".btn-group ul").click(function() {
		alert($('#2').attr('id'));
		//$(".btn-group .btn").html($("a").html());
	});

	function msg(msg) {
		$("#msg").html(
			'<div class="alert alert-success">'+
  				'<button type="button" class="close" data-dismiss="alert">&times;</button>'+
  				'<strong>Sucesso! </strong>'+ msg +
			'</div>'
		);
	};

	function msg2(msg) {
		$("#msg").html(
			'<div class="alert">'+
  				'<button type="button" class="close" data-dismiss="alert">&times;</button>'+
  				'<strong>Atenção! </strong>'+ msg +
			'</div>'
		);
	};

	function resetForm() {
		$(".form-horizontal").each(function(){
	        this.reset();
		});
	};

	//Botao GET para funcionario
	$("#butget").click(function() {
		$("#tabela > tbody").html("");
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

	//Botao GET para mesa
	$("#butgetM").click(function() {
		$("#tabelaMesas > tbody").html("");
		$.getJSON("http://localhost:8080/hikomki-gami/mesas", function(data) {
			$.each(data, function(name, value) {
				$("#tabelaMesas > tbody").append("<tr><td id='cod'>"+ value.id +"</td><td id='nome'>"+ value.nomeMesa +"</td><td id='idFunc'>"+value.funcionario.id+"</td><td id='func'>"+ value.funcionario.nome +"</td><td id='prat'>"+ "" +"</td></tr>");
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
		}).done(function() {
  			resetForm();
  			msg("Cadastro realizado corretamente. Verifique clicando em GET.");
		});
		
		$("#tabela > tbody").html("");
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
		}).done(function() {
  			resetForm();
  			msg("Cadastro realizado corretamente. Verifique clicando em GET.");
		});

		$("#tabelaPratos > tbody").html("");
	});

	//Botao POST para mesa
	$("#butpostM").click(function(){
		$.getJSON("http://localhost:8080/hikomki-gami/funcionarios", function(data) {
			$.each(data, function(name, value) {
				if (value.id == $("#func").val()) {
					var j = {"funcionario":{"dataNasc":value.dataNasc,"id":value.id,"nome":value.nome,"telefone":value.telefone,"turno":value.turno,"version":value.version}, "nomeMesa":$("#nome").val()};
					$.ajax ({
						type: "POST",
    					url: "http://localhost:8080/hikomki-gami/mesas",
    					data: JSON.stringify(j),
    					processData: true,
    					contentType: "application/json"
					}).done(function() {
  						resetForm();
  						msg("Cadastro realizado corretamente. Verifique clicando em GET.");
					});	

					$("#tabelaMesas > tbody").html("");
				}else { msg2("Este funcionário não existe!"); };
			});
		});	
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
					}).done(function() {
  						resetForm();
  						msg("Edição realizada corretamente. Verifique clicando em GET.");
					});
		
					$("#tabela > tbody").html("");
				};
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
					}).done(function() {
  						resetForm();
  						msg("Edição realizada corretamente. Verifique clicando em GET.");
					});
		
					$("#tabelaPratos > tbody").html("");
				};
			};
		});
	});

	//Botao PUT para mesa
	$("#butputM").click(function(){		
		$.getJSON("http://localhost:8080/hikomki-gami/mesas", function(d) {
			$.each(d, function(name, v) {
				if(v.id == $("#idz").val()){

					$.getJSON("http://localhost:8080/hikomki-gami/funcionarios", function(data) {
						$.each(data, function(name, value) {
							if (value.id == $("#func").val()) {
								var j = {"id":$("#idz").val(),"funcionario":{"dataNasc":value.dataNasc,"id":value.id,"nome":value.nome,"telefone":value.telefone,"turno":value.turno,"version":value.version}, "nomeMesa":$("#nome").val(), "version":v.version};
								//var j = {"id":$("#idz").val(), "nome":$("#nome").val(), "version":data[i].version};
								$.ajax ({
									type: "PUT",
    								url: "http://localhost:8080/hikomki-gami/mesas",
    								data: JSON.stringify(j),
    								processData: true,
    								contentType: "application/json"
								}).done(function() {
  									resetForm();
  									msg("Edição realizada corretamente. Verifique clicando em GET.");
								});
		
								$("#tabelaMesas > tbody").html("");
							};
						});
					});	

				};
			});
		});
	});

	//Botao DELETE para funcionario
	$("#butdel").click(function(){	
		$.ajax ({
			type: "DELETE",
    		url: "http://localhost:8080/hikomki-gami/funcionarios/"+$("#idt").val(),
    		processData: true,
    		contentType: "application/json"
		}).done(function() {
  			resetForm();
  			msg("Remoção realizada corretamente. Verifique clicando em GET.");
		});

		$("#tabela > tbody").html("");
	});

	//Botao DELETE pra prato
	$("#butdelP").click(function(){
		$.ajax ({
			type: "DELETE",
    		url: "http://localhost:8080/hikomki-gami/pratoes/"+$("#idm").val(),
    		processData: true,
    		contentType: "application/json"
		}).done(function() {
  			resetForm();
  			msg("Remoção realizada corretamente. Verifique clicando em GET.");
		});

		$("#tabelaPratos > tbody").html("");
	});

	//Botao DELETE pra mesa
	$("#butdelM").click(function(){
		$.ajax ({
			type: "DELETE",
    		url: "http://localhost:8080/hikomki-gami/mesas/"+$("#idz").val(),
    		processData: true,
    		contentType: "application/json"
		}).done(function() {
  			resetForm();
  			msg("Remoção realizada corretamente. Verifique clicando em GET.");
		});

		$("#tabelaMesas > tbody").html("");
	});
});