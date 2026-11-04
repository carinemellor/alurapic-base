# language: pt
Funcionalidade: Login no sistema AluraPic
Como um usuário registrado
Quero acessar minha conta
Para visualizar e postar fotos

Contexto:
Dado que eu estou na página inicial de login do AluraPic

Cenário: Login com credenciais válidas
Quando eu preencho o campo de usuário com "carine@exemplo.com"
E preencho o campo de senha com "12345678"
E clico no botão "Login"
Então o sistema deve redirecionar para a página da timeline
E deve exibir o nome de usuário "carinetest" no cabeçalho
# Passou. Evidências no relatório.

Cenário: Login com credenciais inválidas
Quando eu preencho o campo de usuário com "carine"
E preencho o campo de senha com "senha-errada"
E clico no botão "Login"
Então o sistema deve exibir o alerta "Invalid user name or password"
# Passou. Evidências no relatório.

Cenário: Botão de login inativo com formulário vazio
Quando os campos de usuário e senha estão em branco
Então o botão "Login" deve permanecer inativo (desabilitado)
# Passou. Evidências no relatório.

Cenário: Realizar logout do sistema
Dado que eu realizei o login com "flavio" e senha "123"
Quando eu clico na opção "(Logout)" no cabeçalho
Então o sistema deve encerrar a sessão
E deve exibir a mensagem de boas-vindas "Please, login!"

Cenário: Realizar novo login do sistema com outro usuário
Quando eu preencho o campo de usuário com "flavio"
E preencho o campo de senha com "123"
E clico no botão "Login"
Então o sistema deve redirecionar para a página da timeline
E deve exibir o nome de usuário "flavio" no cabeçalho
# Passou. Evidências no relatório.
