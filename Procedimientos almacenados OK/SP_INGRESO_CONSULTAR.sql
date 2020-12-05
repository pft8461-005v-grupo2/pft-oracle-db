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
    in_habilitado               IN NUMBER,

    out_resultado           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_resultado FOR


    select      id,
                productor_id,
                producto_id,
                fechaCreacion,
                kilogramos,
                precioKgCostoUnitario,
                precioKgVentaUnitario,
                habilitado
    FROM ingreso
    where 	
    		(in_id IS NULL OR id = in_id)
			AND (in_productor_id IS NULL OR productor_id = in_productor_id)
			AND (in_producto_id IS NULL OR producto_id = in_producto_id)
			AND (in_fechaCreacion IS NULL OR fechaCreacion = in_fechaCreacion)
			AND (in_kilogramos IS NULL OR kilogramos = in_kilogramos)
			AND (in_precioKgCostoUnitario IS NULL OR precioKgCostoUnitario = in_precioKgCostoUnitario)
			AND (in_precioKgVentaUnitario IS NULL OR precioKgVentaUnitario = in_precioKgVentaUnitario)
            AND (in_habilitado IS NULL OR habilitado = in_habilitado)
    ;

EXCEPTION

    WHEN OTHERS THEN
		out_resultado := null;

END SP_INGRESO_CONSULTAR;
