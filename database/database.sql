/* =========================================================
   HelpDesk Lite
   Database: Firebird 2.5
   ========================================================= */


/* =========================================================
   CLIENTE
   ========================================================= */

CREATE TABLE CLIENTE (
    ID              INTEGER NOT NULL,
    NOME            VARCHAR(120) NOT NULL,
    DOCUMENTO       VARCHAR(20),
    EMAIL           VARCHAR(150),
    TELEFONE        VARCHAR(20),
    DATA_CADASTRO   TIMESTAMP NOT NULL
);

ALTER TABLE CLIENTE
ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY (ID);


/* =========================================================
   CHAMADO
   ========================================================= */

CREATE TABLE CHAMADO (
    ID              INTEGER NOT NULL,
    CLIENTE_ID      INTEGER NOT NULL,
    DATA_ABERTURA   TIMESTAMP NOT NULL,
    DATA_PREVISTA   TIMESTAMP NOT NULL,
    DATA_FECHAMENTO TIMESTAMP,
    STATUS          VARCHAR(20) NOT NULL,
    DESCRICAO       VARCHAR(500) NOT NULL,
    VALOR_TOTAL     DECIMAL(15,2) NOT NULL
);

ALTER TABLE CHAMADO
ADD CONSTRAINT PK_CHAMADO
PRIMARY KEY (ID);

ALTER TABLE CHAMADO
ADD CONSTRAINT FK_CHAMADO_CLIENTE
FOREIGN KEY (CLIENTE_ID)
REFERENCES CLIENTE (ID);


/* =========================================================
   ITEM_CHAMADO
   ========================================================= */

CREATE TABLE ITEM_CHAMADO (
    ID              INTEGER NOT NULL,
    CHAMADO_ID      INTEGER NOT NULL,
    DESCRICAO       VARCHAR(200) NOT NULL,
    QUANTIDADE      DECIMAL(15,2) NOT NULL,
    VALOR_UNITARIO  DECIMAL(15,2) NOT NULL
);

ALTER TABLE ITEM_CHAMADO
ADD CONSTRAINT PK_ITEM_CHAMADO
PRIMARY KEY (ID);

ALTER TABLE ITEM_CHAMADO
ADD CONSTRAINT FK_ITEM_CHAMADO_CHAMADO
FOREIGN KEY (CHAMADO_ID)
REFERENCES CHAMADO (ID);


/* =========================================================
   STATUS_LOG
   ========================================================= */

CREATE TABLE STATUS_LOG (
    ID                  INTEGER NOT NULL,
    CHAMADO_ID          INTEGER NOT NULL,
    DATA_HORA           TIMESTAMP NOT NULL,
    STATUS_ANTERIOR     VARCHAR(20),
    STATUS_NOVO         VARCHAR(20) NOT NULL
);

ALTER TABLE STATUS_LOG
ADD CONSTRAINT PK_STATUS_LOG
PRIMARY KEY (ID);

ALTER TABLE STATUS_LOG
ADD CONSTRAINT FK_STATUS_LOG_CHAMADO
FOREIGN KEY (CHAMADO_ID)
REFERENCES CHAMADO (ID);


/* =========================================================
   ÍNDICES
   ========================================================= */

CREATE INDEX IDX_CHAMADO_CLIENTE
ON CHAMADO (CLIENTE_ID);

CREATE INDEX IDX_CHAMADO_STATUS
ON CHAMADO (STATUS);

CREATE INDEX IDX_CHAMADO_DATA_ABERTURA
ON CHAMADO (DATA_ABERTURA);

CREATE INDEX IDX_ITEM_CHAMADO_CHAMADO
ON ITEM_CHAMADO (CHAMADO_ID);

CREATE INDEX IDX_STATUS_LOG_CHAMADO
ON STATUS_LOG (CHAMADO_ID);

/* =========================================================
   GENERATORS
   ========================================================= */

CREATE GENERATOR GEN_CLIENTE;
CREATE GENERATOR GEN_CHAMADO;
CREATE GENERATOR GEN_ITEM_CHAMADO;
CREATE GENERATOR GEN_STATUS_LOG;


