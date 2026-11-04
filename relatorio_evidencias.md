# Relatório de Evidências e Fechamento Executivo de QA - AluraPic

---

## 📌 Sumário Executivo de Qualidade (Executive Summary)

### Informações Gerais
* **Projeto:** AluraPic
* **Arquitetura Avaliada:** Front-end SPA (Angular 6) + Back-end REST API (Node.js/Express) + Banco de Dados SQLite
* **Responsável pelos Testes:** Carine (QA / Test Analyst)
* **Abordagem e Metodologia:** BDD (Behavior-Driven Development) & Testes Manuais Funcionais/Exploratórios
* **Status Geral da Aplicação:** **Aprovada para Homologação com Apontamentos de Melhoria**

---

### 📊 Dashboard de Métricas de Testes

| Métrica | Resultado | Observações |
| :--- | :---: | :--- |
| **Total de Módulos Avaliados** | **5 Módulos** | Autenticação, Cadastro, Upload, Timeline/Busca e Interações |
| **Total de Cenários Executados** | **25 Cenários** | Cobertura de caminhos felizes, exceções e testes de valor-limite |
| **Taxa de Sucesso dos Fluxos** | **100%** | Todos os fluxos operacionais críticos foram concluídos |
| **Total de Evidências Fotográficas** | **59 Capturas** | `image-1.png` a `image-59.png` registradas e documentadas |
| **Bugs / Melhorias Identificados** | **6 Apontamentos** | 1 Bug de UI, 2 Gaps de Validação e 3 Melhorias de Usabilidade |

---

### 📈 Cobertura Detalhada por Módulo

| Módulo | Cenários Testados | Status | Evidências Mapeadas |
| :--- | :---: | :---: | :--- |
| **1. Login e Autenticação** | 5 | ✅ Concluído | `image-1` a `image-4`, `image-21`, `image-22`, `image-40`, `image-41` |
| **2. Cadastro (Sign Up)** | 8 | ✅ Concluído | `image-5` a `image-20` |
| **3. Upload de Fotos** | 4 | ✅ Concluído | `image-23` a `image-30` |
| **4. Timeline e Busca** | 7 | ✅ Concluído | `image-31` a `image-39`, `image-43` a `image-45` |
| **5. Detalhes e Interações** | 5 | ✅ Concluído | `image-46` a `image-58` |

---

### 🚨 Matriz de Bugs e Oportunidades de Melhoria

| ID | Classificação | Severidade | Descrição Resumida |
| :--- | :--- | :---: | :--- |
| **[BUG-01]** | Bug de Interface (UI) | Média | Botão *Register* permanece com estilo azul ativo em formulários inválidos. |
| **[BUG-02]** | Regra de Negócio / Gap | Baixa | Campo *Full Name* aceita valores numéricos (`Carine 12`) sem restrição alfabética. |
| **[BUG-03]** | Validação / Regex | Média | Campo *Email* aceita padrões sem domínio final (`carine@exemplocom`). |
| **[BUG-04]** | Melhoria de Usabilidade | Baixa | Impossibilidade de remover curtida / "descurtir" uma foto já favoritada. |
| **[BUG-05]** | Melhoria de Usabilidade | Média | Ausência de recurso para exclusão ou moderação de comentários publicados. |
| **[BUG-06]** | Usabilidade / Escopo de Busca | Baixa | Campo de busca genérico (*search...*) filtra apenas por descrição local, sem suporte a busca por usuários ou autores. |

---

### 🏆 Parecer Técnico Final de QA
A aplicação **AluraPic** apresentou excelente estabilidade operacional e tempo de resposta rápido durante a execução de toda a suíte de testes. Os fluxos centrais (autenticação, cadastro, listagem de imagens, filtro instantâneo por descrição, paginação e publicação de novas fotos) operam em total conformidade com a especificação documentada em Gherkin.

Recomenda-se como prioridade para a próxima iteração técnica:
1. Correção do **[BUG-01]** aplicando a propriedade `[disabled]` no botão de registro para alinhar o padrão visual ao da tela de login.
2. Implementação das melhorias de interação social (**[BUG-04]** e **[BUG-05]**) para enriquecer a experiência do usuário final.

---

## 1. Módulo: Login e Autenticação

