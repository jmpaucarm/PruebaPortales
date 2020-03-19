/*==============================================================*/
/* NOMBRE:				sMigracionConfiguration			        */
/* Creado por:			Miguel Altamirano						*/
/* Fecha Creación:      05/09/2019 9:47:08 AM					*/
/*==============================================================*/

Use CONFIGURATION_SC							--REEMPLAZAR CON NOMBRE DE BASE DE DATOS EN CREACION
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------BORRAR TABLAS------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--delete from CONFIGURATION_SC..Office
--delete from CONFIGURATION_SC..Regioninstitution
--delete from CONFIGURATION_SC..Institution
--delete from CONFIGURATION_SC..Holiday
--delete from CONFIGURATION_SC..GeographicLocation4
--delete from CONFIGURATION_SC..GeographicLocation3
--delete from CONFIGURATION_SC..GeographicLocation2
--delete from CONFIGURATION_SC..GeographicLocation1
--delete from CONFIGURATION_SC..CatalogueDetail
--delete from CONFIGURATION_SC..Catalogue
--delete from CONFIGURATION_SC..Parameter
--delete from CONFIGURATION_SC..Country
--delete from CONFIGURATION_SC..ESBEndPointException
--delete from CONFIGURATION_SC..ESBEndPoint
--delete from CONFIGURATION_SC..ESBException


----SI ES QUE SE CORRE VARIAS VECES EL MISMO SCRIPT HAY QUE EJECUTAR LAS SIGUIENTES LINEAS DE ENCERAR LOS CONTADORES
--DBCC CHECKIDENT (Office, RESEED, 0)
--DBCC CHECKIDENT (Regioninstitution, RESEED, 0)
--DBCC CHECKIDENT (institution, RESEED, 0)
--DBCC CHECKIDENT (Holiday, RESEED, 0)
--DBCC CHECKIDENT (GeographicLocation4, RESEED, 0)
--DBCC CHECKIDENT (GeographicLocation3, RESEED, 0)
--DBCC CHECKIDENT (GeographicLocation2, RESEED, 0)
--DBCC CHECKIDENT (GeographicLocation1, RESEED, 0)
--DBCC CHECKIDENT (CatalogueDetail, RESEED, 0)
--DBCC CHECKIDENT (Catalogue, RESEED, 0)
--DBCC CHECKIDENT (Parameter, RESEED, 0)
--DBCC CHECKIDENT (Country, RESEED, 0)
--DBCC CHECKIDENT (ESBEndPointException,RESEED, 0)
--DBCC CHECKIDENT (ESBEndPoint,RESEED, 0)
--DBCC CHECKIDENT (ESBException,RESEED, 0)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------CATALOGUE------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE	
@CatalogoMig									TABLE  (
Module											varchar(16)          ,
Code											varchar(64)          ,
Description										varchar(128)         ,
IsActive										bit                  ,
IsInstitution									bit                  ,
CreationDate									datetime             ,
CreationUserID									int                  ,
CreationOfficeID								int                  ,
UpdateDate										datetime             ,
UpdateUserID									int                  ,
UpdateOfficeID									int                  
)


/* POBLAMOS LA TABLA TEMPORAL */
INSERT INTO @CatalogoMig (Module, Code, Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) 
SELECT 
UPPER(Modulo),
UPPER(Nombre),
UPPER(Descripcion), 
CAST(
	CASE
		WHEN Estado = 'ACT'
			THEN 1
		ELSE 0
	END AS bit) as IsActive,
CAST(
	CASE
		WHEN EsPorInstitucion = 1
			THEN 1
		ELSE 0
	END AS bit) as EsPorInstitucion,
GETDATE(),
NULL,
NULL,
NULL,
NULL,
NULL 
FROM Configuracion..Catalogo 
where nombre in( 'TipoDoc','TipoInactividad','TipoParametro','Cargo','EstadoCivil','Genero','NivelInstruccionCli','TipoContrato','TipoDispositivo','TipoNacionalidad','TipoVivienda','ParentescoRelacion')

