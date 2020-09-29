CREATE OR REPLACE PROCEDURE SP_UPD_XXX(
  IN_ID IN NUMBER,
  IN_DATO1 IN NUMBER,
  IN_DATO2 IN VARCHAR2,
  IN_DATO3 IN DATE,

  OUT_GLOSA OUT VARCHAR2,
  OUT_ESTADO OUT NUMBER,
) AS

/**************************************************************************************************************
   NAME:       SP_UPD_XXX
   PURPOSE:

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   1.0        XX/XX/XXXX     XX@XX.cl       						1. procedimiento que UPDATEAR  una XXX
***************************************************************************************************************/

BEGIN
    p_estado := 0;
    p_glosa := 'SP_UPD_XXX ejecutado exitosamente';

    UPDATE ESQUEMA.SP_UPD_XXX SET 
      DATO1 = IN_DATO1,
      DATO2 = IN_DATO2,
      DATO3 = IN_DATO3,

      WHERE ID = IN_ID;

    EXCEPTION
        WHEN OTHERS THEN
			OUT_ESTADO := -1;
			OUT_GLOSA := ESQUEMA.FN_GET_GLOSA_ERROR;	

END SP_UPD_XXX;