Criado o serviço JSON para as três entidades. 
Passo do pdf:
service --interface ~.servico.TarefaService --entity ~.modelo.Tarefa
json add --class ~.modelo.Tarefa

service --interface ~.servico.PratoService --entity ~.domain.Prato

service --interface ~.servico.MesaService --entity ~.domain.Mesa

service --interface ~.servico.FuncionarioService --entity ~.domain.Funcionario


Feito para as três, web mvc json all tbm feito.
web mvc json setup n pegou aqui, porém tudo funciona, grato ao lord SITH.


Se quiser testar com o curl e para fazer o .js as url dos serviços:
http://localhost:8080/hikomki-gami/pratoes
http://localhost:8080/hikomki-gami/mesas
http://localhost:8080/hikomki-gami/funcionarios
(tem q rodar o server primeiro #fikdik)



