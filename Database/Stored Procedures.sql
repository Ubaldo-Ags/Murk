USE [MURK]
GO
/****** Object:  StoredProcedure [dbo].[ALTA_ARTICULO]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ALTA_ARTICULO]
@NOM VARCHAR(50),
@DES VARCHAR(50),
@CAT INT,
@PC MONEY,
@PR MONEY,
@PROV INT
AS INSERT INTO Articulos
VALUES(@NOM,@DES,@CAT,@PC,@PR,@PROV,'0','1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_CATEGORIA]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[ALTA_CATEGORIA]
@cat varchar(50)
as insert into Categoria
values(@cat,'1')

GO
/****** Object:  StoredProcedure [dbo].[ALTA_COMPAÑIA]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_COMPAÑIA]
@NOM VARCHAR(50),
@DIRECCION VARCHAR(50),@MUN VARCHAR(50),
@EST VARCHAR (50),
@CP VARCHAR(10), 
@PAIS VARCHAR(50),
@RFC VARCHAR(50)
AS INSERT INTO COMPAÑIA
VALUES(@NOM,@DIRECCION,@MUN,@EST,@CP,@PAIS,@RFC,'1')

GO
/****** Object:  StoredProcedure [dbo].[ALTA_GENERO]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_GENERO]
@GEN VARCHAR(50)
AS INSERT INTO Genero
VALUES(@GEN,'1')



GO
/****** Object:  StoredProcedure [dbo].[ALTA_LIBRO]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ALTA_LIBRO]
@ISBN VARCHAR(50),
@TIT VARCHAR(50),
@EDIT VARCHAR(50),
@AUTOR VARCHAR(50),
@ID_GEN INT,
@NO_P INT,
@EDICION INT, 
@IDIOMA  VARCHAR(50),
@PRECIO MONEY,
@STOCK INT
AS INSERT INTO Libro
VALUES(@ISBN,@TIT,@EDIT,@AUTOR,@ID_GEN,@NO_P,@EDICION,@IDIOMA,@PRECIO,@STOCK,'1')



GO
/****** Object:  StoredProcedure [dbo].[ALTA_PERSONA]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_PERSONA]
@NOM VARCHAR(50),@AP VARCHAR(50),@AM VARCHAR(50),@FN DATE,@DIR VARCHAR(50),@COL VARCHAR(50),
@MUN VARCHAR(50),@EST VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT
AS INSERT INTO Personas VALUES(@NOM,@AP,@AM,@FN,@DIR,@COL,@MUN,@EST,@EMAIL,@TEL,'1')



GO
/****** Object:  StoredProcedure [dbo].[ALTA_PROVEEDOR]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_PROVEEDOR]
@NOM VARCHAR(50),@AP VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT,@COMP int
AS INSERT INTO Provedor VALUES(@NOM,@AP,@EMAIL,@TEL,@COMP,'1')



GO
/****** Object:  StoredProcedure [dbo].[ALTA_RECARGO]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_RECARGO]
@ID_PRESTAMO INT,
@DIAS INT,
@RECARGO MONEY,
@ESTADO VARCHAR(50)
AS INSERT INTO Recargos
VALUES(@ID_PRESTAMO,@DIAS,@RECARGO,@ESTADO,'1')



GO
/****** Object:  StoredProcedure [dbo].[ALTA_RFID_LIBRO]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_RFID_LIBRO]
@RFID  VARCHAR(50),
@ID_LIBRO INT
AS INSERT INTO Libro_rfid 
VALUES(@RFID,@ID_LIBRO,'1','1')



GO
/****** Object:  StoredProcedure [dbo].[ALTA_TIPO_USUARIO]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_TIPO_USUARIO]
@TIPO VARCHAR(50)
AS INSERT INTO Tipo_usuario
VALUES (@TIPO,'1')



GO
/****** Object:  StoredProcedure [dbo].[ALTA_USUARIO]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_USUARIO]
@RFID VARCHAR(50),
@IDP INT,
@IDT INT
AS INSERT INTO Usuarios 
VALUES(@RFID,@IDP,@IDT,'1')



GO
/****** Object:  StoredProcedure [dbo].[BuscarLogin]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarLogin]
@rfid varchar(50)
as
SELECT Usuarios.Id_tipo_usuario, Usuarios.Status, Personas.Nombre FROM Usuarios, Tipo_usuario, Personas WHERE Personas.Id = Usuarios.Id_persona AND Usuarios.Id_tipo_usuario = Tipo_usuario.Id AND Usuarios.Rfid = @rfid


GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_ARTICULO]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELIMINAR_ARTICULO]
@ID INT
AS UPDATE Articulos
SET Status = 0
WHERE Id = @ID


GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_PERSONA]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELIMINAR_PERSONA]
@ID INT
AS UPDATE Personas
SET Status = 0
WHERE Id=@ID
GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_PROVEEDOR]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELIMINAR_PROVEEDOR]
@ID INT
AS UPDATE Provedor
SET Status = 0
WHERE Id=@ID


GO
/****** Object:  StoredProcedure [dbo].[LISTAR_CATEGORIAS]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LISTAR_CATEGORIAS]
AS
SELECT Id, Nombre FROM Categoria
WHERE Status = 1;

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_COMPAÑIAS]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LISTAR_COMPAÑIAS]
AS
SELECT ID, NOMBRE FROM Compañia WHERE Status = 1


GO
/****** Object:  StoredProcedure [dbo].[LISTAR_PROVEEDORES]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LISTAR_PROVEEDORES]
AS
SELECT P.Id, C.Nombre +' - '+ P.Nombre +' '+ P.Apellido as Proveedor 
FROM Provedor as P, Compañia as C
WHERE C.Id = P.Id_compañia
AND C.Status = 1
AND p.Status = 1;

GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Login]
@RFID varchar(50)
as
select * from Usuarios where Usuarios.Rfid like @RFID

GO
/****** Object:  StoredProcedure [dbo].[MOD_ARTICULOS]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MOD_ARTICULOS]
@ID INT,
@NOM VARCHAR(50),
@DES VARCHAR(50),
@CAT INT,
@PC MONEY,
@PR MONEY,
@PROV INT
AS UPDATE Articulos
SET NOMBRE=@NOM, Descripcion=@DES ,Id_categoria=@CAT, Precio_compra=@PC, Precio_renta=@PR,Id_provedor=@PROV
WHERE Id = @ID

GO
/****** Object:  StoredProcedure [dbo].[MOD_PERSONAS]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MOD_PERSONAS]
@ID INT,@NOM VARCHAR(50),@AP VARCHAR(50),@AM VARCHAR(50),@FN DATE,@DIR VARCHAR(50),@COL VARCHAR(50),
@MUN VARCHAR(50),@EST VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT
AS UPDATE Personas SET Nombre=@NOM, Apellido_P=@AP, Apellido_M=@AM, FechaNacimiento=@FN, Direccion=@DIR, Colonia=@COL, Municipio=@MUN, Estado= @EST,Email= @EMAIL, Telefono=@TEL
WHERE Id=@ID
GO
/****** Object:  StoredProcedure [dbo].[MOD_PROVEEDOR]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MOD_PROVEEDOR]
@ID INT,@NOM VARCHAR(50),@AP VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT,@COMP INT
AS UPDATE Provedor SET Nombre=@NOM,Apellido= @AP,Correo=@EMAIL, Telefono=@TEL, Id_compañia=@COMP
WHERE Id=@ID


GO
/****** Object:  StoredProcedure [dbo].[MOD_USUARIO]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MOD_USUARIO]
@ID INT,@NOM VARCHAR(50),@AP VARCHAR(50),@AM VARCHAR(50),@FN DATE,@DIR VARCHAR(50),@COL VARCHAR(50),
@MUN VARCHAR(50),@EST VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT
AS UPDATE Personas SET Nombre=@NOM, Apellido_P=@AP, Apellido_M=@AM, FechaNacimiento=@FN, Direccion=@DIR, Colonia=@COL, Municipio=@MUN, Estado= @EST,Email= @EMAIL, Telefono=@TEL
WHERE Id=@ID
GO
/****** Object:  StoredProcedure [dbo].[MOD_USUARIOS]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MOD_USUARIOS]
@ID INT,@NOM VARCHAR(50),@AP VARCHAR(50),@AM VARCHAR(50),@FN DATE,@DIR VARCHAR(50),@COL VARCHAR(50),
@MUN VARCHAR(50),@EST VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT
AS UPDATE Personas SET Nombre=@NOM, Apellido_P=@AP, Apellido_M=@AM, FechaNacimiento=@FN, Direccion=@DIR, Colonia=@COL, Municipio=@MUN, Estado= @EST,Email= @EMAIL, Telefono=@TEL
WHERE Id=@ID
GO
/****** Object:  StoredProcedure [dbo].[ULTIMA_PERSONA]    Script Date: 07/08/2018 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ULTIMA_PERSONA]
AS SELECT MAX(P.Id) as 'Id' FROM Personas AS P
WHERE P.Status=1 
GO