/* INSERTAMOS EN LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..Catalogue (Module, Code, Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) 
SELECT * FROM @CatalogoMig


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------CATALOGUE DETAIL------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE	
@CatalogoDetailMig									TABLE  (
IdCatalogue											int              ,
Code												varchar(32)      ,
Description											varchar(128)     ,
"Order"												int              ,
IsActive											bit              ,
CreationDate										datetime         ,
CreationUserID										int              ,
CreationOfficeID									int              ,
UpdateDate											datetime         ,
UpdateUserID										int              ,
UpdateOfficeID										int              
)


/* POBLAMOS LA TABLA TEMPORAL CON LOS FILTROS NECESARIOS */
INSERT INTO @CatalogoDetailMig (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) 
select 
scCatalogue.idCatalogue as idCatalogoDestino, 
UPPER(detCat.Codigo) as nombreDestino, 
detCat.Descripcion, 
detCat.Orden,
detCat.EsActivo,
GETDATE(),
NULL,
NULL,
NULL,
NULL,
NULL
from Configuracion..DetalleCatalogo as detCat inner Join Configuracion..Catalogo cat 
on detCat.IdCatalogo = cat.IdCatalogo
inner join CONFIGURATION_SC..Catalogue scCatalogue
on scCatalogue.Code = cat.nombre



/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..CatalogueDetail (IdCatalogue,Code,Description,"Order",IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeId) 
SELECT * FROM @CatalogoDetailMig



--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------- COUNTRY --------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE	
@CountryMig											TABLE  (
   Code												varchar(16),
   ShortCode										varchar(8) ,
   Name												varchar(64),
   AreaCode											varchar(16),
   IsActive											bit
)

INSERT INTO @CountryMig (Code, ShortCode, Name, AreaCode, IsActive)
select 
CodigoPais, 
Sigla,
Nombre,
CodigoArea, 
1 
from Configuracion..Pais



/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..Country (Code, ShortCode, Name, AreaCode, IsActive) 
SELECT * FROM @CountryMig


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------- GeographicLocation1 --------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE	
@GeographicLocation1Mig								TABLE  (
	IdCountry										int,
	GeographicLocation1Code							varchar(32),
	Name											varchar(128),
	IsActive										bit
)

DECLARE 
@IdCountryOrigen									int,
@IdCountryDestino									int

select @IdCountryOrigen = idPais from Configuracion..UbicacionGeografica1
select @IdCountryDestino = cs_country.IdCountry from Configuracion..Pais as cpais inner join
CONFIGURATION_SC..Country cs_country 
on cpais.Sigla = cs_country.ShortCode
where 
cpais.IdPais = @IdCountryOrigen

INSERT INTO @GeographicLocation1Mig (IdCountry,GeographicLocation1Code,Name,IsActive)
select 
@IdCountryDestino, 
CodigoUbicacionGeografica1,
Nombre,
EsActivo
from Configuracion..UbicacionGeografica1

/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..GeographicLocation1 (IdCountry, GeographicLocation1Code, Name, IsActive) 
SELECT * FROM @GeographicLocation1Mig


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------- GeographicLocation2 --------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------


DECLARE	
@GeographicLocation2Mig								TABLE  (
	IdGeographicLocation1							varchar(16),
	GeographicLocation2Code							varchar(32),
	Name											varchar(128),
	IsActive										bit
)

INSERT INTO @GeographicLocation2Mig (IdGeographicLocation1,GeographicLocation2Code,Name,IsActive)
select 
cs_UbiG.IdGeographicLocation1,
ub2.CodigoUbicacionGeografica2,
ub2.Nombre,
ub2.EsActivo
from Configuracion..UbicacionGeografica1 c_ubiG inner join
CONFIGURATION_SC..GeographicLocation1 cs_UbiG
on c_ubiG.CodigoUbicacionGeografica1 = cs_UbiG.GeographicLocation1Code
inner join 

Configuracion..UbicacionGeografica2 ub2 on
ub2.IdUbicacionGeografica1 = cs_UbiG.GeographicLocation1Code


/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..GeographicLocation2 (IdGeographicLocation1, GeographicLocation2Code, Name, IsActive) 
SELECT * FROM @GeographicLocation2Mig

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------- GeographicLocation3 --------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE	
@GeographicLocation3Mig								TABLE  (
	IdGeographicLocation2							varchar(16),
	GeographicLocation3Code							varchar(32),
	Name											varchar(128),
	IsActive										bit
)

