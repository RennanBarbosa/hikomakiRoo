Criado o serviço JSON para as três entidades. 

Passo do pdf:
service --interface ~.servico.TarefaService --entity ~.modelo.Tarefa
json add --class ~.modelo.Tarefa

Criação dos serviços:
service --interface ~.servico.PratoService --entity ~.domain.Prato
service --interface ~.servico.MesaService --entity ~.domain.Mesa
service --interface ~.servico.FuncionarioService --entity ~.domain.Funcionario


Feito para as três, web mvc json all tbm feito.
web mvc json setup não pegou aqui, porém tudo funciona, grato ao lord SITH.

Para testar com cURL e para fazer o .js, veja abaixo as uri's dos serviços:

curl -X GET http://localhost:8080/hikomki-gami/pratoes - lista tudo
curl -X GET http://localhost:8080/hikomki-gami/pratoes/{1} - lista pelo id

Para as outras entidades funciona da mesma forma.

Outras entidades:
http://localhost:8080/hikomki-gami/mesas
http://localhost:8080/hikomki-gami/funcionarios

Obs.: Lembrar de rodar o server.



