# language: pt
Funcionalidade: Detalhes e interações com a foto
  Como um usuário do AluraPic
  Quero interagir com as fotos através de curtidas e comentários
  Para participar da comunidade e gerenciar minhas postagens

  Cenário: Curtir uma foto existente
    Dado que eu estou logado no sistema
    E estou na página de detalhes de uma foto
    Quando eu clico no ícone de curtir (coração)
    Então o contador de curtidas da foto deve mudar de 0 para 1 e permanecer curtida na timeline

  Cenário: Tentativa de descurtir uma foto (Bug / Melhoria)
    Dado que eu já curti uma foto
    Quando eu clico novamente no ícone de coração para descurtir
    Então o sistema deveria decrementar a curtida, mas o contador permanece inalterado

  Cenário: Foto com comentários desabilitados
    Dado que eu acesso os detalhes de uma foto configurada sem permissão de comentários
    Então a caixa de texto de comentários não deve estar visível
    E o sistema deve exibir a mensagem "User has disabled comments for this photo"

  Cenário: Tentativa de remoção de comentário postado (Bug / Melhoria)
    Dado que eu publiquei um comentário em uma foto
    Quando eu tento remover ou desfazer o comentário
    Então o sistema não disponibiliza botão ou ação para excluir comentários

  Cenário: Exclusão de foto pelo proprietário
    Dado que eu estou logado como dono da foto
    E acesso os detalhes da minha foto
    Quando eu clico no ícone de exclusão (lixeira)
    Então a foto deve ser removida do sistema
    E o sistema deve redirecionar para a timeline com o aviso "Photo removed"