CREATE DATABASE BD_Empleados
USE BD_Empleados

IF OBJECT_ID ('Empleados') IS NOT NULL
BEGIN
			DROP TABLE Empleados
END
GO
CREATE TABLE Empleados (
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Cedula VARCHAR(16) NOT NULL,
Nombre1 VARCHAR(15) NOT NULL,
Nombre2 VARCHAR(max) NOT NULL,
Apellido1 VARCHAR(15) NOT NULL,
Apellido2 VARCHAR(max) NOT NULL,
Celular VARCHAR(8) NOT NULL,
Direccion VARCHAR(60) NOT NULL,
Usuario VARCHAR(16) NOT NULL,
Password VARCHAR(16) NOT NULL,
Activo bit null
);

--PROCEDIMINETO ALMACENADO
--Borramos el procedimiento 'Delete_Empleados' si esta ya existe en nuestra base de datos--

IF OBJECT_ID ('Delete_Empleados') IS NOT NULL
BEGIN
			DROP TABLE Delete_Empleados
END
GO
--Creamos procedimiento con sus atributos--
CREATE PROCEDURE Delete_Empleados
@Id INT,
@Cedula VARCHAR(16),
@Nombre1 VARCHAR(15),
@Nombre2 VARCHAR(max),
@Apellido1 VARCHAR(15),
@Apellido2 VARCHAR(max),
@Celular VARCHAR(8),
@Direccion VARCHAR(60),
@Usuario VARCHAR(16),
@Password VARCHAR(16),
@Activo bit null

AS
	BEGIN
			DELETE FROM Empleados WHERE Id=@Id
		END
	GO

--INSERTAMOS
	IF OBJECT_ID ('Insert_Empleados') IS NOT NULL
BEGIN
			DROP TABLE Insert_Empleados
END
GO
--Creamos el procedimiento con sus atributos--
CREATE PROCEDURE Insert_Empleados
@Id INT,
@Cedula VARCHAR(16),
@Nombre1 VARCHAR(15),
@Nombre2 VARCHAR(max),
@Apellido1 VARCHAR(15),
@Apellido2 VARCHAR(max),
@Celular VARCHAR(8),
@Direccion VARCHAR(60),
@Usuario VARCHAR(16),
@Password VARCHAR(16),
@Activo bit null

AS
	BEGIN
		INSERT Empleados VALUES (@Cedula, @Nombre1,@Nombre2, @Apellido1,@Apellido2,@Celular,@Direccion,@Usuario,@Password,@Activo)
	END
	
GO
--SELECCIONAMOS LA TABLA COMPLETA
IF OBJECT_ID ('Select_Empleados') IS NOT NULL
BEGIN
			DROP TABLE Select_Empleados
END
GO
--Creamos procedimiento con sus atributos--
CREATE PROCEDURE Select_Empleados
@Id INT,
@Cedula VARCHAR(16),
@Nombre1 VARCHAR(15),
@Nombre2 VARCHAR(max),
@Apellido1 VARCHAR(15),
@Apellido2 VARCHAR(max),
@Celular VARCHAR(8),
@Direccion VARCHAR(60),
@Usuario VARCHAR(16),
@Password VARCHAR(16),
@Activo bit null

AS
	BEGIN
			SELECT * FROM Empleados
		END
	GO


IF OBJECT_ID ('Select_Empleado_All') IS NOT NULL
BEGIN
			DROP TABLE Select_Empleado_All
END
GO
--Creamos procedimiento con sus atributos--
CREATE PROCEDURE Select_Empleado_All
@Id INT,
@Cedula VARCHAR(16),
@Nombre1 VARCHAR(15),
@Nombre2 VARCHAR(max),
@Apellido1 VARCHAR(15),
@Apellido2 VARCHAR(max),
@Celular VARCHAR(8),
@Direccion VARCHAR(60),
@Usuario VARCHAR(16),
@Password VARCHAR(16),
@Activo bit null

AS
	BEGIN
			SELECT @Id,@Cedula,@Nombre1,@Nombre2,@Apellido1,@Apellido2,@Celular,@Direccion,@Usuario,@Password,@Activo
			FROM Empleados WHERE Id=@Id
		END
	GO

--ACTUALIZAR
IF OBJECT_ID ('Actualizar_Empleados') IS NOT NULL
BEGIN
			DROP TABLE Actualizar_Empleados
END
GO

--Creamos el procedimiento con sus atributos anteriores, en este caso empezar con un @--
CREATE PROCEDURE Actualizar_Empleados
@Id INT,
@Cedula VARCHAR(16),
@Nombre1 VARCHAR(15),
@Nombre2 VARCHAR(max),
@Apellido1 VARCHAR(15),
@Apellido2 VARCHAR(max),
@Celular VARCHAR(8),
@Direccion VARCHAR(60),
@Usuario VARCHAR(16),
@Password VARCHAR(16),
@Activo bit null
AS

		BEGIN
			UPDATE Empleados SET Cedula=@Cedula,Nombre1=@Nombre1,Nombre2=Nombre2,Apellido1=@Apellido1,Apellido2=@Apellido2
			,Celular=@Celular,Direccion=@Direccion,Usuario=@Usuario,Password=@Password,Activo=@Activo WHERE Id=@Id
		END

	
	GO