# 📸 AluraPic - Projeto de Testes Funcionais & BDD

Projeto de Garantia da Qualidade de Software (QA) desenvolvido sobre a aplicação **AluraPic** (plataforma de compartilhamento de fotos com front-end em Angular e API REST em Node.js).

---

## 🎯 Objetivo do Projeto
Planejar, especificar em padrão **BDD (Behavior-Driven Development)** com sintaxe **Gherkin**, executar testes funcionais e exploratórios de ponta a ponta, documentar evidências e estruturar um relatório executivo de bugs e melhorias.

---

## 📂 Estrutura do Projeto de Testes

```text
├── features/                   # Especificações BDD em formato Gherkin (.feature)
│   ├── login.feature           # Cenários de autenticação e logout
│   ├── cadastro.feature        # Cenários de registro e regras de validação
│   ├── upload_foto.feature     # Publicação de fotos e limites de campos
│   ├── timeline_busca.feature  # Listagem, busca instantânea e paginação
│   └── interacao_foto.feature  # Curtidas, comentários e exclusão
│
├── relatorio_evidencias.md     # Relatório Executivo com 59 evidências fotográficas e 6 bugs
└── ...                         # Código-fonte da aplicação (Angular 6 + Node.js API)
```

---

## 📊 Destaques dos Resultados de QA

Consulte o documento completo: 👉 **[Relatório de Evidências e Fechamento Executivo](relatorio_evidencias.md)**

* **Total de Módulos Avaliados:** 5 módulos (Login, Cadastro, Upload, Timeline/Busca e Interações)
* **Total de Cenários Executados:** 25 cenários (caminhos felizes, exceções e testes de valor-limite)
* **Taxa de Cobertura e Sucesso:** 100% dos fluxos operacionais críticos aprovados
* **Evidências Fotográficas:** 59 capturas documentadas passo a passo
* **Bugs e Oportunidades de Melhoria Mapeados:**
  - **[BUG-01]** Botão *Register* ativo visualmente em formulários inválidos.
  - **[BUG-02]** Campo *Full Name* aceitando números sem validação alfabética.
  - **[BUG-03]** Validação permissiva de e-mail sem domínio de terminação (`.com`).
  - **[BUG-04]** Impossibilidade de remover curtida ("descurtir" uma foto).
  - **[BUG-05]** Ausência de recurso para exclusão ou moderação de comentários publicados.
  - **[BUG-06]** Campo de busca genérico (*search...*) restrito apenas a descrições de fotos locais.

---

## 🚀 Como Executar o Projeto Localmente

### Pré-requisitos
* Node.js (v16+ ou v24 com flag legada de OpenSSL já configurada)
* Git

### Instalação e Execução
```bash
# 1. Clonar o repositório
git clone https://github.com/carinemellor/alurapic-base.git
cd alurapic-base

# 2. Instalar as dependências
npm install --legacy-peer-deps

# 3. Subir a aplicação (Front-end e API em simultâneo)
npm start
```

* A aplicação estará disponível em: **`http://localhost:4200`**
* A API REST estará rodando em: **`http://localhost:3000`**

---

## 👩‍💻 Autora
* **Carine** - *QA & Test Analyst*
