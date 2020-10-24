create or replace PROCEDURE SP_CREAR_USUARIO(
  
  IN_CONTRASENA 		IN VARCHAR2,
  IN_CORREO 			IN VARCHAR2,
  IN_ROL_ID 			IN NUMBER,
  OUT_GLOSA 		OUT VARCHAR2,
  OUT_ESTADO 		OUT NUMBER,
  OUT_ID_SALIDA 	OUT NUMBER
) AS


BEGIN

    OUT_GLOSA := 'SP_CREAR_USUARIO ejecutado exitosamente';
    OUT_ESTADO := 0;

   INSERT INTO feria2.usuario(
      ID,
      CONTRASENA,
      HABILITADO,
      correo,
      rol_id
   )
    VALUES (
       USUARIO_SEQUENCE.NEXTVAL,
       IN_CONTRASENA,
       1,
       IN_CORREO,
       IN_ROL_ID
    )
    RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := feria2.FN_GET_GLOSA_ERROR;
END SP_CREAR_USUARIO;
