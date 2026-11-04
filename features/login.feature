Funcionalidade: Login no sistema AluraPic
  Como um usuário registrado
  Quero acessar minha conta
  Para visualizar e postar fotos


Cenário: Login com credenciais inválidas
  Dado que eu estou na página inicial de login do AluraPic
  Quando eu preencho o campo de usuário com "carine"
  E preencho o campo de senha com "senha-errada"
  E clico no botão "Login"
  Então o sistema deve exibir a mensagem "usuário ou senha inválidos"
  # Passou. Evidências no relatorio.

Cenário: Botão de login inativo com formulário vazio
  Dado que eu estou na página inicial de login do AluraPic
  Quando os campos de usuário e senha estão em branco
  Então o botão "Login" deve permanecer inativo (desabilitado)
  
   