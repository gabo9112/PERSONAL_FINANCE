PRAGMA foreign_keys = ON;

-- 1. LIMPIEZA PREVIA (En orden inverso a las dependencias)
DROP TABLE IF EXISTS SubCategories;
DROP TABLE IF EXISTS Description_Income;
DROP TABLE IF EXISTS Priority;
DROP TABLE IF EXISTS SPENDING_TYPE;
DROP TABLE IF EXISTS Need_Type;
DROP TABLE IF EXISTS Months;
DROP TABLE IF EXISTS Mandatory;
DROP TABLE IF EXISTS Income;
DROP TABLE IF EXISTS Entity;
DROP TABLE IF EXISTS CATEGORIES;
DROP TABLE IF EXISTS Assignment_Type;

-- 2. CREACIÓN DE TABLAS PADRE (Sin Foreign Keys)
CREATE TABLE Assignment_Type (
    id_Assignment_Type INTEGER PRIMARY KEY,
    Assignment_Type TEXT NOT NULL
);

CREATE TABLE CATEGORIES (
    ID_CATEGORY INTEGER PRIMARY KEY,
    CATEGORY TEXT NOT NULL
);

CREATE TABLE Entity (
    Id_Entity INTEGER PRIMARY KEY,
    Entity TEXT NOT NULL
);

CREATE TABLE Income (
    ID_Income INTEGER PRIMARY KEY,
    Income TEXT NOT NULL
);

CREATE TABLE Mandatory (
    ID_Mandatory INTEGER PRIMARY KEY,
    Mandatory TEXT NOT NULL
);

CREATE TABLE Months (
    ID_MONTH INTEGER PRIMARY KEY,
    MONTH TEXT NOT NULL
);

CREATE TABLE Need_Type (
    ID_Need_Type INTEGER PRIMARY KEY,
    Need_Type TEXT NOT NULL
);

CREATE TABLE Priority (
    ID_Priority INTEGER PRIMARY KEY,
    Priority TEXT NOT NULL
);

CREATE TABLE SPENDING_TYPE (
    ID_SPENDING INTEGER PRIMARY KEY,
    SPENDING TEXT NOT NULL
);

-- 3. CREACIÓN DE TABLAS HIJAS (Con Foreign Keys)
CREATE TABLE Description_Income (
    ID_Description_Income INTEGER PRIMARY KEY,
    Description_Income TEXT NOT NULL,
    ID_Income INTEGER NOT NULL,
    FOREIGN KEY (ID_Income) REFERENCES Income (ID_Income)
);

CREATE TABLE SubCategories (
    ID_SUBCAT INTEGER PRIMARY KEY,
    SUB_CATEGORY TEXT NOT NULL,
    ID_CATEGORY INTEGER NOT NULL,
    FOREIGN KEY (ID_CATEGORY) REFERENCES CATEGORIES (ID_CATEGORY)
);

-- 4. INSERCIÓN DE DATOS (DML)
INSERT INTO "Assignment_Type" ("id_Assignment_Type","Assignment_Type") VALUES 
(1,'Ahorro'),
(2,'Credito'),
(3,'Gasto'),
(4,'Inversion');

INSERT INTO "CATEGORIES" ("ID_CATEGORY","CATEGORY") VALUES 
(10,'Alimentación'),
(20,'Deudas'),
(30,'Educación'),
(40,'Inversión'),
(50,'Ocio'),
(60,'Personales'),
(70,'Salud'),
(80,'Transporte'),
(90,'Vivienda');

INSERT INTO "Entity" ("Id_Entity","Entity") VALUES 
(1,'Banco Davivienda'),
(2,'Banco De Bogota'),
(3,'Corporacion Universitaria Ibero Americana'),
(4,'Familiar / Amigo'),
(5,'Meddipay');

INSERT INTO "Income" ("ID_Income","Income") VALUES 
(1,'Delivery'),
(2,'Freelance'),
(3,'Salario');

INSERT INTO "Mandatory" ("ID_Mandatory","Mandatory") VALUES 
(1,'Si'),
(2,'No');

INSERT INTO "Months" ("ID_MONTH","MONTH") VALUES 
(1,'Enero'),
(2,'Febrero'),
(3,'Marzo'),
(4,'Abril'),
(5,'Mayo'),
(6,'Junio'),
(7,'Julio'),
(8,'Agosto'),
(9,'Septiembre'),
(10,'Octubre'),
(11,'Noviembre'),
(12,'Diciembre');

INSERT INTO "Need_Type" ("ID_Need_Type","Need_Type") VALUES 
(1,'Necesario'),
(2,'Evitable');

INSERT INTO "Priority" ("ID_Priority","Priority") VALUES 
(1,'Alta'),
(2,'Media'),
(3,'Baja');

INSERT INTO "SPENDING_TYPE" ("ID_SPENDING","SPENDING") VALUES 
(1,'FIJO'),
(2,'VARIABLE');

INSERT INTO "Description_Income" ("ID_Description_Income","Description_Income","ID_Income") VALUES 
(10,'1ra quincena',3),
(20,'2da quincena',3);

INSERT INTO "SubCategories" ("ID_SUBCAT","SUB_CATEGORY","ID_CATEGORY") VALUES 
(101,'Desayuno - Home',10),
(102,'Almuerzo - Home',10),
(103,'Cena - Home',10),
(104,'Mercado',10),
(105,'Desayuno - Restaurante',10),
(106,'Almuerzo - Restaurante',10),
(107,'Cena - Restaurante',10),
(201,'Odontologia',20),
(202,'Seminario',20),
(203,'Motocicleta',20),
(204,'Prestamo Andres Rincon',20),
(205,'Prestamo Sergio Pinzon',20),
(206,'Viaje San Andres',20),
(207,'Apartamento',20),
(501,'Cine',50),
(502,'Video Juegos',50),
(503,'Fiestas / Party',50),
(504,'Reuniones Sociales',50),
(505,'Streaming',50),
(506,'Conciertos',50),
(507,'Restaurantes',50),
(508,'Fast Food',50),
(509,'Cafes',50),
(510,'Viajes',50),
(511,'Ropa',50),
(512,'Accesorios',50),
(513,'Snacks',50),
(514,'Licores',50),
(515,'Cigarrillos',50),
(516,'Hobbies',50),
(517,'Cursos Recreativos',50),
(518,'Deportes Recreativos',50),
(519,'Libros',50),
(601,'Peluqueria',60),
(602,'Gimnasio',60),
(801,'Gasolina',80),
(802,'Mantenimiento',80),
(803,'Reparacion',80),
(804,'Transporte Publico',80),
(805,'Soat',80),
(806,'Parqueadero',80),
(901,'Arriendo',90),
(902,'Internet',90),
(903,'Luz',90),
(904,'Agua',90);