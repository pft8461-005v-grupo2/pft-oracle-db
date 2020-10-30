create or replace PROCEDURE SP_USUARIO_CONSULTAR_CORREO(
  IN_CORREO 			IN VARCHAR2,
  OUT_RESULTADO 	OUT SYS_REFCURSOR
) AS


BEGIN

    OPEN OUT_RESULTADO FOR
    SELECT 
        ID,
        ROL_ID,
        CORREO,
        CONTRASENA,
        HABILITADO
      FROM USUARIO
      WHERE CORREO = IN_CORREO;

END SP_USUARIO_CONSULTAR_CORREO;