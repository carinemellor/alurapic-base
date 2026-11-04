# language: pt
Funcionalidade: Linha do tempo e busca de fotos
Como um usuário do AluraPic
Quero visualizar as fotos publicadas e pesquisar por descrição
Para encontrar fotos específicas com facilidade

Contexto:
Dado que eu estou na página da timeline de um usuário

Cenário: Visualização da grade de fotos
Então o sistema deve exibir as fotos cadastradas do usuário em colunas

Cenário: Filtrar fotos por termo exato da descrição
Quando eu digito "cafifa" no campo de busca
Então a grade deve exibir apenas as fotos cuja descrição contenha "cafifa"

Cenário: Filtrar fotos por termo parcial da descrição
Quando eu digito uma palavra parcial da descrição no campo de busca
Então a imagem correspondente deve permanecer visível na grade

Cenário: Busca sem resultados correspondentes
Quando eu digito "termo-inexistente-xyz" no campo de busca
Então a foto da timeline deve sumir e deve ser exibida a mensagem "Sorry, no photos"

Cenário: Carregar mais fotos com galeria pequena
Dado que a galeria do usuário possui menos de 12 fotos
Quando eu clico no botão "Load more"
Então nenhuma nova foto é carregada e deve ser exibida a mensagem "No more data to load"

Cenário: Carregar mais fotos com galeria cheia
Dado que eu acesso a timeline de um usuário com múltiplas fotos cadastradas
Quando eu clico no botão "Load more"
Então o sistema deve carregar as próximas fotos até esgotar e exibir "No more data to load"
