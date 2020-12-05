create or replace PROCEDURE SP_PRODUCTO_ACTUALIZAR (

  IN_PRODUCTO_ID   IN NUMBER,
  IN_DESCRIPCION   IN VARCHAR2,
  IN_HABILITADO    IN NUMBER,


  OUT_GLOSA           OUT VARCHAR2,
  OUT_ESTADO          OUT NUMBER,
  OUT_ID_SALIDA         OUT NUMBER

)AS 

  EX_Sin_data                 EXCEPTION;
  tiene_datos     NUMBER := 0;

BEGIN

    OUT_GLOSA := 'SP_PRODUCTO_ACTUALIZAR ejecutado exitosamente';
    OUT_ESTADO := 0;

    SELECT
        COUNT(1)
    INTO tiene_datos
    FROM PRODUCTO producto
    WHERE producto.ID = IN_PRODUCTO_ID;

    IF tiene_datos = 0 THEN
        RAISE EX_Sin_data;
    END IF;

  UPDATE PRODUCTO 
  SET 
    PRODUCTO.DESCRIPCION = NVL2( IN_DESCRIPCION, UPPER(IN_DESCRIPCION), UPPER(PRODUCTO.DESCRIPCION)),
    PRODUCTO.HABILITADO = NVL2( IN_HABILITADO, IN_HABILITADO, PRODUCTO.HABILITADO)
  WHERE PRODUCTO.ID = IN_PRODUCTO_ID;

  OUT_ID_SALIDA := IN_PRODUCTO_ID;

    EXCEPTION
        WHEN EX_Sin_data THEN
            OUT_GLOSA := 'SP_PRODUCTO_ACTUALIZAR no se encuentra id';
            OUT_ESTADO := -1;
            OUT_ID_SALIDA := -1;


        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;

        NULL;
END SP_PRODUCTO_ACTUALIZAR;