create or replace PROCEDURE SP_CREAR_ROL (
IN_DESCRIPCION IN VARCHAR2,
IN_AREA IN VARCHAR2,
OUT_GLOSA 		OUT VARCHAR2,
OUT_ESTADO 		OUT NUMBER,
OUT_ID_SALIDA 	OUT NUMBER
)AS 
BEGIN

INSERT INTO ROL (
ID,
DESCRIPCION,
AREA
) 
VALUES (
ROL_SEQUENCE.NEXTVAL,
IN_DESCRIPCION,
IN_AREA
)

RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
  NULL;
END SP_CREAR_ROL;
