
DROP TABLE ROL cascade constraints;
DROP TABLE USUARIO cascade constraints;
DROP TABLE CONTRATO cascade constraints;
DROP TABLE PRODUCTOR cascade constraints;
DROP TABLE TRANSPORTISTA cascade constraints;
DROP TABLE DETALLE_SUBASTA cascade constraints;
DROP TABLE SUBASTA cascade constraints;
DROP TABLE INGRESO cascade constraints;
DROP TABLE PROCESO_VENTA cascade constraints;
DROP TABLE SOLICITUD_COMPRA cascade constraints;
DROP TABLE CLIENTE cascade constraints;
DROP TABLE DETALLE_SOLICITUD cascade constraints;
DROP TABLE PRODUCTO cascade constraints;
DROP TABLE STOCK_DISPONIBLE cascade constraints;


CREATE TABLE cliente (
    id             INTEGER NOT NULL,
    usuario_id     INTEGER NOT NULL,
    identificador  VARCHAR2(10) NOT NULL,
    razonsocial    VARCHAR2(150) NOT NULL,
    direccion      VARCHAR2(200) NOT NULL,
    ciudad         VARCHAR2(100) NOT NULL,
    pais_origen    VARCHAR2(100) NOT NULL,
    tipo_cliente   SMALLINT NOT NULL,
    correo         VARCHAR2(150) NOT NULL,
    habilitado     SMALLINT NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id );

CREATE TABLE contrato (
    id             INTEGER NOT NULL,
    productor_id   INTEGER NOT NULL,
    fechainicio    DATE NOT NULL,
    fechatermino   DATE NOT NULL,
    fechacreacion  DATE NOT NULL,
    vigencia       SMALLINT NOT NULL
);

ALTER TABLE contrato ADD CONSTRAINT contrato_pk PRIMARY KEY ( id,
                                                              productor_id );

CREATE TABLE detalle_solicitud (
    id                   INTEGER NOT NULL,
    solicitud_compra_id  INTEGER NOT NULL,
    producto             VARCHAR2(50) NOT NULL,
    kilogramos           NUMBER NOT NULL
);

ALTER TABLE detalle_solicitud ADD CONSTRAINT detalle_solicitud_pk PRIMARY KEY ( id );

CREATE TABLE detalle_subasta (
    transportista_id  INTEGER NOT NULL,
    subasta_id        INTEGER NOT NULL,
    valorpropuesta    INTEGER
);

ALTER TABLE detalle_subasta ADD CONSTRAINT detalle_subasta_pk PRIMARY KEY ( transportista_id,
                                                                            subasta_id );

CREATE TABLE ingreso (
    id                     INTEGER NOT NULL,
    productor_id           INTEGER NOT NULL,
    producto_id            INTEGER NOT NULL,
    fechacreacion          DATE NOT NULL,
    kilogramos             NUMBER NOT NULL,
    preciokgcostounitario  INTEGER NOT NULL,
    preciokgventaunitario  INTEGER
);

ALTER TABLE ingreso ADD CONSTRAINT ingreso_pk PRIMARY KEY ( id );

CREATE TABLE proceso_venta (
    id                    INTEGER NOT NULL,
    ingreso_id            INTEGER,
    solicitud_compra_id   INTEGER,
    subasta_id            INTEGER,
    etapa                 SMALLINT NOT NULL,
    fechacreacion         DATE NOT NULL,
    clienteaceptaacuerdo  SMALLINT NOT NULL,
    precioventatotal      INTEGER,
    preciocostototal      INTEGER
);

ALTER TABLE proceso_venta ADD CONSTRAINT proceso_venta_pk PRIMARY KEY ( id );

CREATE TABLE producto (
    id           INTEGER NOT NULL,
    descripción  VARCHAR2(50) NOT NULL,
    habilitado   SMALLINT NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id );

CREATE TABLE productor (
    id           INTEGER NOT NULL,
    usuario_id   INTEGER NOT NULL,
    rut          VARCHAR2(10) NOT NULL,
    razonsocial  VARCHAR2(150) NOT NULL,
    direccion    VARCHAR2(200) NOT NULL,
    comuna       VARCHAR2(100) NOT NULL,
    correo       VARCHAR2(150) NOT NULL,
    habilitado   SMALLINT NOT NULL
);

