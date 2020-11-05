create or replace PROCEDURE SP_TRANSPORTISTA_CREAR (
    IN_USUARIO_ID       IN NUMBER,
    IN_RUT              IN VARCHAR2,
    IN_RAZON_SOCIAL     IN VARCHAR2,
    IN_DIRECCION        IN VARCHAR2,
    IN_COMUNA           IN VARCHAR2,
    IN_CORREO           IN VARCHAR2,
    OUT_GLOSA 		OUT VARCHAR2,
    OUT_ESTADO 		OUT NUMBER,
    OUT_ID_SALIDA 	OUT NUMBER
) AS 
BEGIN

    OUT_GLOSA := 'SP_TRANPORTISTA_CREAR ejecutado exitosamente';
    OUT_ESTADO := 0;

    INSERT INTO transportista (
            ID,
            USUARIO_ID,
            RUT,
            RAZONSOCIAL,
            DIRECCION,
            COMUNA,
            CORREO,
            HABILITADO
        )
        VALUES (
            TRANSPORTISTA_SEQUENCE.NEXTVAL,
            IN_USUARIO_ID,
            IN_RUT,
            IN_RAZON_SOCIAL,
            IN_DIRECCION,
            IN_COMUNA,
            IN_CORREO,
            1
        )

    RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
    NULL;
END SP_TRANSPORTISTA_CREAR;