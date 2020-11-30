CREATE OR REPLACE PROCEDURE SP_PROCESO_VENTA_CREAR (

	IN_SOLICITUD_COMPRA_ID 		IN NUMBER,

	OUT_GLOSA 					OUT VARCHAR2,
	OUT_ESTADO 					OUT NUMBER,
	OUT_ID_SALIDA 				OUT NUMBER

	)AS 

BEGIN

	OUT_GLOSA := 'SP_PROCESO_VENTA_CREAR ejecutado exitosamente';
    OUT_ESTADO := 0;

INSERT INTO proceso_venta (
		ID,
		solicitud_compra_id, 
		subasta_id, 
		etapa, 
		fechacreacion, 
		clienteaceptaacuerdo, 
		precioventatotal, 
		preciocostototal)
		VALUES (

		PROCESO_VENTA_SEQUENCE.NEXTVAL,
		IN_SOLICITUD_COMPRA_ID,
		NULL,
		1,
		SYSDATE,
		0,
		0,
		0

		)

		RETURNING ID INTO OUT_ID_SALIDA;

		    EXCEPTION
		        WHEN OTHERS THEN
		            OUT_ESTADO := -1;
		            OUT_GLOSA := FN_GET_GLOSA_ERROR;
		  NULL;
END SP_PROCESO_VENTA_CREAR;
