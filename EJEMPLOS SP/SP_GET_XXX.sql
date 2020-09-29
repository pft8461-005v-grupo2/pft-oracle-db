CREATE OR REPLACE PROCEDURE SP_GET_XXX(
  IN_ID_XXX IN NUMBER,
  OUT_GLOSA OUT VARCHAR2,
  OUT_ESTADO OUT NUMBER,
  OUT_PC_GET_XXXX OUT SYS_REFCURSOR
) AS
/**************************************************************************************************************
   NAME:       SP_GET_XXX
   PURPOSE:

   REVISIONS:
   Ver                Date           Author                               Description
   ---------          ----------     -------------------                  ----------------------------------------------
    1.0        XX/XX/XXXX     XX@XX.cl       						       1. procedimiento que RECUPERAR  una XXX
***************************************************************************************************************/

BEGIN
    p_estado := 0;
    p_glosa := 'SP_GET_XXX ejecutado exitosamente';

    OPEN OUT_PC_GET_XXXX FOR
    SELECT 
    DATO1,
    DATO2,
    DATO3,
    PERIODO,
    FROM ESQUEMA.SP_GET_XXX WHERE ID = IN_ID_XXX;

    EXCEPTION
        WHEN OTHERS THEN
           OUT_ESTADO := -1;
           OUT_GLOSA := ESQUEMA.FN_GET_GLOSA_ERROR;		

END SP_GET_XXX;