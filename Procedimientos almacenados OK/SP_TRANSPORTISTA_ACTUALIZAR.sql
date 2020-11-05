create or replace PROCEDURE SP_TRANSPORTISTA_ACTUALIZAR (

        IN_ID_TRANSPORTISTA     IN NUMBER,
        IN_USUARIO_ID           IN NUMBER,
        IN_RUT                  IN VARCHAR2,
        IN_RAZON_SOCIAL         IN VARCHAR2,
        IN_DIRECCION            IN VARCHAR2,
        IN_COMUNA               IN VARCHAR2,
        IN_CORREO               IN VARCHAR2,
        IN_HABILITADO           IN NUMBER,
        
        OUT_GLOSA           OUT VARCHAR2,
        OUT_ESTADO          OUT NUMBER,
        OUT_ID_SALIDA       OUT NUMBER
)AS 

EX_Sin_data                 EXCEPTION;
tiene_datos     NUMBER := 0;

BEGIN

        OUT_GLOSA := 'SP_TRANSPORTISTA_ACTUALIZAR ejecutado exitosamente';
        OUT_ESTADO := 0;

        SELECT
            COUNT(1)
        INTO tiene_datos
        FROM TRANSPORTISTA transp
        WHERE transp.ID = IN_ID_TRANSPORTISTA;

        IF tiene_datos = 0 THEN
            RAISE EX_Sin_data;
        END IF;

        UPDATE transportista 
        SET 
            transportista.usuario_id = NVL2( IN_USUARIO_ID , IN_USUARIO_ID, transportista.usuario_id  ),
            transportista.rut = NVL2( IN_RUT , IN_RUT, transportista.rut  ),
            transportista.razonsocial = NVL2( IN_RAZON_SOCIAL , IN_RAZON_SOCIAL, transportista.razonsocial  ),
            transportista.direccion = NVL2( IN_DIRECCION , IN_DIRECCION, transportista.direccion  ),
            transportista.comuna = NVL2( IN_COMUNA , IN_COMUNA, transportista.comuna  ),
            transportista.correo = NVL2( IN_CORREO , IN_CORREO, transportista.correo  ),
            transportista.habilitado = NVL2( IN_HABILITADO , IN_HABILITADO, transportista.habilitado  )
            WHERE ID=IN_ID_TRANSPORTISTA;

        IF IN_CORREO != null THEN
            MERGE INTO usuario usu
                USING ( SELECT * from transportista) TRA
                ON (usu.id=TRA.usuario_id)
                WHEN MATCHED THEN
                UPDATE SET
                  usu.correo=TRA.correo;
        END IF;

        OUT_ID_SALIDA := IN_ID_TRANSPORTISTA;

EXCEPTION

        WHEN EX_Sin_data THEN
            OUT_GLOSA := 'SP_TRANSPORTISTA_ACTUALIZAR no se encuentra id';
            OUT_ESTADO := -1;
            OUT_ID_SALIDA := -1;

        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;
        NULL;

END SP_TRANSPORTISTA_ACTUALIZAR;