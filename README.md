# HelpDeskLite

Sistema desktop para gerenciamento de chamados desenvolvido em **Delphi 12**, utilizando **VCL**, **FireDAC**, **Firebird 2.5** e **FastReport**.

O projeto foi desenvolvido como prova técnica para demonstrar conhecimentos em desenvolvimento Delphi, modelagem de banco de dados, CRUD, regras de negócio, relacionamentos, transações, relatórios, tratamento de erros e organização de código.

---

## Funcionalidades

### Clientes

O sistema permite realizar o gerenciamento completo de clientes:

- Cadastro
- Edição
- Exclusão
- Listagem em grid
- Validação dos dados informados

Principais dados armazenados:

- Nome
- Documento
- E-mail
- Telefone
- Data de cadastro

---

### Chamados

Os chamados representam os atendimentos realizados para os clientes.

Funcionalidades disponíveis:

- Abertura de chamado
- Associação com cliente
- Edição
- Exclusão
- Listagem
- Controle de status
- Data de abertura automática
- Data prevista para atendimento
- Descrição do problema
- Cálculo automático do valor total

Status disponíveis:

```text
ABERTO
EM_ANDAMENTO
CONCLUIDO
CANCELADO
```

O campo `VALOR_TOTAL` não é editado manualmente pelo usuário. Ele é calculado automaticamente com base nos itens vinculados ao chamado.

---

## Itens do chamado

Cada chamado pode possuir vários itens.

Para cada item é possível informar:

- Descrição
- Quantidade
- Valor unitário

Também é possível:

- Adicionar item
- Editar item
- Excluir item
- Visualizar subtotal

O subtotal é calculado através da regra:

```text
Subtotal = Quantidade × Valor Unitário
```

Sempre que um item é criado, alterado ou removido, o valor total do chamado é recalculado automaticamente.

Exemplo:

```text
Diagnóstico           1 × 80,00  =  80,00
Configuração          2 × 50,00  = 100,00
Atualização           1 × 120,00 = 120,00

Valor total do chamado: R$ 300,00
```

---

## Pesquisa e filtros

A tela de chamados possui pesquisa com múltiplos critérios.

É possível combinar:

- Intervalo de data de abertura
- Cliente pelo nome ou parte do nome
- Um ou mais status

Exemplo:

```text
Período:
01/10/2026 até 31/10/2026

Cliente:
Teste

Status:
ABERTO
EM_ANDAMENTO
```

Os valores informados pelo usuário são tratados através de **queries parametrizadas**, evitando a concatenação direta dos critérios no SQL.

Quando nenhum status é selecionado, são considerados todos os status.

---

## SLA e chamados em atraso

Além das funcionalidades CRUD, o sistema possui uma regra de negócio para identificação automática de chamados em atraso.

Um chamado é considerado atrasado quando:

```text
Data atual > Data prevista
E
Status diferente de CONCLUIDO
E
Status diferente de CANCELADO
```

Chamados atrasados recebem destaque visual na tela de pesquisa.

Também são apresentados indicadores contendo:

- Total de chamados abertos
- Total em andamento
- Total concluído
- Total em atraso

### Como testar o SLA

Crie ou altere um chamado utilizando:

```text
Status: ABERTO
Data prevista: data anterior ao dia atual
```

Ao retornar para a listagem, o chamado deverá ser identificado visualmente como atrasado e contabilizado no indicador de atraso.

O mesmo comportamento ocorre para chamados com status:

```text
EM_ANDAMENTO
```

Chamados com status:

```text
CONCLUIDO
CANCELADO
```

não são considerados atrasados, mesmo que a data prevista já tenha passado.

A regra de SLA está centralizada na camada de serviço da aplicação.

---

## Histórico de status

O sistema possui estrutura de auditoria para registrar alterações de status.

A tabela:

```text
STATUS_LOG
```

armazena informações relacionadas às alterações realizadas no chamado.

O registro é realizado automaticamente através de trigger no Firebird sempre que o status é alterado.

