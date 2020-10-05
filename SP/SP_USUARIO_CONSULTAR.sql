CREATE OR REPLACE PROCEDURE SP_USUARIO_CONSULTAR(
  IN_ID           IN NUMBER,
  OUT_GLOSA     OUT VARCHAR2,
  OUT_ESTADO    OUT NUMBER,
  OUT_RESULTADO   OUT SYS_REFCURSOR
) AS

/**************************************************************************************************************
   NAME:       SP_CREAR_XXXXX
   PURPOSE:

   REVISIONS:
   Ver        Date           Author                    Description
   ---------  ----------     -------------------       ----------------------------------------------
   1.0        xx/xx/xxxx     xxxx@xx.cl                1. procedimiento que crea un nuevo xxxx

***************************************************************************************************************/
       
      
BEGIN

    OUT_GLOSA := 'SP_USUARIO_CONSULTAR ejecutado exitosamente';
    OUT_ESTADO := 0;

    OPEN OUT_RESULTADO FOR
    SELECT 
        ID,
        ROL_ID,
        CORREO,
        CONTRASENA,
        HABILITADO
      FROM USUARIO
      WHERE ID = IN_ID; 
      
    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := PORTAFOLIO.FN_GET_GLOSA_ERROR;
            
            
END SP_USUARIO_CONSULTAR;