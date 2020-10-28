CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_ROL (
IN_ID_ROL IN NUMBER,
IN_DESCRIPCION IN VARCHAR2,
IN_AREA IN VARCHAR2,
OUT_GLOSA 		OUT VARCHAR2,
OUT_ESTADO 		OUT NUMBER
)AS 
BEGIN

UPDATE ROL SET DESCRIPCION=IN_DESCRIPCION, AREA=IN_AREA WHERE ID=IN_ID_ROL;

 EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
  NULL;
END SP_ACTUALIZAR_ROL;