/* =========================================================
   TRIGGER - CLIENTE
   ========================================================= */

SET TERM ^ ;

CREATE TRIGGER BI_CLIENTE FOR CLIENTE
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF (NEW.ID IS NULL) THEN
        NEW.ID = GEN_ID(GEN_CLIENTE, 1);
END^

/* =========================================================
   TRIGGER - CHAMADO
   ========================================================= */

CREATE TRIGGER BI_CHAMADO FOR CHAMADO
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF (NEW.ID IS NULL) THEN
        NEW.ID = GEN_ID(GEN_CHAMADO, 1);
END^


/* =========================================================
   TRIGGER - ITEM_CHAMADO
   ========================================================= */

CREATE TRIGGER BI_ITEM_CHAMADO FOR ITEM_CHAMADO
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF (NEW.ID IS NULL) THEN
        NEW.ID = GEN_ID(GEN_ITEM_CHAMADO, 1);
END^


/* =========================================================
   TRIGGER - STATUS_LOG
   ========================================================= */

CREATE TRIGGER BI_STATUS_LOG FOR STATUS_LOG
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF (NEW.ID IS NULL) THEN
        NEW.ID = GEN_ID(GEN_STATUS_LOG, 1);
END^

SET TERM ; ^

/* =========================================================
   GENERATORS
   ========================================================= */

CREATE GENERATOR GEN_CLIENTE;
CREATE GENERATOR GEN_CHAMADO;
CREATE GENERATOR GEN_ITEM_CHAMADO;
CREATE GENERATOR GEN_STATUS_LOG;


/* =========================================================
   TRIGGERS - GERAÇÃO DE ID
   ========================================================= */

SET TERM ^ ;

CREATE TRIGGER BI_CLIENTE FOR CLIENTE
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF (NEW.ID IS NULL) THEN
        NEW.ID = GEN_ID(GEN_CLIENTE, 1);
END^

CREATE TRIGGER BI_CHAMADO FOR CHAMADO
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF (NEW.ID IS NULL) THEN
        NEW.ID = GEN_ID(GEN_CHAMADO, 1);
END^

CREATE TRIGGER BI_ITEM_CHAMADO FOR ITEM_CHAMADO
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF (NEW.ID IS NULL) THEN
        NEW.ID = GEN_ID(GEN_ITEM_CHAMADO, 1);
END^

CREATE TRIGGER BI_STATUS_LOG FOR STATUS_LOG
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF (NEW.ID IS NULL) THEN
        NEW.ID = GEN_ID(GEN_STATUS_LOG, 1);
END^


/* =========================================================
   TRIGGER - HISTÓRICO DE STATUS
   ========================================================= */

CREATE TRIGGER AU_CHAMADO_STATUS_LOG FOR CHAMADO
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
    IF (OLD.STATUS <> NEW.STATUS) THEN
    BEGIN
        INSERT INTO STATUS_LOG (
            CHAMADO_ID,
            DATA_HORA,
            STATUS_ANTERIOR,
            STATUS_NOVO
        )
        VALUES (
            NEW.ID,
            CURRENT_TIMESTAMP,
            OLD.STATUS,
            NEW.STATUS
        );
    END
END^

SET TERM ; ^


/* =========================================================
   CONSTRAINTS
   ========================================================= */

ALTER TABLE ITEM_CHAMADO
ADD CONSTRAINT CK_ITEM_QUANTIDADE
CHECK (QUANTIDADE > 0);

ALTER TABLE ITEM_CHAMADO
ADD CONSTRAINT CK_ITEM_VALOR_UNITARIO
CHECK (VALOR_UNITARIO >= 0);

ALTER TABLE CHAMADO
ADD CONSTRAINT CK_CHAMADO_VALOR_TOTAL
CHECK (VALOR_TOTAL >= 0);

ALTER TABLE CHAMADO
ADD CONSTRAINT CK_CHAMADO_STATUS
CHECK (
    STATUS IN (
        'ABERTO',
        'EM_ANDAMENTO',
        'CONCLUIDO',
        'CANCELADO'
    )
);