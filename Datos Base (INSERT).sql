-- ROL
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('1','ROLE_ADMIN','ADMINISTRACIÓN');
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('2','ROLE_PRODUCTOR','PRODUCTOR');
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('3','ROLE_TRANSPORTISTA','TRANSPORTE');
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('4','ROLE_CLIENTE_EXTERNO','CLIENTES');
Insert into PORTAFOLIO.ROL (ID,DESCRIPCION,AREA) values ('5','ROLE_CLIENTE_INTERNO','CLIENTES');

-- Usuario
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('1','1','admin','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('2','2','productor','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('3','3','transportista','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('4','4','clienteext','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');
Insert into PORTAFOLIO.USUARIO (ID,ROL_ID,CORREO,CONTRASENA,HABILITADO) values ('5','5','clienteint','$2a$10$N0mgx9N9LoWG3N9Yeix/4.GOoQDb1gWhYwV/tmXBxKbQeDb61KV6S','1');