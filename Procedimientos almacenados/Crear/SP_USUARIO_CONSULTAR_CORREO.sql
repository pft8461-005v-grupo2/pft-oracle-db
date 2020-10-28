create or replace PROCEDURE SP_USUARIO_CONSULTAR_CORREO(
  IN_CORREO 			IN VARCHAR2,
  OUT_GLOSA 		OUT VARCHAR2,
  OUT_ESTADO 		OUT NUMBER,
  OUT_RESULTADO 	OUT SYS_REFCURSOR
) AS

/**************************************************************************************************************
   NAME:       SP_CREAR_XXXXX
   PURPOSE:

   REVISIONS:
   Ver        Date           Author                    Description
   ---------  ----------     -------------------       ----------------------------------------------
   1.0        xx/xx/xxxx     xxxx@xx.cl       	       1. procedimiento que crea un nuevo xxxx

***************************************************************************************************************/

BEGIN

    OUT_GLOSA := 'SP_USUARIO_CONSULTAR_CORREO ejecutado exitosamente';
    OUT_ESTADO := 0;

    OPEN OUT_RESULTADO FOR
    SELECT 
        ID,
        ROL_ID,
        CORREO,
        CONTRASENA,
        HABILITADO
      FROM USUARIO
      WHERE CORREO = IN_CORREO;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := PORTAFOLIO.FN_GET_GLOSA_ERROR;
END SP_USUARIO_CONSULTAR_CORREO;