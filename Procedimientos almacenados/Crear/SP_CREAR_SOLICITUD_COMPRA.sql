create or replace PROCEDURE SP_CREAR_SOLICITUD_COMPRA (
IN_CLIENTE_ID in number,
--IN_FECHACREACION IN DATE,
--IN_HABILTADO IN NUMBER,
OUT_GLOSA 		OUT VARCHAR2,
OUT_ESTADO 		OUT NUMBER,
OUT_ID_SALIDA 	OUT NUMBER
) AS 
BEGIN
INSERT INTO solicitud_compra(
ID,
CLIENTE_ID,
FECHACREACION,
habilitado
)
values(
SOLICITUD_COMPRA_SEQUENCE.NEXTVAL,
IN_CLIENTE_ID,
sysdate,
1
)


RETURNING ID INTO OUT_ID_SALIDA;
EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
  NULL;
END SP_CREAR_SOLICITUD_COMPRA;
