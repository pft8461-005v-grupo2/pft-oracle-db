CREATE OR REPLACE PROCEDURE SP_DET_SUBASTA_ACTUALIZAR (

    IN_TRANSPORTISTA_ID IN NUMBER,
    IN_SUBASTA_ID       IN NUMBER,
    IN_VALOR_PROPUESTA  IN NUMBER,


    OUT_GLOSA                   OUT VARCHAR2,
    OUT_ESTADO                  OUT NUMBER,
    OUT_ID_SALIDA               OUT NUMBER
)AS 

    EX_Sin_data                 EXCEPTION;
    tiene_datos                 NUMBER := 0;

BEGIN

    OUT_GLOSA := 'SP_DET_SUBASTA_ACTUALIZAR ejecutado exitosamente';
    OUT_ESTADO := 0;

    SELECT
        COUNT(1)
    INTO tiene_datos
    FROM DETALLE_SUBASTA 
    WHERE TRANSPORTISTA_ID = IN_TRANSPORTISTA_ID 
    AND SUBASTA_ID = IN_SUBASTA_ID;

    IF tiene_datos = 0 THEN
        RAISE EX_Sin_data;
    END IF;

UPDATE DETALLE_SUBASTA 
SET 
    DETALLE_SUBASTA.VALORPROPUESTA = NVL2( IN_VALOR_PROPUESTA, IN_VALOR_PROPUESTA, DETALLE_SUBASTA.VALORPROPUESTA)
WHERE TRANSPORTISTA_ID = IN_TRANSPORTISTA_ID 
    AND SUBASTA_ID = IN_SUBASTA_ID;

    OUT_ID_SALIDA := 0;

EXCEPTION
        WHEN EX_Sin_data THEN
            OUT_GLOSA := 'SP_DET_SUBASTA_ACTUALIZAR no se encuentra id';
            OUT_ESTADO := -1;
            OUT_ID_SALIDA := -1;


        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;

END SP_DET_SUBASTA_ACTUALIZAR;