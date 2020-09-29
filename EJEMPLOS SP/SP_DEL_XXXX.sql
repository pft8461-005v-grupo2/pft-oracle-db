CREATE OR REPLACE PROCEDURE SP_DEL_XXXX(
  IN_ID_XXX 	IN NUMBER,

  OUT GLOSA 	OUT VARCHAR2,
  OUT ESTADO 	OUT NUMBER
) AS


/**************************************************************************************************************
   NAME:       SP_DEL_XXXX
   PURPOSE:

   REVISIONS:
   Ver        Date           Author                               Description
   ---------  ----------     -------------------                  ----------------------------------------------
   1.0        XX/XX/XXXX     XX@XX.cl       						1. procedimiento que eliminar una XXX
***************************************************************************************************************/

BEGIN
    p_estado := 0;
    p_glosa := 'SP_DEL_XXXX ejecutado exitosamente';

    DELETE FROM CONTROL_DE_LIMITES.M_CONDICION 
      WHERE ID = IN_ID_XXX;


    EXCEPTION
        WHEN OTHERS THEN
           OUT_ESTADO := -1;
            OUT_GLOSA := ESQUEMA.FN_GET_GLOSA_ERROR;

END SP_DEL_XXXX;