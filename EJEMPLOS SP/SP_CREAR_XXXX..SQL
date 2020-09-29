CREATE OR REPLACE PROCEDURE SP_CREAR_xxxx(
  IN_DATO1 			IN VARCHAR,
  IN_DATO2 			IN VARCHAR2,
  IN_DATO3 			IN NUMBER,
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
    p_estado := 0;
    p_glosa := 'SP_CREAR_xxxx ejecutado exitosamente';


    INSERT INTO ESQUEMA.TABLA_XXX(
      ID,
      DATO1,
      DATO2,
      DATO3
   )
    VALUES (
       SECUENCIA_XXXX_SEQ.NEXTVAL;,
       IN_DATO1,
       IN_DATO2,
       IN_DATO3
    )
    RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := ESQUEMA.FN_GET_GLOSA_ERROR;
END SP_CREAR_COMENTARIO;