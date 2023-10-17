USE DBCARRITO

INSERT INTO USUARIO (Nombre,Apellidos,Correo,Clave)  
VALUES ('test nombre','test apellido','test@example.com','d9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e')


SELECT * FROM USUARIO

-------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO CATEGORIA (Descripcion)  VALUES 
('Tecnología'),
('Muebles'),
('Dormitorio'),
('Deportes')

SELECT * FROM CATEGORIA

-------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MARCA (Descripcion)  VALUES 
('SONYTE'),
('HPTE'),
('LGTE'),
('HYUNDAITE'),
('CANONTE'),
('ROBERTA ALLENTE')

SELECT * FROM MARCA

-------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DEPARTAMENTO (IdDepartamento,Descripcion)  VALUES 
('01','Arequipa'),
('02','Ica'),
('03','Lima')

SELECT * FROM DEPARTAMENTO

-------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO PROVINCIA (IdProvincia, Descripcion, IdDepartamento)  VALUES 
('0101','Arequipa','01'),
('0102','Canadá','01'),

('0201','Ica','02'),
('0202','Chincha','02'),

('0301','Lima','03'),
('0302','Barranca','03')

SELECT * FROM PROVINCIA

-------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DISTRITO (IdDistrito,Descripcion,IdProvincia,IdDepartamento)  VALUES 
('010101','Nivea','0101','01'),
('010102','El Cenepa','0101','01'),

('010201','Camaná','0102','01'),
('010202','José María Quimper','0102','01'),

('020101','ICa','0201','02'),
('020102','La tinguiña','0201','02'),
('020201','Chincha Alta','0202','02'),
('020202','Alto Laran','0202','02'),

('030101','Lima','0301','03'),
('030102','Ancón','0301','03'),
('030201','Barranca','0302','03'),
('030202','Paramonga','0302','03')

SELECT * FROM DISTRITO

-------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO ()  VALUES 
(''),

SELECT * FROM 