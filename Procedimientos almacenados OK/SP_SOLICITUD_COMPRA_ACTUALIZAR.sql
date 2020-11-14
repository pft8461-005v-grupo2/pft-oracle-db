create or replace PROCEDURE SP_SOLICITUD_COMPRA_ACTUALIZAR (

	IN_ID_SOLICITUD_COMPRA 		IN NUMBER,
	IN_PRODUCTO					IN VARCHAR2,
	IN_KILOGRAMOS				IN NUMBER,
	IN_HABILITADO 				IN NUMBER,


	OUT_GLOSA 				OUT VARCHAR2,
	OUT_ESTADO 				OUT NUMBER,
	OUT_ID_SALIDA 			OUT NUMBER
	)AS 

EX_Sin_data                 EXCEPTION;
tiene_datos     			NUMBER := 0;

BEGIN

    OUT_GLOSA := 'SP_SOLICITUD_COMPRA_ACTUALIZAR ejecutado exitosamente';
    OUT_ESTADO := 0;

    SELECT
        COUNT(1)
    INTO tiene_datos
    FROM solicitud_compra solicitud
    WHERE solicitud.id = IN_ID_SOLICITUD_COMPRA;

    IF tiene_datos = 0 THEN
        RAISE EX_Sin_data;
    END IF;

	UPDATE solicitud_compra 
		SET 
			solicitud_compra.producto = NVL2( IN_PRODUCTO , IN_PRODUCTO, solicitud_compra.producto  ),
			solicitud_compra.kilogramos = NVL2( IN_KILOGRAMOS , IN_KILOGRAMOS, solicitud_compra.kilogramos  ),
			solicitud_compra.habilitado = NVL2( IN_HABILITADO , IN_HABILITADO, solicitud_compra.habilitado  )
		WHERE
			solicitud_compra.id = IN_ID_SOLICITUD_COMPRA;

	OUT_ID_SALIDA := IN_ID_SOLICITUD_COMPRA;


	 EXCEPTION
        WHEN EX_Sin_data THEN
            OUT_GLOSA := 'SP_SOLICITUD_COMPRA_ACTUALIZAR no se encuentra id';
            OUT_ESTADO := -1;
            OUT_ID_SALIDA := -1;


        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;

        NULL;

END SP_SOLICITUD_COMPRA_ACTUALIZAR;