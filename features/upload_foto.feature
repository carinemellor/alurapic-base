# language: pt
Funcionalidade: Upload de novas fotos
Como um usuário autenticado
Quero fazer upload de fotos com descrição
Para compartilhar momentos na minha timeline

Contexto:
Dado que eu estou autenticado no AluraPic
E navego até a página de upload de fotos

Cenário: Publicação de foto com sucesso
Quando eu seleciono um arquivo de imagem válido
E preencho a descrição com exatamente 300 caracteres
E mantenho a opção de permitir comentários marcada
E clico no botão "Upload"
Então o sistema deve enviar a foto
E deve redirecionar para a timeline do usuário
E deve exibir a mensagem de confirmação "Upload complete"

Cenário: Tentativa de upload sem selecionar imagem
Quando eu preencho a descrição com "Tentando enviar sem arquivo"
Mas não seleciono nenhum arquivo de foto
Então o sistema deve exibir a mensagem "Please, select a photo"
E o botão "Upload" deve permanecer inativo

Cenário: Descrição excedendo o limite de caracteres
Quando eu preencho a descrição com mais de 300 caracteres
Então o sistema deve exibir a mensagem "Max length is 300"
E o botão "Upload" deve permanecer inativo

Cenário: Cancelar o upload e retornar
Quando eu clico no botão "Cancel"
Então o sistema deve cancelar a operação e retornar para a tela anterior

