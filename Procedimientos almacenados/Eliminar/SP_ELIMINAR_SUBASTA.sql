CREATE OR REPLACE PROCEDURE SP_ELIMINAR_SUBASTA (
IN_ID_SUBASTA IN NUMBER,
IN_HABILITADO IN NUMBER,
OUT_GLOSA 		OUT VARCHAR2,
OUT_ESTADO 		OUT NUMBER
) AS 
BEGIN

UPDATE FERIA2.subasta SET habilitado=0 WHERE id=in_id_subasta;

EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := feria2.FN_GET_GLOSA_ERROR;
  NULL;
END SP_ELIMINAR_SUBASTA;
