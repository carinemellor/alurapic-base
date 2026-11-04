      # language: pt
      Funcionalidade: Cadastro de novos usuários no AluraPic
      Como um visitante do sistema
      Quero criar uma nova conta
      Para compartilhar fotos e interagir na comunidade

      Contexto:
      Dado que eu estou na página de cadastro do AluraPic

      Cenário: Cadastro realizado com sucesso
      Quando eu preencho o campo de email com "carine@exemplo.com"
      E preencho o campo de nome completo com "Carine Tester"
      E preencho o campo de nome de usuário com "carinetest"
      E preencho o campo de senha com "12345678"
      E clico no botão "Register"
      Então o sistema deve cadastrar o usuário com sucesso
      E deve redirecionar para a tela inicial de login

      Cenário: Mensagens de validação ao sair dos campos vazios
      Quando eu toco nos campos obrigatórios e não preencho nenhum valor
      Então o sistema deve exibir as seguintes mensagens de validação:
      | Email is required!     |
      | Full name is required! |
      | User name is required! |
      | Password is required!  |
      E ao clicar em "Register" o formulário não deve ser enviado

      Cenário: Tentativa de cadastro com email inválido sem arroba
      Quando eu preencho o campo de email com "email-invalido"
      Então o sistema deve exibir a mensagem "Invalid e-mail"

      Cenário: Formato de email sem domínio final (Bug / Melhoria)
      Quando eu preencho o campo de email com "carine@exemplocom"
      Então o sistema deveria exibir "Invalid e-mail" mas não exibe devido à validação permissiva

      Cenário: Nome de usuário contendo letras maiúsculas
      Quando eu preencho o campo de nome de usuário com "CarineTest"
      Então o sistema deve exibir a mensagem "Must be lower case"

      Cenário: Nome de usuário já cadastrado
      Quando eu preencho o campo de nome de usuário com "flavio"
      Então o sistema deve exibir a mensagem "Username already taken"

      Cenário: Nome de usuário e senha com valores idênticos
      Quando eu preencho o campo de nome de usuário com "carine"
      E preencho o campo de senha com o mesmo valor "carine"
      E clico no botão "Register"
      Então o sistema deve exibir a mensagem "Username and password must be different"

      Esquema do Cenário: Validação de tamanho mínimo dos campos
      Quando eu preencho o campo "<campo>" com o valor "<valor>"
      Então o sistema deve exibir a mensagem "<mensagem_esperada>"

      Exemplos:
      | campo            | valor | mensagem_esperada   |
      | fullName         | s     | Mininum length is 2 |
      | registerUserName | a     | Mininum length is 2 |
      | registerPassword | ....  | Mininum length is 8 |

Cenário: Nome completo contendo números ou caracteres especiais (Bug / Melhoria)
Quando eu preencho o campo de nome completo com "Carine 12"
Então o sistema não deveria aceitar números no nome completo do usuário
