create or replace PROCEDURE SP_PROCESO_VENTA_INGRESO_CONSULTAR
(
    -- Opcionales
    IN_INGRESO_ID                   IN NUMBER,
    IN_PROCESO_VENTA_ID             IN NUMBER,
    IN_HABILITADO                   IN NUMBER,

    out_resultado           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_resultado FOR


    select
        INGRESO_ID,
        PROCESO_VENTA_ID,
        HABILITADO
    FROM PROCESO_VENTA_INGRESO
    where 	
    		-- Opcionales
    		    (IN_INGRESO_ID IS NULL OR INGRESO_ID = IN_INGRESO_ID)
			AND (IN_PROCESO_VENTA_ID IS NULL OR PROCESO_VENTA_ID = IN_PROCESO_VENTA_ID)
			AND (IN_HABILITADO IS NULL OR HABILITADO = IN_HABILITADO)
    ;

EXCEPTION

    WHEN OTHERS THEN
		out_resultado := null;

END SP_PROCESO_VENTA_INGRESO_CONSULTAR;