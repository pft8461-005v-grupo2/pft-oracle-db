create or replace PROCEDURE SP_USUARIO_CONSULTAR(
  IN_ID           IN NUMBER,
  IN_ROL_ID       IN NUMBER,
  IN_CORREO       IN VARCHAR2,
  IN_CONTRASENA   IN VARCHAR2,
  IN_HABILITADO   IN VARCHAR2,
<<<<<<< HEAD
=======

>>>>>>> 7082b28940a5440f93362efb65aed7a14a972c3f
  OUT_RESULTADO   OUT SYS_REFCURSOR
) AS   
      
BEGIN

    OPEN OUT_RESULTADO FOR
    SELECT 
        ID,
        ROL_ID,
        CORREO,
        CONTRASENA,
        HABILITADO
      FROM USUARIO
      WHERE     (IN_ID IS NULL OR ID = IN_ID)
            AND (IN_ROL_ID IS NULL OR ROL_ID = IN_ROL_ID)
            AND (IN_CORREO IS NULL OR CORREO = IN_CORREO)
            AND (IN_CONTRASENA IS NULL OR CONTRASENA = IN_CONTRASENA)
            AND (IN_HABILITADO IS NULL OR HABILITADO = IN_HABILITADO);
<<<<<<< HEAD


END SP_USUARIO_CONSULTAR;
=======
            
END SP_USUARIO_CONSULTAR;
>>>>>>> 7082b28940a5440f93362efb65aed7a14a972c3f