---

## Relatórios

O projeto utiliza **FastReport** para geração do relatório de chamados.

O relatório utiliza o mesmo conjunto de dados filtrado na tela de pesquisa.

São apresentados:

- ID do chamado
- Cliente
- Data de abertura
- Data prevista
- Descrição
- Status
- Valor total
- Agrupamento por status
- Quantidade de chamados por status
- Subtotal dos valores por status
- Quantidade total de chamados
- Valor total geral
- Data e hora de geração
- Número da página

O relatório também pode ser exportado para:

```text
PDF
```

Exemplo de agrupamento:

```text
STATUS: ABERTO

Chamado #10     Cliente A     R$ 100,00
Chamado #15     Cliente B     R$ 200,00

Quantidade: 2
Subtotal: R$ 300,00


STATUS: CONCLUIDO

Chamado #20     Cliente C     R$ 150,00

Quantidade: 1
Subtotal: R$ 150,00


TOTAL GERAL

Chamados: 3
Valor total: R$ 450,00
```

---

## Tratamento e log de erros

A aplicação utiliza tratamento de exceções para apresentar mensagens amigáveis ao usuário.

Além disso, erros relevantes são registrados em arquivo através de uma classe responsável pelo logging.

O arquivo é criado em:

```text
logs/helpdesklite.log
```

Exemplo:

```text
06/10/2026 18:42:15 | ERRO | Cadastro de chamado | mensagem do erro
```

O logger é utilizado em operações relevantes como:

- Cadastro
- Alterações
- Exclusões
- Operações com itens
- Relatórios
- Outros erros tratados pela aplicação

O logger também possui proteção para evitar que uma falha ao escrever o próprio arquivo de log interrompa a execução do sistema.

---

## Tecnologias utilizadas

- Delphi 12
- Object Pascal
- VCL
- FireDAC
- Firebird 2.5
- SQL
- FastReport VCL
- Git
- GitHub

---

## Banco de dados

O sistema utiliza **Firebird 2.5**.

Principais tabelas:

```text
CLIENTE
CHAMADO
ITEM_CHAMADO
STATUS_LOG
```

Relacionamentos principais:

```text
CLIENTE
   │
   └── CHAMADO
          │
          ├── ITEM_CHAMADO
          │
          └── STATUS_LOG
```

O arquivo `.FDB` utilizado durante o desenvolvimento não é versionado no repositório.

A estrutura necessária para criação do banco está disponível em:

```text
database/schema.sql
```

---

## Integridade dos dados

O banco utiliza recursos para garantir consistência e integridade dos registros:

- Primary Keys
- Foreign Keys
- Generators
- Triggers
- CHECK Constraints
- Índices

Os IDs são gerados automaticamente através de generators e triggers compatíveis com o Firebird 2.5.

Os status aceitos são controlados por constraint:

```text
ABERTO
EM_ANDAMENTO
CONCLUIDO
CANCELADO
```

Também existem índices para melhorar consultas realizadas pelos campos utilizados com frequência na aplicação.

---

## Transações

Operações que envolvem itens e o valor total do chamado utilizam transações explícitas.

Fluxo simplificado:

```text
START TRANSACTION
        ↓
INSERT / UPDATE / DELETE ITEM_CHAMADO
        ↓
Recalcular valor total
        ↓
UPDATE CHAMADO
        ↓
COMMIT
```

Caso alguma das operações apresente erro:

```text
ROLLBACK
```

Isso evita que apenas parte da operação seja persistida no banco.

Também são utilizadas transações em operações que envolvem múltiplas exclusões relacionadas.

---

## Arquitetura e organização

O projeto foi organizado separando principalmente interface, acesso aos dados e regras de negócio.

### Forms

Responsáveis pela interface gráfica e interação com o usuário.

Principais unidades:

```text
uFrmPrincipal
uFrmClientes
uFrmClienteCadastro
uFrmChamados
uFrmChamadoCadastro
uFrmItensChamado
uFrmItemChamadoCadastro
```

