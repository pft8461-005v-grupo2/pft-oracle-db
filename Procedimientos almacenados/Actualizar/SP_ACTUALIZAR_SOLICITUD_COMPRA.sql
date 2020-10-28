CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_SOLICITUD_COMPRA (
IN_ID_SOLICITUD_COMPRA IN NUMBER,
IN_HABILITADO IN NUMBER,
OUT_GLOSA 		OUT VARCHAR2,
OUT_ESTADO 		OUT NUMBER,
OUT_ID_SALIDA 	OUT NUMBER
)AS 
BEGIN

UPDATE solicitud_compra SET habilitado=IN_HABILITADO,fechacreacion=SYSDATE WHERE ID=IN_ID_SOLICITUD_COMPRA;

 EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
  NULL;
END SP_ACTUALIZAR_SOLICITUD_COMPRA;
