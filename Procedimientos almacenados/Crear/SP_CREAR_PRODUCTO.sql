create or replace PROCEDURE SP_CREAR_PRODUCTO (
  
  
  IN_DESCRIPCION		IN VARCHAR2,
  OUT_GLOSA 		OUT VARCHAR2,
  OUT_ESTADO 		OUT NUMBER,
  OUT_ID_SALIDA 	OUT NUMBER
) AS


BEGIN

    OUT_GLOSA := 'SP_CREAR_PRODUCTO ejecutado exitosamente';
    OUT_ESTADO := 0;

   INSERT INTO feria2.producto(
    ID,
    descripción,
    habilitado

   )
    VALUES (
       PRODUCTO_SEQUENCE.NEXTVAL,
       IN_DESCRIPCION,
       1
    )
    RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := feria2.FN_GET_GLOSA_ERROR;
END SP_CREAR_PRODUCTO;
