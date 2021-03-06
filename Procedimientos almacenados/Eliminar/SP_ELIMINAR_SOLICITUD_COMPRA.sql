CREATE OR REPLACE PROCEDURE SP_ELIMINAR_SOLICITUD_COMPRA (
IN_ID_SOLICITUD_COMPRA IN NUMBER,
OUT_GLOSA 		OUT VARCHAR2,
OUT_ESTADO 		OUT NUMBER
) AS 
BEGIN

UPDATE solicitud_compra SET habilitado=0 WHERE id=in_id_solicitud_compra;

 EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
  NULL;
END SP_ELIMINAR_SOLICITUD_COMPRA;
