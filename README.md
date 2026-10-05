# HelpDeskLite

Sistema desktop de gerenciamento de chamados desenvolvido em **Delphi 12**, utilizando **Firebird 2.5**, **FireDAC** e **FastReport**.

O projeto foi desenvolvido com o objetivo de aplicar conceitos de desenvolvimento desktop, banco de dados relacional, CRUD, relacionamentos, transações e organização de código em uma aplicação completa.

## Funcionalidades

### Clientes

- Cadastro de clientes
- Edição de clientes
- Exclusão de clientes
- Listagem em grid
- Validação dos dados cadastrados

### Chamados

- Abertura de chamados
- Associação do chamado a um cliente
- Edição de chamados
- Exclusão de chamados
- Controle de status
- Data de abertura automática
- Data prevista de atendimento
- Valor total calculado através dos itens do chamado

Status disponíveis:

- `ABERTO`
- `EM_ANDAMENTO`
- `CONCLUIDO`
- `CANCELADO`

### Itens do chamado

Cada chamado pode possuir vários itens.

É possível:

- Adicionar item
- Editar item
- Excluir item
- Definir quantidade
- Definir valor unitário
- Calcular subtotal automaticamente

O subtotal é calculado utilizando:

```text
Quantidade × Valor Unitário
```

O valor total do chamado é recalculado automaticamente sempre que um item é criado, alterado ou excluído.

### Histórico de status

O banco de dados possui estrutura para registrar alterações de status dos chamados através de trigger.

### Relatórios

O sistema possui relatório de chamados utilizando **FastReport**.

O relatório apresenta informações como:

- Número do chamado
- Cliente
- Data de abertura
- Data prevista
- Descrição
- Status
- Valor total

## Tecnologias utilizadas

- Delphi 12
- Object Pascal
- VCL
- FireDAC
- Firebird 2.5
- SQL
- FastReport
- Git
- GitHub

## Banco de dados

O projeto utiliza **Firebird 2.5**.

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

O arquivo local `.FDB` não é versionado no Git.

A estrutura necessária para criação do banco está disponível em:

```text
database/schema.sql
```

## Integridade dos dados

O projeto utiliza:

- Primary Keys
- Foreign Keys
- Generators
- Triggers
- CHECK constraints
- Índices

Os IDs são gerados automaticamente pelo Firebird.

Os status permitidos são controlados por constraint no banco.

## Transações

Operações que alteram itens e valores dos chamados utilizam transações.

Exemplo:

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

Caso alguma operação apresente erro:

```text
ROLLBACK
```

Isso evita alterações parciais no banco de dados.

## Estrutura do projeto

```text
HelpDeskLite
│
├── database
│   └── schema.sql
│
├── docs
├── reports
│
└── src
    ├── Data
    ├── Forms
    ├── Models
    ├── Reports
    └── Services
```

## Principais módulos

### DataModules

Responsáveis pelo acesso aos dados e queries da aplicação.

Exemplos:

```text
uDMConexao
uDMCliente
uDMChamado
uDMItemChamado
```

### Forms

Responsáveis pela interface com o usuário.

Entre os principais formulários estão:

```text
uFrmPrincipal
uFrmClientes
uFrmClienteCadastro
uFrmChamados
uFrmChamadoCadastro
uFrmItensChamado
uFrmItemChamadoCadastro
```

## Executando o projeto

### Requisitos

- Windows
- Delphi 12
- Firebird 2.5
- FastReport
- FireDAC

Clone o repositório:

```bash
git clone https://github.com/MatheusGoetz/HelpDeskLite.git
```

Abra o projeto no Delphi.

Crie o banco utilizando:

```text
database/schema.sql
```

Configure a conexão FireDAC com o caminho do banco Firebird.

Depois compile e execute o projeto.

## Conceitos aplicados

Durante o desenvolvimento foram utilizados conceitos como:

- CRUD
- Programação orientada a objetos
- SQL
- Banco de dados relacional
- Mestre-detalhe
- Integridade referencial
- Foreign Keys
- Constraints
- Triggers
- Transações
- Tratamento de exceções
- DataModules
- DataSource e DataSet
- Interfaces desktop com VCL
- Versionamento com Git

## Objetivo do projeto

O HelpDeskLite foi desenvolvido como projeto prático para consolidar conhecimentos em desenvolvimento Delphi e demonstrar a construção de uma aplicação desktop completa integrada a banco de dados.

## Autor

**Matheus Goetz**

GitHub: https://github.com/MatheusGoetz

LinkedIn: https://www.linkedin.com/in/matheus-goetz-oyarzabal-9b325421a/