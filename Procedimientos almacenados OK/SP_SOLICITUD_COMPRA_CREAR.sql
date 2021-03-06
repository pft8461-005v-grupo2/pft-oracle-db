create PROCEDURE SP_SOLICITUD_COMPRA_CREAR (
	IN_CLIENTE_ID   IN NUMBER,
	IN_PRODUCTO     IN VARCHAR2,
	IN_KILOGRAMOS   IN NUMBER,

	OUT_GLOSA 		OUT VARCHAR2,
	OUT_ESTADO 		OUT NUMBER,
	OUT_ID_SALIDA 	OUT NUMBER

	) AS

	BEGIN

		OUT_GLOSA := 'SP_SOLICITUD_COMPRA_CREAR ejecutado exitosamente';
	    OUT_ESTADO := 0;

		INSERT INTO solicitud_compra(
			ID,
			CLIENTE_ID,
			FECHACREACION,
			PRODUCTO,
			KILOGRAMOS,
			HABILITADO
		)
		values(
			SOLICITUD_COMPRA_SEQUENCE.NEXTVAL,
			IN_CLIENTE_ID,
			sysdate,
			IN_PRODUCTO,
			IN_KILOGRAMOS,
			1
		)
	RETURNING ID INTO OUT_ID_SALIDA;

	EXCEPTION
	        WHEN OTHERS THEN
	            OUT_ESTADO := -1;
	            OUT_GLOSA := FN_GET_GLOSA_ERROR;
	  NULL;
END SP_SOLICITUD_COMPRA_CREAR;
/

