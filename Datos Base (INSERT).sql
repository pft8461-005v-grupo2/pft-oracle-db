-- ROL
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('1','ROLE_ADMIN','ADMINISTRACIÓN');
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('2','ROLE_PRODUCTOR','PRODUCTOR');
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('3','ROLE_TRANSPORTISTA','TRANSPORTE');
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('4','ROLE_CLIENTE_EXTERNO','CLIENTES');
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('5','ROLE_CLIENTE_INTERNO','CLIENTES');

COMMIT;

-- Usuario
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('1','1','admin','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('2','2','productor','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('3','3','transportista','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('4','4','clienteext','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('5','5','clienteint','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');

COMMIT;

-- Cliente

INSERT INTO "PORTAFOLIO"."CLIENTE" (ID, USUARIO_ID, IDENTIFICADOR, RAZONSOCIAL, DIRECCION, CIUDAD, PAIS_ORIGEN, TIPO_CLIENTE, CORREO, HABILITADO) VALUES ('1', '4', '1-9', 'FRUTAS GONZALEZ LTDA.', 'AVDA. PAJARITOS 3450', 'MAIPU', 'CHILE', '1', 'info@frutasgonzalez.com', '1');
INSERT INTO "PORTAFOLIO"."CLIENTE" (ID, USUARIO_ID, IDENTIFICADOR, RAZONSOCIAL, DIRECCION, CIUDAD, PAIS_ORIGEN, TIPO_CLIENTE, CORREO, HABILITADO) VALUES ('2', '5', '2-9', 'FRUTAS PEREIRA SA.', 'AVDA. RECOLETA 1900', 'RECOLETA', 'CHILE', '2', 'info@frutaspereira.cl', '1');

COMMIT;

-- Contrato

INSERT INTO "PORTAFOLIO"."CONTRATO" (ID, FECHAINICIO, FECHATERMINO, FECHACREACION, VIGENCIA) VALUES ('1', TO_DATE('2020-11-02 20:50:30', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-11-23 20:50:35', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-11-30 20:50:44', 'YYYY-MM-DD HH24:MI:SS'), '1');

COMMIT;

-- Productor

INSERT INTO "PORTAFOLIO"."PRODUCTOR" (ID, USUARIO_ID, RUT, RAZONSOCIAL, DIRECCION, COMUNA, CORREO, HABILITADO) VALUES ('1', '2', '1-9', 'VERDURAS LINDAS LTDA.', 'AVDA. RECOLETA 122', 'RECOLETA', 'info@verduraslindas@gmail.com', '1');

COMMIT;


