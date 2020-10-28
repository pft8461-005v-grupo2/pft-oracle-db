create or replace PROCEDURE SP_ELIMINAR_CLIENTE (
IN_ID_CLIENTE IN NUMBER,
OUT_GLOSA 	OUT VARCHAR2,
OUT_ESTADO 	OUT NUMBER
)AS 
BEGIN

UPDATE cliente SET habilitado=0 WHERE id=in_id_cliente;

EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;

  NULL;
END SP_ELIMINAR_CLIENTE;