INSERT INTO @GeographicLocation3Mig (IdGeographicLocation2,GeographicLocation3Code,Name,IsActive)
select 
Cs_gu2.IdGeographicLocation2,
ubg3.CodigoUbicacionGeografica3,
ubg3.Nombre,
ubg3.EsActivo
from 
CONFIGURATION_SC..GeographicLocation2 Cs_gu2 inner join
Configuracion..UbicacionGeografica2 ubg2 
on Cs_gu2.GeographicLocation2Code = ubg2.CodigoUbicacionGeografica2
inner join
Configuracion..UbicacionGeografica3 ubg3 on  ubg3.IdUbicacionGeografica2 = ubg2.IdUbicacionGeografica2


/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..GeographicLocation3 (IdGeographicLocation2, GeographicLocation3Code, Name, IsActive) 
SELECT * FROM @GeographicLocation3Mig

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------- GeographicLocation4 --------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE	
@GeographicLocation4Mig								TABLE  (
	IdGeographicLocation3							varchar(16),
	GeographicLocation4Code							varchar(32),
	Name											varchar(128),
	IsActive										bit
)

INSERT INTO @GeographicLocation4Mig (IdGeographicLocation3,GeographicLocation4Code,Name,IsActive)
select 
Cs_gu3.IdGeographicLocation3,
ubg4.CodigoUbicacionGeografica4,
ubg4.Nombre,
ubg4.EsActivo
from 
CONFIGURATION_SC..GeographicLocation3 Cs_gu3 inner join
Configuracion..UbicacionGeografica3 ubg3 
on Cs_gu3.GeographicLocation3Code = ubg3.CodigoUbicacionGeografica3
inner join
Configuracion..UbicacionGeografica4 ubg4 on ubg4.IdUbicacionGeografica3 = ubg3.IdUbicacionGeografica3


/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..GeographicLocation4 (IdGeographicLocation3, GeographicLocation4Code, Name, IsActive) 
SELECT * FROM @GeographicLocation4Mig



--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------- Holiday -------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE	
@HolidayMig												TABLE  (
Year													int,     
IdGeographicLocation2									int,    
DateHoliday												smalldatetime,     
IsLocal													bit,     
IsActive												bit,     
Description												varchar(128),     
CreationDate											datetime,     
CreationUserID											int,     
CreationOfficeID										int,     
UpdateDate												datetime,     
UpdateUserID											int,     
UpdateOfficeID											int                 
)

INSERT INTO @HolidayMig (Year,IdGeographicLocation2	,DateHoliday,IsLocal,IsActive,Description,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID)
select 
cdf.Anio,

CAST(
	CASE
		WHEN CS_GL.IdGeographicLocation2 IS NULL
			THEN 0
		ELSE CS_GL.IdGeographicLocation2
	END AS int) as IdGeographicLocation2,
cdf.Fecha,
cdf.EsLocal,
cdf.EsActivo,
cdf.Descripcion,
GETDATE(),
NULL,
NULL,
NULL,
NULL,
NULL
from Configuracion..DiaFeriado cdf
full outer join  Configuracion..UbicacionGeografica2 ug2
on cdf.IdUbicacionGeografica2 = ug2.IdUbicacionGeografica2
full outer join CONFIGURATION_SC..GeographicLocation2 CS_GL
on ug2.CodigoUbicacionGeografica2 = CS_GL.GeographicLocation2Code
where Anio > 2018 

/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..Holiday(Year,IdGeographicLocation2	,DateHoliday,IsLocal,IsActive,Description,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) 
SELECT * FROM @HolidayMig


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------- Institution -------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE	
@InstitutionMig												TABLE  (
idInstitution												int         ,
Ruc															varchar(16) ,
Code														varchar(16) ,
Name														varchar(128),
RepresentativeTypeDni										varchar(16)	,
RepresentativeDni											varchar(16) ,
RepresentativeName											varchar(64) ,
RepresentativeEmail											varchar(64) ,
RepresentativePhone											varchar(64) ,
Domain														varchar(64) ,
Design														varchar(64) ,
IsOwner													bit         ,
IsActive													bit         ,
CompanyCode													varchar(16) ,
CreationDate												datetime    ,
CreationUserID												int         ,
CreationOfficeID											int         ,
UpdateDate													datetime    ,
UpdateUserID												int         ,
UpdateOfficeID												int         
)

