create or replace PROCEDURE SP_PR_VENTA_INGRESO_ACTUALIZAR (

	IN_INGRESO_ID		 		IN NUMBER,
	IN_PROCESO_VENTA_ID			IN NUMBER,
	IN_HABILITADO   			IN NUMBER,

	OUT_GLOSA 					OUT VARCHAR2,
	OUT_ESTADO 					OUT NUMBER,
	OUT_ID_SALIDA 				OUT NUMBER

)AS 

	EX_Sin_data                 EXCEPTION;
	tiene_datos     NUMBER := 0;

BEGIN

	OUT_GLOSA := 'SP_PR_VENTA_INGRESO_ACTUALIZAR ejecutado exitosamente';
    OUT_ESTADO := 0;

    SELECT
        COUNT(1)
    INTO tiene_datos
    FROM PROCESO_VENTA_INGRESO 
    WHERE INGRESO_ID = IN_INGRESO_ID AND PROCESO_VENTA_ID = IN_PROCESO_VENTA_ID;

    IF tiene_datos = 0 THEN
        RAISE EX_Sin_data;
    END IF;

	UPDATE PROCESO_VENTA_INGRESO 
	SET 
		PROCESO_VENTA_INGRESO.HABILITADO = NVL2( IN_HABILITADO, IN_HABILITADO, PROCESO_VENTA_INGRESO.HABILITADO)
	WHERE PROCESO_VENTA_INGRESO.INGRESO_ID = IN_INGRESO_ID AND PROCESO_VENTA_INGRESO.PROCESO_VENTA_ID = IN_PROCESO_VENTA_ID;

	OUT_ID_SALIDA := 0;

    EXCEPTION
        WHEN EX_Sin_data THEN
            OUT_GLOSA := 'SP_PR_VENTA_INGRESO_ACTUALIZAR no se encuentra id';
            OUT_ESTADO := -1;
            OUT_ID_SALIDA := -1;


        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;

        NULL;
END SP_PR_VENTA_INGRESO_ACTUALIZAR;