ALTER TABLE productor ADD CONSTRAINT productor_pk PRIMARY KEY ( id );

CREATE TABLE rol (
    id           INTEGER NOT NULL,
    descripcion  VARCHAR2(30) NOT NULL,
    area         VARCHAR2(50)
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id );

CREATE TABLE solicitud_compra (
    id             INTEGER NOT NULL,
    cliente_id     INTEGER NOT NULL,
    fechacreacion  DATE NOT NULL,
    habilitado     SMALLINT NOT NULL
);

ALTER TABLE solicitud_compra ADD CONSTRAINT solicitud_compra_pk PRIMARY KEY ( id );

CREATE TABLE stock_disponible (
    id                       INTEGER NOT NULL,
    producto_id              INTEGER NOT NULL,
    kilogramos               NUMBER,
    fechaultimamodificacion  DATE NOT NULL
);

ALTER TABLE stock_disponible ADD CONSTRAINT stock_disponible_pk PRIMARY KEY ( id );

CREATE TABLE subasta (
    id             INTEGER NOT NULL,
    fechatermino   DATE NOT NULL,
    precioganador  INTEGER,
    habilitado     SMALLINT NOT NULL
);

ALTER TABLE subasta ADD CONSTRAINT subasta_pk PRIMARY KEY ( id );

CREATE TABLE transportista (
    id           INTEGER NOT NULL,
    usuario_id   INTEGER NOT NULL,
    rut          VARCHAR2(10) NOT NULL,
    razonsocial  VARCHAR2(150) NOT NULL,
    direccion    VARCHAR2(200) NOT NULL,
    comuna       VARCHAR2(100) NOT NULL,
    correo       VARCHAR2(150),
    habilitado   SMALLINT NOT NULL
);

ALTER TABLE transportista ADD CONSTRAINT transportista_pk PRIMARY KEY ( id );

CREATE TABLE usuario (
    id          INTEGER NOT NULL,
    rol_id      INTEGER NOT NULL,
    correo      VARCHAR2(150) NOT NULL,
    contrasena  VARCHAR2(60) NOT NULL,
    habilitado  SMALLINT NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_productor_fk FOREIGN KEY ( productor_id )
        REFERENCES productor ( id );

ALTER TABLE detalle_solicitud
    ADD CONSTRAINT det_sol_sol_comp_fk FOREIGN KEY ( solicitud_compra_id )
        REFERENCES solicitud_compra ( id );

ALTER TABLE detalle_subasta
    ADD CONSTRAINT detalle_subasta_subasta_fk FOREIGN KEY ( subasta_id )
        REFERENCES subasta ( id );

ALTER TABLE detalle_subasta
    ADD CONSTRAINT det_sub_trans_fk FOREIGN KEY ( transportista_id )
        REFERENCES transportista ( id );

ALTER TABLE ingreso
    ADD CONSTRAINT ingreso_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE ingreso
    ADD CONSTRAINT ingreso_productor_fk FOREIGN KEY ( productor_id )
        REFERENCES productor ( id );

ALTER TABLE proceso_venta
    ADD CONSTRAINT proceso_venta_ingreso_fk FOREIGN KEY ( ingreso_id )
        REFERENCES ingreso ( id );

ALTER TABLE proceso_venta
    ADD CONSTRAINT proc_vnt_sol_cpr_fk FOREIGN KEY ( solicitud_compra_id )
        REFERENCES solicitud_compra ( id );

ALTER TABLE proceso_venta
    ADD CONSTRAINT proceso_venta_subasta_fk FOREIGN KEY ( subasta_id )
        REFERENCES subasta ( id );

ALTER TABLE solicitud_compra
    ADD CONSTRAINT solicitud_compra_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE stock_disponible
    ADD CONSTRAINT stock_disponible_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY ( rol_id )
        REFERENCES rol ( id );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   3
-- WARNINGS                                 0
