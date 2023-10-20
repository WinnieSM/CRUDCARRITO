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
		Activo = @Activo
		WHERE IdUsuario = @IdUsuario

		SET @Resultado = 1
	END
	ELSE
		SET @Mensaje = 'El correo del usuario ya existe'
END



select * from CATEGORIA

create proc sp_RegistrarCategoria(
@Descripcion  varchar (100),
@Activo bit,
@Mensaje varchar (500),
@Resultado int output
)
as
BEGIN
	SET @Resultado = 0
	IF NOT EXISTS(SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)
	BEGIN
		INSERT INTO CATEGORIA(Descripcion,Activo) VALUES
		(@Descripcion,@Activo)

		SET @Resultado = SCOPE_IDENTITY()
	end
	else
	set @Mensaje = 'La categoria ya existe'
end



create proc sp_EditarCategoria(
@IdCategoria int,
@Descripcion varchar (500),
@Activo bit,
@Mensaje varchar (500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS(SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion AND IdCategoria != @IdCategoria)
	BEGIN
		UPDATE TOP (1) CATEGORIA SET
		Descripcion = @Descripcion,
		Activo = @Activo
		WHERE IdCategoria = @IdCategoria
	
		SET @Resultado = SCOPE_IDENTITY()
	end
	else
	set @Mensaje = 'La categoria ya existe'
end



create proc sp_EliminarCategoria(
@IdCategoria int,
@Mensaje varchar (500) output,
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS(SELECT * FROM PRODUCTO p
	INNER JOIN CATEGORIA c on c.IdCategoria = p.IdCategoria
	WHERE p.IdCategoria = @IdCategoria)
	BEGIN
		DELETE TOP (1) FROM CATEGORIA WHERE IdCategoria =  @IdCategoria
	
		SET @Resultado = 1
	end
	else
	set @Mensaje = 'La categoria ya se encuentra relacionada a un producto'
end


CREATE FUNCTION fn_Categorias()
RETURNS TABLE
AS
RETURN
SELECT IdCategoria, Descripcion, Activo FROM CATEGORIA
	

SELECT * FROM fn_Categorias()