---

### DataModules

Responsáveis pela comunicação com o banco e execução das queries através do FireDAC.

```text
uDMConexao
uDMCliente
uDMChamado
uDMItemChamado
```

As queries foram separadas conforme sua responsabilidade, evitando utilizar o mesmo dataset de listagem para operações de CRUD.

---

### Services

Responsáveis por regras e funcionalidades que não pertencem diretamente à interface gráfica.

Principais unidades:

```text
uChamadoService
uLogger
```

#### `uChamadoService`

Centraliza regras relacionadas aos chamados, incluindo a verificação de SLA e atraso.

#### `uLogger`

Responsável pelo registro de erros da aplicação em arquivo.

---

## Decisões arquiteturais

Algumas decisões adotadas durante o desenvolvimento:

- Uso de DataModules para separar acesso aos dados da interface
- Uso de FireDAC para comunicação com Firebird
- Separação entre queries de listagem e queries de CRUD
- Uso de queries parametrizadas
- Uso de transações explícitas
- Cálculo do valor total através dos itens
- Campo de valor total somente leitura para o usuário
- Regra de SLA centralizada em Service
- Auditoria de status através de trigger
- Logger centralizado
- Relatório utilizando FastReport
- Arquivo `.FDB` local fora do versionamento
- Banco recriável através de script SQL
- Uso de Git com commits incrementais e branches por funcionalidade

---

## Estrutura do projeto

```text
HelpDeskLite
│
├── bin
│   └── HelpDeskLite.exe
│
├── database
│   └── schema.sql
│
├── src
│   ├── Data
│   ├── Forms
│   ├── Reports
│   └── Services
│
├── README.md
├── HelpDeskLite.dpr
└── HelpDeskLite.dproj
```

Diretórios de compilação, arquivos temporários e o banco `.FDB` local não são versionados.

---

# Configuração do banco

## Requisitos

Para executar o projeto é necessário:

- Windows
- Firebird 2.5
- Serviço do Firebird em execução

O banco pode ser recriado utilizando:

```text
database/schema.sql
```

Após criar o banco, configure o componente de conexão FireDAC existente no DataModule:

```text
uDMConexao
```

No componente:

```text
FDConnection
```

configure os parâmetros para apontar para o banco criado.

Exemplo:

```text
DriverID=FB
Database=D:\Projects\HelpDeskLite\database\HELPDESKLITE.FDB
User_Name=SYSDBA
Password=<senha_do_firebird>
```

O valor informado em:

```text
Database
```

deve ser alterado conforme o local onde o arquivo `.FDB` foi criado.

A senha do Firebird deve ser informada conforme a configuração da instalação local.

---

# Executando pelo Delphi

## Requisitos de desenvolvimento

- Delphi 12
- Firebird 2.5
- FireDAC
- FastReport VCL

Clone o repositório:

```bash
git clone https://github.com/MatheusGoetz/HelpDeskLite.git
```

Entre no projeto:

```bash
cd HelpDeskLite
```

Crie o banco utilizando:

```text
database/schema.sql
```

Configure o `FDConnection`.

Abra:

```text
HelpDeskLite.dproj
```

no Delphi 12.

Depois utilize:

```text
Project → Build HelpDeskLite
```

e execute a aplicação.

---

# Executável

A versão compilada destinada à entrega está disponível em:

```text
bin/HelpDeskLite.exe
```

Para execução do `.exe`, o Firebird deve estar instalado e em execução.

Também deve existir um banco criado através do:

```text
database/schema.sql
```

e a aplicação deve estar configurada para acessar esse banco.

Não é necessário instalador.

---

## Como testar o sistema

### Clientes

1. Abra a opção `Clientes`.
2. Cadastre um novo cliente.
3. Edite os dados.
4. Exclua um cliente de teste.
5. Verifique a atualização da listagem.

### Chamados

1. Abra `Chamados`.
2. Crie um chamado.
3. Escolha um cliente.
4. Informe descrição, data prevista e status.
5. Salve.
6. Edite o chamado.
7. Altere seu status.

