create or replace PROCEDURE SP_CREAR_SUBASTA (
IN_FECHATERMINO IN DATE,
IN_PRECIO_GANADOR IN NUMBER,
OUT_GLOSA 		OUT VARCHAR2,
OUT_ESTADO 		OUT NUMBER,
OUT_ID_SALIDA 	OUT NUMBER)AS 
BEGIN

INSERT INTO subasta (
ID,
FECHATERMINO,
PRECIOGANADOR,
HABILITADO
) VALUES (
SUBASTA_SEQUENCE.NEXTVAL,
IN_FECHATERMINO,
IN_PRECIO_GANADOR,
1
)

RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
  NULL;
END SP_CREAR_SUBASTA;