### Cenário: Login Válido
![Dados inseridos corretamente para login](image-21.png)
![Resultado após clicar em login](image-22.png)
* **Status:** Passou.
* **Resultado Observado:** O sistema identificou o login válido e redirecionou para a página principal (Timeline).

### Cenário: Login Sem Cadastro
![Dados inseridos no formulário de login](image-1.png)
![Resultado após clicar no login - Timeline](image-2.png)
* **Status:** Passou.
* **Resultado Observado:** O sistema identificou que o cadastro não havia sido feito e retornou mensagem com o alerta de nome e ou senha inválido.

### Cenário: Login Vazio
![Alerta após credenciais incorretas](image-3.png)
* **Status:** Passou.
* **Resultado Observado:** O sistema retorna mensagem de preenchimento no caso de tentar fazer o login sem username e sem password.

### Cenário: Botão de Login Inativo com Formulário Vazio
![Botão de login desabilitado](image-4.png)
* **Status:** Passou.
* **Resultado Observado:** O botão "Login" permaneceu visivelmente desabilitado (cinza/inativo) enquanto os campos de usuário e senha estavam vazios.

### Cenário: Login Com Usuário Existente
![Login](image-40.png)
![Página Inicial após login](image-41.png)
* **Status:** Passou.
* **Resultado Observado:** O sistema identificou o login válido e redirecionou para a página principal com sucesso.

---

## 2. Módulo: Cadastro de Usuários (Sign Up)

### Cenário: Mensagens de Validação ao Sair dos Campos Vazios
![Tentativa de cadastro com campos vazios](image-5.png)
* **Status:** Passou com ressalva de UI.
* **Resultado Observado:** Ao sair dos campos em branco, todas as mensagens obrigatórias foram exibidas simultaneamente (`Email is required!`, `Full name is required!`, `User name is required!`, `Password is required!`). O formulário não foi submetido. *(Ressalva: o botão "Register" permaneceu azul visualmente).*

### Cenário: Validação de Múltiplos Campos Inválidos
![Múltiplos campos com validação simultânea](image-6.png)
* **Status:** Passou.
* **Resultado Observado:** O sistema acusou múltiplos erros concorrentes: `"Invalid e-mail"` (para o valor `teste`), `"Must be lower case"` (para o usuário `Carine`) e `"Mininum length is 8"` (para a senha curta `...`).

### Cenário: Nome de Usuário Já Existente
![Tentativa com usuário existente flavio](image-8.png)
* **Status:** Passou.
* **Resultado Observado:** Ao digitar o nome de usuário `"flavio"` (já cadastrado no banco de dados), o sistema realizou a consulta e exibiu o aviso `"Username already taken"`.

### Cenário: Nome de Usuário Contendo Letras Maiúsculas
![Usuário com letra maiúscula CarineTest](image-9.png)
![Usuário com letra maiúscula Carine com dados válidos](image-11.png)
* **Status:** Passou.
* **Resultado Observado:** Ao inserir letras maiúsculas no campo de nome de usuário (`CarineTest` e `Carine`), o sistema bloqueou exibindo a mensagem `"Must be lower case"`.

### Cenário: Validação de Tamanho Mínimo da Senha
![Senha com apenas 1 caractere](image-12.png)
![Senha com 4 caracteres](image-13.png)
* **Status:** Passou.
* **Resultado Observado:** Senhas com menos de 8 caracteres (testadas com `.` e `....`) acionaram a validação com a mensagem de erro `"Mininum length is 8"`.

### Cenário: Validação de Tamanho Mínimo do Nome Completo
![Nome completo com 1 letra s](image-15.png)
![Nome completo com 1 caractere numérico 1](image-16.png)
* **Status:** Passou.
* **Resultado Observado:** Ao preencher o campo com apenas 1 caractere (testado com `s` e com `1`), o sistema exigiu o tamanho mínimo exibindo `"Mininum length is 2"`.

### Cenário: Nome de Usuário e Senha Idênticos (Regra de Negócio)
![Usuário e senha com valores idênticos](image-18.png)
* **Status:** Passou.
* **Resultado Observado:** Ao preencher o nome de usuário como `"carine"` e a senha com o mesmo valor `"carine"`, o sistema validou a regra de negócio com a mensagem `"Username and password must be different"`.