### Itens

1. Selecione um chamado.
2. Abra `Itens`.
3. Adicione um novo item.
4. Informe quantidade e valor unitário.
5. Verifique o subtotal.
6. Edite o item.
7. Verifique se o valor total foi recalculado.
8. Exclua o item.
9. Verifique novamente o valor total.

### Filtros

Teste combinações de:

```text
Data
Cliente
Status
```

Também selecione mais de um status simultaneamente.

### SLA

Crie um chamado:

```text
Status: ABERTO
Data prevista: anterior ao dia atual
```

Confirme:

- Destaque visual
- Incremento do contador de atrasados

Depois altere para:

```text
CONCLUIDO
```

e confirme que não é mais considerado atrasado.

### Relatório

1. Aplique filtros na tela.
2. Gere o relatório.
3. Confirme que somente registros filtrados aparecem.
4. Verifique os agrupamentos por status.
5. Confira quantidade e subtotal dos grupos.
6. Confira total geral.
7. Exporte para PDF.

---

## Conceitos aplicados

Durante o desenvolvimento foram aplicados conceitos como:

- CRUD
- Programação orientada a objetos
- SQL
- Banco de dados relacional
- Relacionamento mestre-detalhe
- Integridade referencial
- Foreign Keys
- Constraints
- Generators
- Triggers
- Índices
- Transações
- Commit
- Rollback
- Queries parametrizadas
- Regras de negócio
- SLA
- Tratamento de exceções
- Logging
- DataModules
- DataSource
- DataSet
- FireDAC
- VCL
- FastReport
- Exportação PDF
- Git
- Branches
- Pull Requests

---

## Limitações conhecidas

A versão atual possui algumas limitações:

- Aplicação destinada ao ambiente Windows
- Não possui autenticação de usuários
- Não possui controle de permissões
- Não possui testes automatizados
- O Firebird precisa estar instalado e em execução
- O caminho do banco precisa ser configurado para o ambiente onde o projeto será executado
- O cálculo de SLA utiliza a data atual da máquina
- Não possui paginação da listagem
- Não possui instalador
- A versão atual utiliza conexão direta com o Firebird

Esses pontos podem ser evoluídos em versões futuras.

---

## Possíveis evoluções

Com mais tempo, algumas melhorias possíveis seriam:

- Autenticação
- Controle de usuários e permissões
- Testes automatizados
- Importação e exportação de clientes via CSV
- Dashboard gráfico
- Paginação
- Configuração externa da conexão
- Installer
- Auditoria com identificação do usuário responsável
- Mais relatórios
- Melhorias de interface

---

## Uso de Inteligência Artificial

Ferramentas de Inteligência Artificial foram utilizadas como apoio durante o desenvolvimento para:

- Esclarecimento de dúvidas relacionadas a Delphi e FireDAC
- Análise de mensagens de erro
- Sugestões de organização de código
- Revisão de consultas SQL
- Apoio na estruturação da documentação
- Auxílio na investigação de problemas durante o desenvolvimento

Todo código incorporado ao projeto foi revisado, adaptado, testado e compreendido antes de ser integrado à aplicação.

As decisões finais de implementação, validação e testes foram realizadas sobre o projeto em execução.

---

## Versionamento

O projeto foi desenvolvido utilizando **Git e GitHub**.

Foram utilizadas branches de funcionalidades e commits incrementais durante a evolução do sistema.

Entre as etapas versionadas estão:

```text
CRUD de clientes
CRUD de chamados
Itens de chamados
Cálculo do valor total
Ajustes de interface
Filtros
SLA
Relatórios
Logging
Finalização
```

O objetivo foi manter um histórico claro da evolução da aplicação, evitando concentrar todo o desenvolvimento em um único commit.

---

## Autor

**Matheus Goetz**

GitHub:  
https://github.com/MatheusGoetz

LinkedIn:  
https://www.linkedin.com/in/matheus-goetz-oyarzabal-9b325421a/