--INSERT INTO institution (Ruc,Name,RepresentativeTypeDni,RepresentativeDni,RepresentativeName,RepresentativeEmail,RepresentativePhone,Domain,Design,IsActive,CompanyCode,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values
--('1','1','CED','1','REPRESENTANTE LEGAL',NULL,'123456789','1',	NULL,1,	41,	'2019-10-10 13:05:43.913',	NULL,	NULL,	NULL,	NULL,	NULL)

INSERT INTO @InstitutionMig (idInstitution, Ruc,code,Name,RepresentativeTypeDni,RepresentativeDni,RepresentativeName,RepresentativeEmail,RepresentativePhone,Domain,Design,IsOwner,IsActive,CompanyCode,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID)
select 
2,
Ruc,
'BDA',
Nombre,
TipoIdentificacionRepresentante,
IdentificacionRepresentante,
Representante,
NULL,
TelefonoRepresentante,
DominioMail,
NULL,
0,
EsActivo,
CodigoEmpresa,
GETDATE(),
NULL,
NULL,
NULL,
NULL,
NULL
from Configuracion..Institucion
WHERE IdInstitucion = 2 

SET IDENTITY_INSERT Institution  ON 

/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..Institution(idInstitution, Ruc,code,Name,RepresentativeTypeDni,RepresentativeDni,RepresentativeName,RepresentativeEmail,RepresentativePhone,Domain,Design,IsOwner,IsActive,CompanyCode,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID)
SELECT * FROM @InstitutionMig

SET IDENTITY_INSERT Institution  OFF
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------- RegionInstitucion -------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE	
@RegionInstitucionMig												TABLE  (
IdInstitution														int,
Code_																varchar(16),
Name																varchar(128),
ShortName															varchar(64),
Descripcion															varchar(128)
)

INSERT INTO @RegionInstitucionMig (IdInstitution,Code_,Name,ShortName,Descripcion)
select 
CS_inst.IdInstitution,
NULL,
crinst.Nombre,
crinst.NombreCorto,
NULL
from Configuracion..RegionInstitucion crinst
inner join Configuracion..Institucion cinst
on crinst.IdInstitucion = cinst.IdInstitucion
inner join CONFIGURATION_SC..Institution CS_inst
on CS_inst.CompanyCode COLLATE DATABASE_DEFAULT =cinst.CodigoEmpresa COLLATE DATABASE_DEFAULT


/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..RegionInstitution(IdInstitution,Code_,Name,ShortName,Descripcion)
SELECT * FROM @RegionInstitucionMig

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------- Office -------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE	
@OfficeMig												TABLE  (
IdOffice													int,
IdInstitution											int,
IdRegionInstitution										int,
Type													varchar(16),
Category												varchar(16),
Name													varchar(128),
Address													varchar(128),
Phone1													varchar(16),
Phone2													varchar(16),
Phone3													varchar(16),
Email													varchar(64),
Contact													varchar(256),
IdGeographicLocation1									int,
IdGeographicLocation2									int,
CoordinateX												varchar(32),
CoordinateY												varchar(32),
IsActive												bit,
IdOfficeDepend											varchar(32),
IdOfficeCtb												int,
CreationDate											datetime,
CreationUserID											int,
CreationOfficeID										int,
UpdateDate												datetime,
UpdateUserID											int,
UpdateOfficeID											int		  
)

INSERT INTO @OfficeMig
(IdOffice, IdInstitution,IdRegionInstitution,Type,Category,Name,Address,Phone1,Phone2,Phone3,Email,Contact,IdGeographicLocation1,IdGeographicLocation2,CoordinateX,CoordinateY,IsActive,IdOfficeDepend,IdOfficeCtb,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID)
select
cof.IdOficina,
CS_inst.IdInstitution,--CS_inst.Name, CS_inst.CompanyCode, --cof.IdInstitucion,
CS_ri.IdRegionInstitution,--cof.IdRegionInstitucion,
cof.Tipo,cof.CategoriaOficina,cof.Nombre,cof.Direccion,cof.Telefono1,cof.Telefono2,cof.TelefonoContacto,
cof.Email,cof.NombreContacto,CS_gu1.IdGeographicLocation1,CS_gu2.IdGeographicLocation2,NULL,NULL,cof.EsActivo,
NULL,NULL,GETDATE(),NULL,NULL,NULL,NULL,NULL
from Configuracion..Oficina cof inner join Configuracion..UbicacionGeografica1 ubg1 
on cof.IdUbicacionGeografica1 = ubg1.CodigoUbicacionGeografica1 
inner join Configuracion..UbicacionGeografica2 ubg2 on cof.IdUbicacionGeografica2 = ubg2.IdUbicacionGeografica2
inner join CONFIGURATION_SC..GeographicLocation1 CS_gu1 on CS_gu1.GeographicLocation1Code = ubg1.CodigoUbicacionGeografica1
inner join CONFIGURATION_SC..GeographicLocation2 CS_gu2 on CS_gu2.GeographicLocation2Code = ubg2.CodigoUbicacionGeografica2
inner join Configuracion..Institucion cinst on cinst.IdInstitucion = cof.IdInstitucion
inner join CONFIGURATION_SC..institution CS_inst on CS_inst.CompanyCode COLLATE DATABASE_DEFAULT = cinst.CodigoEmpresa COLLATE DATABASE_DEFAULT
inner join Configuracion..RegionInstitucion cri on cri.IdRegionInstitucion = cof.IdRegionInstitucion
inner join CONFIGURATION_SC..RegionInstitution CS_ri on 
CS_ri.ShortName COLLATE DATABASE_DEFAULT = cri.NombreCorto COLLATE DATABASE_DEFAULT and
CS_ri.Name COLLATE DATABASE_DEFAULT = cri.Nombre COLLATE DATABASE_DEFAULT and
CS_ri.IdInstitution = CS_inst.IdInstitution 


--where cof.Nombre = 'CENTRAL' 
 WHERE cof.IdInstitucion = 2 and cof.tipo = 'SUC' AND cof.EsActivo = 1


 SET IDENTITY_INSERT Office  ON 
/* INSERTAMOS LA TABLA DEFINITIVA */
INSERT INTO CONFIGURATION_SC..Office(IdOffice, IdInstitution,IdRegionInstitution,Type,Category,Name,Address,Phone1,Phone2,Phone3,Email,Contact,IdGeographicLocation1,IdGeographicLocation2,CoordinateX,CoordinateY,IsActive,IdOfficeDepend,IdOfficeCtb,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID)
SELECT * FROM @OfficeMig
SET IDENTITY_INSERT Office  OFF


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------CARGA INICIAL INDIVIDUAL------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--CARGA DE TABLAS DE CATALOGOS, CATALOGOS DETALLES, Y PARAMETROS
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('GNR','IdentificationType','Tipos de identificación',1,0,null,null,null,null,null,null)
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('SEC','InactivityType','Tipo de inactividad',1,0,null,null,null,null,null,null)
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('GNR','Modulos','Módulos del sistema',1,0,null,null,null,null,null,null)
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('CLI','TipoReferencia','Tipo de referencia',1,0,null,null,null,null,null,null)
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('GNR','TipoParametro','Tipo de parámetro',1,0,null,null,null,null,null,null)

INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='IdentificationType'),'CED','Cédula',1,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='IdentificationType'),'PASAPORTE','Pasaporte',2,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='IdentificationType'),'RUC','Ruc',3,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='InactivityType'),'NINGUNA','Ninguna',1,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='InactivityType'),'ENFERMEDAD','Enfermedad',2,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='InactivityType'),'MATERNIDAD','Maternidad',3,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='InactivityType'),'VACACIONES','Vacaciones',4,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='Modulos'),'GNR','General',1,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='Modulos'),'SEC','Seguridad',2,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='Modulos'),'CON','Configuración',3,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='Modulos'),'STC','Suite Crd',4,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='TipoReferencia'),'Familiar','Familiar',1,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='TipoReferencia'),'Personal','Personal',2,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='TipoReferencia'),'Laboral','Laboral',3,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='TipoReferencia'),'Arrendatario','Arrendatario',4,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='TipoParametro'),'DATE','Fecha',1,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='TipoParametro'),'INT','Entero',2,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='TipoParametro'),'DECIMAL','Decimal',3,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='TipoParametro'),'STRING','Texto',4,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((Select IdCatalogue from Catalogue where Code ='TipoParametro'),'BOOL','Boleano',5,1,NULL,NULL,NULL,NULL,NULL,NULL)

