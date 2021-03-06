create or replace PROCEDURE SP_PROCESO_VENTA_INGRESO_CREAR (


		IN_INGRESO_ID			IN NUMBER,
		IN_PROCESO_VENTA_ID 	IN NUMBER,
		IN_KILOGRAMOSOCUPADOS	IN NUMBER,

		OUT_GLOSA 		OUT VARCHAR2,
		OUT_ESTADO 		OUT NUMBER,
		OUT_ID_SALIDA 	OUT NUMBER

) AS

BEGIN
    
    OUT_GLOSA := 'SP_PROCESO_VENTA_INGRESO_CREAR ejecutado exitosamente';
    OUT_ESTADO := 0;


	INSERT INTO PROCESO_VENTA_INGRESO (
		INGRESO_ID,
		PROCESO_VENTA_ID,
		KILOGRAMOSOCUPADOS,
		HABILITADO
	) VALUES (
		IN_INGRESO_ID,
		IN_PROCESO_VENTA_ID,
		IN_KILOGRAMOSOCUPADOS,
		1
	);

	OUT_ID_SALIDA := 0;


    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
  NULL;
END SP_PROCESO_VENTA_INGRESO_CREAR;