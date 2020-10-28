create or replace PROCEDURE SP_PROCESO_VENTA_CONSULTAR
(
    -- Opcionales
    in_id                   IN NUMBER,
    in_ingreso_id           IN NUMBER,
    in_solicitud_compra_id  IN NUMBER,
    in_subasta_id           IN NUMBER,
    in_etapa                IN NUMBER,
    in_fechaCreacion        IN DATE,
    in_clienteAceptaAcuerdo IN VARCHAR2,
    in_precioVentaTotal     IN NUMBER,
    in_precioCostoTotal     IN NUMBER,


    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select      in_id,
                in_ingreso_id,
                in_solicitud_compra_id,
                in_subasta_id,
                in_etapa,
                in_fechaCreacion,
                in_clienteAceptaAcuerdo,
                in_precioVentaTotal,
                in_precioCostoTotal
    FROM proceso_venta
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_ingreso_id IS NULL OR ingreso_id = in_ingreso_id)
			AND (in_solicitud_compra_id IS NULL OR solicitud_compra_id = in_solicitud_compra_id)
			AND (in_subasta_id IS NULL OR subasta_id = in_subasta_id)
			AND (in_etapa IS NULL OR etapa = in_etapa)
			AND (in_fechaCreacion IS NULL OR fechaCreacion = in_fechaCreacion)
			AND (in_clienteAceptaAcuerdo IS NULL OR clienteAceptaAcuerdo = in_clienteAceptaAcuerdo)
			AND (in_precioVentaTotal IS NULL OR precioVentaTotal = in_precioVentaTotal)
			AND (in_precioCostoTotal IS NULL OR precioCostoTotal = in_precioCostoTotal)
    ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_PROCESO_VENTA_CONSULTAR;
