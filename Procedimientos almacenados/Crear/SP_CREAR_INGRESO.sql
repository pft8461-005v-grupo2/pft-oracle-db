CREATE OR REPLACE PROCEDURE SP_CREAR_INGRESO (
IN_PRODUCTOR_ID IN NUMBER,
IN_PRODUCTO_ID IN NUMBER,
IN_FECHA_CREACION IN DATE,
IN_KILOGRAMOS IN NUMBER,
IN_PRECIO_KG_COSTO_UNITARIO IN NUMBER,
IN_PRECIO_KG_VENTA_UNITARIO IN NUMBER,
OUT_GLOSA 		OUT VARCHAR2,
OUT_ESTADO 		OUT NUMBER,
OUT_ID_SALIDA 	OUT NUMBER
) AS 


BEGIN

INSERT INTO INGRESO (
ID,
PRODUCTOR_ID,
PRODUCTO_ID,
FECHACREACION,
KILOGRAMOS,
PRECIOKGCOSTOUNITARIO,
PRECIOKGVENTAUNITARIO
) VALUES (
INGRESO_SEQUENCE.NEXTVAL,
IN_PRODUCTOR_ID,
IN_PRODUCTO_ID,
IN_FECHA_CREACION,
IN_KILOGRAMOS,
IN_PRECIO_KG_COSTO_UNITARIO,
IN_PRECIO_KG_VENTA_UNITARIO
)

RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
  NULL;
END SP_CREAR_INGRESO;
