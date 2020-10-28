create or replace PROCEDURE SP_INGRESO_CONSULTAR
(
    -- Opcionales
    in_id                       IN NUMBER,
    in_productor_id             IN NUMBER,
    in_producto_id              IN NUMBER,
    in_fechaCreacion            IN DATE,
    in_kilogramos               IN NUMBER,
    in_precioKgCostoUnitario    IN NUMBER,
    in_precioKgVentaUnitario    IN NUMBER,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select      in_id,
                in_productor_id,
                in_producto_id,
                in_fechaCreacion,
                in_kilogramos,
                in_precioKgCostoUnitario,
                in_precioKgVentaUnitario
    FROM ingreso
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_productor_id IS NULL OR productor_id = in_productor_id)
			AND (in_producto_id IS NULL OR producto_id = in_producto_id)
			AND (in_fechaCreacion IS NULL OR fechaCreacion = in_fechaCreacion)
			AND (in_kilogramos IS NULL OR kilogramos = in_kilogramos)
			AND (in_precioKgCostoUnitario IS NULL OR precioKgCostoUnitario = in_precioKgCostoUnitario)
			AND (in_precioKgVentaUnitario IS NULL OR precioKgVentaUnitario = in_precioKgVentaUnitario)

    ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_INGRESO_CONSULTAR;
