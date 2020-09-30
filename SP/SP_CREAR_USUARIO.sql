CREATE OR REPLACE PROCEDURE SP_CREAR_USUARIO(
  IN_ROL_ID 			IN NUMBER,
  IN_CORREO 			IN VARCHAR2,
  IN_CONTRASENA 		IN VARCHAR2,
  OUT_GLOSA 		OUT VARCHAR2,
  OUT_ESTADO 		OUT NUMBER,
  OUT_ID_SALIDA 	OUT NUMBER
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

    OUT_GLOSA := 'SP_CREAR_USUARIO ejecutado exitosamente';
    OUT_ESTADO := 0;
 
    INSERT INTO PORTAFOLIO.USUARIO(
      ID,
      ROL_ID,
      CORREO,
      CONTRASENA,
      HABILITADO
   )
    VALUES (
       PORTAFOLIO.SECUENCIA_USUARIO_SEQ.NEXTVAL,
       IN_ROL_ID,
       IN_CORREO,
       IN_CONTRASENA,
       1
    )
    RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := PORTAFOLIO.FN_GET_GLOSA_ERROR;
END SP_CREAR_USUARIO;