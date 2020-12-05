create or replace PROCEDURE SP_PRODUCTO_CREAR (
  
  
  	IN_DESCRIPCION		IN VARCHAR2,

  	OUT_GLOSA 		OUT VARCHAR2,
  	OUT_ESTADO 		OUT NUMBER,
	OUT_ID_SALIDA 	OUT NUMBER


) AS

EX_ExisteProducto     EXCEPTION;
producto_existente     NUMBER := 0;

BEGIN

    OUT_GLOSA := 'SP_PRODUCTO_CREAR ejecutado exitosamente';
    OUT_ESTADO := 0;

    SELECT
        COUNT(1)
    INTO producto_existente
    FROM PRODUCTO producto
    WHERE UPPER(producto.descripcion) = UPPER(IN_DESCRIPCION);

    IF producto_existente > 0 THEN
        RAISE EX_ExisteProducto;
    END IF;

   INSERT INTO producto(
    ID,
    descripcion,
    habilitado

   )
    VALUES (
       PRODUCTO_SEQUENCE.NEXTVAL,
       UPPER(IN_DESCRIPCION),
       1
    )
    RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
		WHEN EX_ExisteProducto THEN
            OUT_GLOSA := 'SP_PRODUCTO_CREAR ya se encuentra registrado el producto';
            OUT_ESTADO := -1;
            OUT_ID_SALIDA := -1;

        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;

END SP_PRODUCTO_CREAR;