USE DBCARRITO

SELECT * FROM [dbo].[Fn_Usuarios] ()

INSERT INTO USUARIO (Nombre,Apellidos,Correo,Clave)  
VALUES ('Winnie ','Solis','Winnie@example.com','d9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e')




CREATE PROC sp_RegistrarUsuario(
@Nombre varchar (100),
@Apellidos varchar (100),
@Correo varchar (100),
@Clave varchar (100),
@Activo bit,
@Mensaje varchar (500) output,
@Resultado int output
)
AS
BEGIN
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
	BEGIN
		INSERT INTO USUARIO(Nombre,Apellidos,Correo,Clave,Activo) VALUES
		(@Nombre,@Apellidos,@Correo,@Clave,@Activo)
		SET @Resultado = SCOPE_IDENTITY()
	END
	ELSE
		SET @Mensaje = 'El correo del usuario ya existe'
END



GO
CREATE PROC sp_EditarUsuario(
@IdUsuario int,
@Nombre varchar (100),
@Apellidos varchar (100),
@Correo varchar (100),
@Clave varchar (100),
@Activo bit,
@Mensaje varchar (500) output,
@Resultado int output
)
AS
BEGIN
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo AND IdUsuario != @IdUsuario)
	BEGIN
		UPDATE TOP(1) USUARIO SET
		Nombre = @Nombre,
		Apellidos = @Apellidos,
		Correo = @Correo,
		Activo = Activo
		WHERE IdUsuario = @IdUsuario

		SET @Resultado = 1
	END
	ELSE
		SET @Mensaje = 'El correo del usuario ya existe'
END