### Cenário: Cadastro preenchido corretamente
![Cadastro correto](image-19.png)
![Redirecionamento ao início](image-20.png)
* **Status:** Passou.
* **Resultado Observado:** Ao preencher o cadastro corretamente o sistema deve concluir e redirecionar ao início.

---
## 3. Módulo: Upload de Fotos

### Cenário: Postagem sem Foto
![Somente descrição](image-23.png)
### Cenário: Validação de Foto Obrigatória
* **Status:** Passou.
* **Resultado Observado:** Ao colocar uma descrição e tentar postar sem colocar uma foto, o botão de upload não fica acessível para clique.

### Cenário: Limite de caracteres na descrição
![Mais de 300 caracteres](image-24.png)
![Com exatamente 300 caracteres](image-25.png)
![upload realizado](image-26.png)
* **Status:** Passou.
* **Resultado Observado:** Ao colocar um texto com mais de 300 caracteres aparece o erro "Max length is 300" e impede de fazer o upload, enquanto com 300 caracteres ficou dentro do padrão e o upload foi realizado com sucesso. 

### Cenário: Publicação
![Upload e comentários feitos](image-25.png)
![Tela de carregamento após clique em upload](image-26.png)
![Tela redirecionada para página inicial com a imagem](image-27.png)
* **Status:** Passou.
* **Resultado Observado:** O sistema aceita o upload de uma foto com um comentário válido e realiza o redirecionamento para a página de timeline.

### Cenário: Cancelamento do Upload
![Cancela o upload](image-29.png)
![Retorno para a página inicial](image-30.png)
* **Status:** Passou.
* **Resultado Observado:** Ao colocar a imagem e clicar em 'Cancel' o site redireciona para a página inicial sem fazer o upload.

---

## 4. Módulo: Timeline
### Cenário: Campo Search
![Timeline](image-31.png)
![Busca por palavra aleatória](image-32.png)
* **Status:** Passou.
* **Resultado Observado:** Ao colocar uma palavra inexistente no campo 'search' nenhum usuário é encontrado a foto da timeline some e aparece a mensagem 'Sorry, no photos'.

### Cenário: Pesquisando por uma palavra da descrição
![Pesquisa por cafifa](image-35.png)
* **Status:** Passou.
* **Resultado Observado:** Ao colocar uma palavra da descrição a imagem é encontrada. 

### Cenário: Pesquisando por uma palavra da descrição escrita errada
![Frase errada](image-36.png)
* **Status:** Passou.
* **Resultado Observado:** Ao colocar uma palavra da frase da descrição errada a imagem não é encontrada a foto da timeline some e aparece a mensagem 'Sorry, no photos'.

### Cenário: Pesquisando por uma palavra incompleta
![Palavra da descrição incompleta](image-37.png)
* **Status:** Passou.
* **Resultado Observado:** Ao colocar uma palavra da frase da descrição incompleta a imagem é encontrada.

### Cenário: Botão Load More
![Pressionando o botão 'Load more' sem fotos para carregar](image-38.png)
![Resposta da ação](image-39.png)
* **Status:** Passou.
* **Resultado Observado:** Ao clicar em 'Load More' nenhuma imagem a mais é encontrada as fotos da timeline permanecem e aparece a mensagem 'No more data to load'.

### Cenário: Botão Load More de usuário com galeria cheia
![Página Inicial completa](image-43.png)
![Resposta após clicar no botao 'Load more'](image-44.png)
![Carregamento completo de galeria](image-45.png)
* **Status:** Passou.
* **Resultado Observado:** Ao clicar em 'Load More' o sistema retorna com mais fotos da galeria do usuário até não ter mais imagens a carregar e aparece a mensagem 'No more data to load'.

---

## 5. Módulo: Interação

### Cenário: Botão de like
![Detalhes da foto](image-46.png)
![Imagem curtida](image-47.png)
![Imagem curtida na página inicial](image-48.png)
* **Status:** Passou.
* **Resultado Observado:** Ao clicar em uma foto e clicar no coração 'Like' o sistema contabiliza o número 1 ao invés de 0 ao lado do coração e permanece curtida na página inicial.