--93

INSERT INTO [Parameter] (System,Code,Description,Type,IntegerValue,DecimalValue,TextValue,DateValue,BooleanValue,IsInstitution,IsEncripted,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('SEC','NUM_INTENTOS_CLAVE','Número de intentos permitidos para iniciar sesión','INTE',5,NULL,'','','',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [Parameter] (System,Code,Description,Type,IntegerValue,DecimalValue,TextValue,DateValue,BooleanValue,IsInstitution,IsEncripted,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('GNR','FECHASISTEMA','Fecha de transacción del sistema','DATE',0,NULL,'','2020-02-02','',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [Parameter] (System,Code,Description,Type,IntegerValue,DecimalValue,TextValue,DateValue,BooleanValue,IsInstitution,IsEncripted,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('GNR','FECHASISTEMABATCH','Fecha de transacción del sistema BATCH','DATE',0,NULL,'','2020-02-02','',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [Parameter] (System,Code,Description,Type,IntegerValue,DecimalValue,TextValue,DateValue,BooleanValue,IsInstitution,IsEncripted,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('SEC','DIAS_VALIDEZ_CLAVE','Días de validez de una clave de usuario','INTE',30,NULL,'','','',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [Parameter] (System,Code,Description,Type,IntegerValue,DecimalValue,TextValue,DateValue,BooleanValue,IsInstitution,IsEncripted,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('GNR','CORREOGENERAL','Usuario de coreo para el envio de mails','STRI',0,NULL,'BANTIGUA.COM.GT','2018-01-15 00:00:00.000','',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [Parameter] (System,Code,Description,Type,IntegerValue,DecimalValue,TextValue,DateValue,BooleanValue,IsInstitution,IsEncripted,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('SEC','DIAS_EXPIRACION_CLAVE','Número de días que deberá desplegarse un aviso para que el usuario cambie de clave.','INTE',3,NULL,'','','',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL)

--7


---CARGA EXCEPCIONES ESB----

INSERT INTO [ESBEndPoint] ([Code], [Description]) values ('ESB','Enterprise Service Bus')
INSERT INTO [ESBException] ([ErrorCode],[Description]) values ('ESB999','Codigo/EndPoint No Existe')
INSERT INTO [ESBEndPointException] ([IdESBEndPoint],[IdESBException],[EndPointErrorCode],[EndPointMessage]) values 
((select IdESBEndPoint from  CONFIGURATION_SC..ESBEndPoint where Code ='ESB'),
(select IdESBException from  CONFIGURATION_SC..ESBException where ErrorCode ='ESB999'),
'999',
'Codigo/EndPoint No Existe'
)

-- carga institucion inicial
--SET IDENTITY_INSERT Institution  ON
--INSERT INTO [Institution] (IdInstitution,Ruc,code,Name,RepresentativeTypeDni,RepresentativeDni,RepresentativeName,RepresentativeEmail,RepresentativePhone,Domain,Design,IsOwner,IsActive,CompanyCode,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values (0,'1111111111111','GENERAL','Representante','CED','1111111111','JUAN PÉREZ','juanperez@portalesit.net','09999999','portalesit.net',1,1,1,'0',NULL,NULL,NULL,NULL,NULL,NULL)
--SET IDENTITY_INSERT Institution  OFF 



--SET IDENTITY_INSERT Office  OFF 
--INSERT INTO [Office] (IdInstitution,IdRegionInstitution,Type,Category,Name,Address,Phone1,Phone2,Phone3,Email,Contact,IdGeographicLocation1,IdGeographicLocation2,CoordinateX,CoordinateY,IsActive,IdOfficeDepend,IdOfficeCtb,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values (0,1,'SUC','MEDIA','MATRIZ','JUAN DE ASCARAY Y AV. 10 DE AGOSTO','2665789','','','MATRIZ@PORTALESIT.NET','MÓNICA ESPÍN',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
--SET IDENTITY_INSERT Office  ON 