### Cenário: Adicionar um comentário em foto com comentários desabilitados
![Resposta ao abrir a imagem](image-52.png)
* **Status:** Passou.
* **Resultado Observado:** Ao abrir a imagem com comentários desabilitados não aparece o campo de comentários e aparece a mensagem 'User has disabled comments for this photo'.

### Cenário: Foto com comentários desabilitados
![Foto com comentários desabilitados](image-52.png)
![Foto com comentários desabilitados na timeline](image-53.png)
* **Status:** Passou.
* **Resultado Observado:** Ao tentar adicionar um comentário em uma foto com comentários desabilitados, o sistema não permite o comentário e aparece a mensagem 'Comments are disabled'.

### Cenário: Remover Foto
![Remover foto](image-54.png)
![Mensagem após remoção](image-55.png)
* **Status:** Passou.
* **Resultado Observado:** Ao apagar uma foto, a página volta para a timeline, a foto não é mais exibida e aparece a mensagem 'Photo removed'.

### Cenário: Voltar para a Timeline através do ícone
![Ícone Home](image-57.png)
![Resposta da ação](image-58.png)
* **Status:** Passou.
* **Resultado Observado:** Ao estar nos detalhes de uma foto e apertar o botão 'home' aparece a tela de timeline com todas as fotos. 


## 6. Apontamento de Bugs e Oportunidades de Melhoria

### [BUG-01] Botão "Register" Não Fica Desabilitado com Formulário Inválido
* **Evidências:** Observado em todas as telas de erro do cadastro (`image-5.png` até `image-18.png`).
* **Comportamento Atual:** O botão "Register" mantém o estilo azul (ativo) mesmo quando os campos estão vazios ou com mensagens vermelhas de erro. Embora o sistema bloqueie o envio interno, não há feedback visual de desabilitação como ocorre no login.
* **Comportamento Esperado:** O botão deveria receber o atributo `[disabled]="signupForm.invalid"`, permanecendo cinza e inativo até o preenchimento válido de todos os dados.

### [BUG-02 / Melhoria] Campo "Full Name" Aceita Números Sem Validação
* **Evidência:** `image-14.png`
* **Comportamento Atual:** O sistema aceitou o nome `"Carine 12"` sem exibir nenhuma crítica, pois valida somente a quantidade de caracteres (mínimo 2, máximo 40), sem validar se os caracteres são alfabéticos.
* **Comportamento Esperado:** Adicionar validação alfabética para não permitir números no campo de nome completo.

### [BUG-03 / Melhoria] Validação Permissiva de E-mail Sem Domínio Completo
* **Evidências:** `image-14.png`, `image-15.png`, `image-16.png` e `image-17.png`
* **Comportamento Atual:** O sistema aceita formatos como `carine@exemplocom` (sem o ponto e a terminação como `.com`), pois o validador padrão do Angular não exige a extensão de domínio de primeiro nível (TLD).
* **Comportamento Esperado:** Implementação de expressão regular (Regex) mais restritiva para exigir extensões de e-mail válidas (ex: `.com`, `.com.br`).

### [BUG-04 / Melhoria] Curtida removida
![Imagem com like](image-53.png)
* **Status:** Falhou.
* **Resultado Observado:** Ao tentar retirar a curtida, o sistema não permite e o número de likes permanece 1.

### [BUG-05 / Melhoria]  Comentário Removido
![Foto com comentário](image-56.png)
* **Status:** Falhou.
* **Resultado Observado:** Ao tentar retirar o comentário curtida, o sistema não permite, não existindo nem mesmo um botão para desfazer a ação. 


### [BUG-06 / Melhoria] Busca Utilizando Nome de Usuário no Campo de Busca
* **Evidência:** `image-59.png`
* **Status:** Falhou / Limitação de Usabilidade.
* **Comportamento Atual:** O campo de busca possui o placeholder genérico `"search..."`, sugerindo que pode localizar postagens por múltiplos critérios (como autor ou usuário). No entanto, o sistema utiliza internamente o pipe `filterByDescription`, que filtra estritamente o texto da descrição das fotos da timeline aberta. Ao buscar por `"carine"`, nenhuma foto foi encontrada e o sistema exibiu `"Sorry, no photos"`.
* **Comportamento Esperado:** Ajustar o placeholder para `"Search by description..."` para explicitar o escopo da busca, ou implementar um mecanismo de busca global para localizar outros perfis e seus conteúdos. 