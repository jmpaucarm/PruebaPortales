Use master

IF  EXISTS (SELECT * FROM sys.databases WHERE name = 'CONFIGURATION_SC')
BEGIN
DROP DATABASE [CONFIGURATION_SC]
END


CREATE DATABASE CONFIGURATION_SC
go
USE CONFIGURATION_SC


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CatalogueDetail') and o.name = 'FK_CATALOGU_REFERENCE_CATALOGU1')
alter table CatalogueDetail
   drop constraint FK_CATALOGU_REFERENCE_CATALOGU1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CatalogueDetailIns') and o.name = 'FK_CATALOGU_REFERENCE_INSTITUT')
alter table CatalogueDetailIns
   drop constraint FK_CATALOGU_REFERENCE_INSTITUT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CatalogueDetailIns') and o.name = 'FK_CATALOGU_REFERENCE_CATALOGU')
alter table CatalogueDetailIns
   drop constraint FK_CATALOGU_REFERENCE_CATALOGU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESBEndPointException') and o.name = 'FK_ESBENDPO_REFERENCE_ESBEXCEP')
alter table ESBEndPointException
   drop constraint FK_ESBENDPO_REFERENCE_ESBEXCEP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESBEndPointException') and o.name = 'FK_ESBENDPO_REFERENCE_ESBENDPO')
alter table ESBEndPointException
   drop constraint FK_ESBENDPO_REFERENCE_ESBENDPO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('GeographicLocation1') and o.name = 'FK_GEOGRAPH_REFERENCE_COUNTRY')
alter table GeographicLocation1
   drop constraint FK_GEOGRAPH_REFERENCE_COUNTRY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('GeographicLocation2') and o.name = 'FK_GEOGRAPH_REFERENCE_GEOGRAPH2')
alter table GeographicLocation2
   drop constraint FK_GEOGRAPH_REFERENCE_GEOGRAPH2
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('GeographicLocation3') and o.name = 'FK_GEOGRAPH_REFERENCE_GEOGRAPH3')
alter table GeographicLocation3
   drop constraint FK_GEOGRAPH_REFERENCE_GEOGRAPH3
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('GeographicLocation4') and o.name = 'FK_GEOGRAPH_REFERENCE_GEOGRAPH4')
alter table GeographicLocation4
   drop constraint FK_GEOGRAPH_REFERENCE_GEOGRAPH4
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('InstitutionSystem') and o.name = 'FK_INSTITUT_REFERENCE_INSTITUT')
alter table InstitutionSystem
   drop constraint FK_INSTITUT_REFERENCE_INSTITUT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Office') and o.name = 'FK_OFFICE_REFERENCE_INSTITUT')
alter table Office
   drop constraint FK_OFFICE_REFERENCE_INSTITUT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ParameterInstitution') and o.name = 'FK_PARAMETE_REFERENCE_PARAMETE')
alter table ParameterInstitution
   drop constraint FK_PARAMETE_REFERENCE_PARAMETE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Catalogue')
            and   name  = 'IX_Catalogue'
            and   indid > 0
            and   indid < 255)
   drop index Catalogue.IX_Catalogue
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Catalogue')
            and   type = 'U')
   drop table Catalogue
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CatalogueDetail')
            and   name  = 'IX_CatalogueDetail'
            and   indid > 0
            and   indid < 255)
   drop index CatalogueDetail.IX_CatalogueDetail
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CatalogueDetail')
            and   type = 'U')
   drop table CatalogueDetail
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CatalogueDetailIns')
            and   type = 'U')
   drop table CatalogueDetailIns
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Country')
            and   name  = 'IX_Country'
            and   indid > 0
            and   indid < 255)
   drop index Country.IX_Country
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Country')
            and   type = 'U')
   drop table Country
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESBEndPoint')
            and   type = 'U')
   drop table ESBEndPoint
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ESBEndPointException')
            and   name  = 'IX_ESBEndpointException'
            and   indid > 0
            and   indid < 255)
   drop index ESBEndPointException.IX_ESBEndpointException
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESBEndPointException')
            and   type = 'U')
   drop table ESBEndPointException
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESBException')
            and   type = 'U')
   drop table ESBException
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('GeographicLocation1')
            and   name  = 'IX_GeographicLocation1'
            and   indid > 0
            and   indid < 255)
   drop index GeographicLocation1.IX_GeographicLocation1
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GeographicLocation1')
            and   type = 'U')
   drop table GeographicLocation1
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('GeographicLocation2')
            and   name  = 'IX_GeographicLocation2'
            and   indid > 0
            and   indid < 255)
   drop index GeographicLocation2.IX_GeographicLocation2
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GeographicLocation2')
            and   type = 'U')
   drop table GeographicLocation2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('GeographicLocation3')
            and   name  = 'IX_GeographicLocation3'
            and   indid > 0
            and   indid < 255)
   drop index GeographicLocation3.IX_GeographicLocation3
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GeographicLocation3')
            and   type = 'U')
   drop table GeographicLocation3
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('GeographicLocation4')
            and   name  = 'IX_GeographicLocation4'
            and   indid > 0
            and   indid < 255)
   drop index GeographicLocation4.IX_GeographicLocation4
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GeographicLocation4')
            and   type = 'U')
   drop table GeographicLocation4
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Holiday')
            and   name  = 'IX_Holiday1'
            and   indid > 0
            and   indid < 255)
   drop index Holiday.IX_Holiday1
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Holiday')
            and   name  = 'IX_Holiday'
            and   indid > 0
            and   indid < 255)
   drop index Holiday.IX_Holiday
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Holiday')
            and   type = 'U')
   drop table Holiday
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Institution')
            and   name  = 'IX_Institution'
            and   indid > 0
            and   indid < 255)
   drop index Institution.IX_Institution
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Institution')
            and   name  = 'IX_InstitutionCode'
            and   indid > 0
            and   indid < 255)
   drop index Institution.IX_InstitutionCode
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Institution')
            and   type = 'U')
   drop table Institution
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('InstitutionSystem')
            and   name  = 'IX_InstitutionSystem'
            and   indid > 0
            and   indid < 255)
   drop index InstitutionSystem.IX_InstitutionSystem
go

if exists (select 1
            from  sysobjects
           where  id = object_id('InstitutionSystem')
            and   type = 'U')
   drop table InstitutionSystem
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Office')
            and   name  = 'IX_Office'
            and   indid > 0
            and   indid < 255)
   drop index Office.IX_Office
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Office')
            and   type = 'U')
   drop table Office
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Parameter')
            and   name  = 'IX_Parameter'
            and   indid > 0
            and   indid < 255)
   drop index Parameter.IX_Parameter
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Parameter')
            and   type = 'U')
   drop table Parameter
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ParameterInstitution')
            and   name  = 'IX_ParameterInstitution'
            and   indid > 0
            and   indid < 255)
   drop index ParameterInstitution.IX_ParameterInstitution
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ParameterInstitution')
            and   type = 'U')
   drop table ParameterInstitution
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RegionInstitution')
            and   type = 'U')
   drop table RegionInstitution
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Zone')
            and   name  = 'IX_Countryn'
            and   indid > 0
            and   indid < 255)
   drop index Zone.IX_Countryn
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Zone')
            and   type = 'U')
   drop table Zone
go

/*==============================================================*/
/* Table: Catalogue                                             */
/*==============================================================*/
create table Catalogue (
   IdCatalogue          int                  identity(1, 1),
   Module               varchar(16)          collate Modern_Spanish_CI_AS not null,
   Code                 varchar(64)          collate Modern_Spanish_CI_AS not null,
   Description          varchar(128)         collate Modern_Spanish_CI_AS not null,
   IsActive             bit                  not null default 1,
   IsInstitution        bit                  not null default 0,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
on "PRIMARY"
go

alter table Catalogue
   add constraint PK_CATALOGUE primary key (IdCatalogue)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_Catalogue                                          */
/*==============================================================*/
create unique index IX_Catalogue on Catalogue (
Code ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: CatalogueDetail                                       */
/*==============================================================*/
create table CatalogueDetail (
   IdCatalogueDetail    int                  identity(1, 1),
   IdCatalogue          int                  not null,
   Code                 varchar(32)          collate Modern_Spanish_CI_AS not null,
   Description          varchar(128)         collate Modern_Spanish_CI_AS not null,
   "Order"              int                  null default 1,
   IsActive             bit                  not null default 1,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
on "PRIMARY"
go

alter table CatalogueDetail
   add constraint PK_CATALOGUEDETAIL primary key (IdCatalogueDetail)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_CatalogueDetail                                    */
/*==============================================================*/
create unique index IX_CatalogueDetail on CatalogueDetail (
Code ASC,
IdCatalogue ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: CatalogueDetailIns                                    */
/*==============================================================*/
create table CatalogueDetailIns (
   IdCatalogueDetailsIns numeric              identity,
   IdInstitution        int                  null,
   IdCatalogue          int                  null
)
go

alter table CatalogueDetailIns
   add constraint PK_CATALOGUEDETAILINS primary key (IdCatalogueDetailsIns)
go

/*==============================================================*/
/* Table: Country                                               */
/*==============================================================*/
create table Country (
   IdCountry            int                  identity(1, 1),
   Code                 varchar(16)          collate Modern_Spanish_CI_AS not null,
   ShortCode            varchar(8)           collate Modern_Spanish_CI_AS null,
   Name                 varchar(64)          collate Modern_Spanish_CI_AS not null,
   AreaCode             varchar(16)          collate Modern_Spanish_CI_AS null,
   IsActive             bit                  null default 1
)
on "PRIMARY"
go

alter table Country
   add constraint PK_COUNTRY primary key (IdCountry)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_Country                                            */
/*==============================================================*/
create unique index IX_Country on Country (
Code ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: ESBEndPoint                                           */
/*==============================================================*/
create table ESBEndPoint (
   IdESBEndPoint        integer              identity,
   Code                 varchar(32)          null,
   Description          varchar(128)         null
)
go

alter table ESBEndPoint
   add constraint PK_ESBENDPOINT primary key (IdESBEndPoint)
go

/*==============================================================*/
/* Table: ESBEndPointException                                  */
/*==============================================================*/
create table ESBEndPointException (
   IdESBEndPointException int                  identity,
   IdESBEndPoint        int                  null,
   IdESBException       int                  null,
   EndPointErrorCode    varchar(32)          null,
   EndPointMessage      varchar(128)         null
)
go

alter table ESBEndPointException
   add constraint PK_ESBENDPOINTEXCEPTION primary key (IdESBEndPointException)
go

/*==============================================================*/
/* Index: IX_ESBEndpointException                               */
/*==============================================================*/
create unique index IX_ESBEndpointException on ESBEndPointException (
IdESBEndPoint ASC,
EndPointErrorCode ASC
)
go

/*==============================================================*/
/* Table: ESBException                                          */
/*==============================================================*/
create table ESBException (
   IdESBException       integer              identity,
   ErrorCode            varchar(16)          null,
   Description          varchar(64)          null
)
go

alter table ESBException
   add constraint PK_ESBEXCEPTION primary key (IdESBException)
go

/*==============================================================*/
/* Table: GeographicLocation1                                   */
/*==============================================================*/
create table GeographicLocation1 (
   IdGeographicLocation1 int                  identity(1, 1),
   IdCountry            int                  null,
   GeographicLocation1Code varchar(32)          collate Modern_Spanish_CI_AS not null,
   Name                 varchar(128)         collate Modern_Spanish_CI_AS not null,
   IsActive             bit                  null default 1
)
on "PRIMARY"
go

alter table GeographicLocation1
   add constraint PK_GEOGRAPHICLOCATION1 primary key (IdGeographicLocation1)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_GeographicLocation1                                */
/*==============================================================*/
create unique index IX_GeographicLocation1 on GeographicLocation1 (
GeographicLocation1Code ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: GeographicLocation2                                   */
/*==============================================================*/
create table GeographicLocation2 (
   IdGeographicLocation2 int                  identity(1, 1),
   IdGeographicLocation1 int                  null,
   GeographicLocation2Code varchar(32)          collate Modern_Spanish_CI_AS not null,
   IsActive             bit                  null default 1,
   Name                 varchar(128)         collate Modern_Spanish_CI_AS not null
)
on "PRIMARY"
go

alter table GeographicLocation2
   add constraint PK_GEOGRAPHICLOCATION2 primary key (IdGeographicLocation2)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_GeographicLocation2                                */
/*==============================================================*/
create unique index IX_GeographicLocation2 on GeographicLocation2 (
GeographicLocation2Code ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: GeographicLocation3                                   */
/*==============================================================*/
create table GeographicLocation3 (
   IdGeographicLocation3 int                  identity(1, 1),
   IdGeographicLocation2 int                  null,
   GeographicLocation3Code varchar(32)          collate Modern_Spanish_CI_AS not null,
   Name                 varchar(128)         collate Modern_Spanish_CI_AS not null,
   IsActive             bit                  null default 1
)
on "PRIMARY"
go

alter table GeographicLocation3
   add constraint PK_GEOGRAPHICLOCATION3 primary key (IdGeographicLocation3)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_GeographicLocation3                                */
/*==============================================================*/
create unique index IX_GeographicLocation3 on GeographicLocation3 (
GeographicLocation3Code ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: GeographicLocation4                                   */
/*==============================================================*/
create table GeographicLocation4 (
   IdGeographicLocation4 int                  identity(1, 1),
   IdGeographicLocation3 int                  null,
   GeographicLocation4Code varchar(32)          collate Modern_Spanish_CI_AS not null,
   Name                 varchar(128)         collate Modern_Spanish_CI_AS not null,
   IsActive             bit                  null default 1
)
on "PRIMARY"
go

alter table GeographicLocation4
   add constraint PK_GEOGRAPHICLOCATION4 primary key (IdGeographicLocation4)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_GeographicLocation4                                */
/*==============================================================*/
create index IX_GeographicLocation4 on GeographicLocation4 (
GeographicLocation4Code ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Holiday                                               */
/*==============================================================*/
create table Holiday (
   IdHoliday            int                  identity,
   Year                 int                  null,
   IdGeographicLocation2 int                  not null,
   DateHoliday          smalldatetime        not null,
   IsLocal              bit                  null,
   IsActive             bit                  null,
   Description          varchar(128)         null,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
go

alter table Holiday
   add constraint PK_HOLIDAY primary key (IdHoliday)
go

/*==============================================================*/
/* Index: IX_Holiday                                            */
/*==============================================================*/
create unique index IX_Holiday on Holiday (
DateHoliday ASC,
IdGeographicLocation2 ASC
)
go

/*==============================================================*/
/* Index: IX_Holiday1                                           */
/*==============================================================*/
create index IX_Holiday1 on Holiday (
IdGeographicLocation2 ASC
)
go

/*==============================================================*/
/* Table: Institution                                           */
/*==============================================================*/
create table Institution (
   IdInstitution        int                  identity(1, 1),
   Ruc                  varchar(16)          collate Modern_Spanish_CI_AS not null,
   Code                 varchar(32)          null,
   Name                 varchar(128)         collate Modern_Spanish_CI_AS not null,
   RepresentativeTypeDni varchar(16)          collate Modern_Spanish_CI_AS null,
   RepresentativeDni    varchar(16)          collate Modern_Spanish_CI_AS null,
   RepresentativeName   varchar(64)          collate Modern_Spanish_CI_AS null,
   RepresentativeEmail  varchar(64)          collate Modern_Spanish_CI_AS null,
   RepresentativePhone  varchar(64)          collate Modern_Spanish_CI_AS null,
   Domain               varchar(64)          collate Modern_Spanish_CI_AS null,
   Design               varchar(64)          collate Modern_Spanish_CI_AS null,
   IsOwner              bit                  not null default 0,
   IsActive             bit                  not null default 1,
   CompanyCode          varchar(16)          null,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
on "PRIMARY"
go

alter table Institution
   add constraint PK_INSTITUTION primary key (IdInstitution)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_InstitutionCode                                    */
/*==============================================================*/
create unique index IX_InstitutionCode on Institution (
Code ASC
)
go

/*==============================================================*/
/* Index: IX_Institution                                        */
/*==============================================================*/
create unique index IX_Institution on Institution (
Ruc ASC
)
go

/*==============================================================*/
/* Table: InstitutionSystem                                     */
/*==============================================================*/
create table InstitutionSystem (
   IdInstitutionSystem  int                  identity(1, 1),
   IdInstitution        int                  null,
   System               varchar(16)          collate Modern_Spanish_CI_AS not null
)
on "PRIMARY"
go

alter table InstitutionSystem
   add constraint PK_INSTITUTIONSYSTEM primary key (IdInstitutionSystem)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_InstitutionSystem                                  */
/*==============================================================*/
create index IX_InstitutionSystem on InstitutionSystem (
IdInstitution ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Office                                                */
/*==============================================================*/
create table Office (
   IdOffice             int                  identity(1, 1),
   IdInstitution        int                  not null,
   IdRegionInstitution  int                  null,
   Type                 varchar(16)          null,
   Category             varchar(16)          null,
   Name                 varchar(128)         collate Modern_Spanish_CI_AS not null,
   Address              varchar(128)         collate Modern_Spanish_CI_AS null,
   Phone1               varchar(16)          collate Modern_Spanish_CI_AS null,
   Phone2               varchar(16)          collate Modern_Spanish_CI_AS null,
   Phone3               varchar(16)          collate Modern_Spanish_CI_AS null,
   Email                varchar(64)          collate Modern_Spanish_CI_AS null,
   Contact              varchar(256)         collate Modern_Spanish_CI_AS not null,
   IdGeographicLocation1 int                  null,
   IdGeographicLocation2 int                  null,
   CoordinateX          varchar(32)          collate Modern_Spanish_CI_AS null,
   CoordinateY          varchar(32)          collate Modern_Spanish_CI_AS null,
   IsActive             bit                  not null default 1,
   IdOfficeDepend       varchar(32)          null,
   IdOfficeCtb          int                  null default 0,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
on "PRIMARY"
go

alter table Office
   add constraint PK_OFFICE primary key (IdOffice)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_Office                                             */
/*==============================================================*/
create unique index IX_Office on Office (
Name ASC,
IdInstitution ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Parameter                                             */
/*==============================================================*/
create table Parameter (
   IdParameter          int                  identity(1, 1),
   System               varchar(16)          collate Modern_Spanish_CI_AS not null,
   Code                 varchar(32)          collate Modern_Spanish_CI_AS not null,
   Description          varchar(128)         collate Modern_Spanish_CI_AS not null,
   Type                 varchar(16)          collate Modern_Spanish_CI_AS not null,
   IntegerValue         int                  not null,
   DecimalValue         decimal(19,2)        null,
   TextValue            varchar(256)         collate Modern_Spanish_CI_AS null,
   DateValue            datetime             null,
   BooleanValue         bit                  null,
   IsInstitution        bit                  null default 0,
   IsEncripted          bit                  null default 0,
   IsActive             bit                  not null default 1,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
on "PRIMARY"
go

alter table Parameter
   add constraint PK_PARAMETER primary key (IdParameter)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_Parameter                                          */
/*==============================================================*/
create unique index IX_Parameter on Parameter (
Code ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: ParameterInstitution                                  */
/*==============================================================*/
create table ParameterInstitution (
   IdParameterInstitution int                  identity(1, 1),
   IdInstitution        int                  not null,
   IdParameter          int                  not null,
   IntegerValue         int                  not null default 0,
   DecimalValue         decimal(19,2)        null,
   TextValue            varchar(256)         collate Modern_Spanish_CI_AS null,
   DateValue            datetime             null,
   BooleanValue         bit                  null,
   IsActive             bit                  not null,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
on "PRIMARY"
go

alter table ParameterInstitution
   add constraint PK_PARAMETERINSTITUTION primary key (IdParameterInstitution)
go

/*==============================================================*/
/* Index: IX_ParameterInstitution                               */
/*==============================================================*/
create unique index IX_ParameterInstitution on ParameterInstitution (
IdParameter ASC,
IdInstitution ASC
)
go

/*==============================================================*/
/* Table: RegionInstitution                                     */
/*==============================================================*/
create table RegionInstitution (
   IdRegionInstitution  int                  identity,
   IdInstitution        int                  null,
   Code_                varchar(16)          null,
   Name                 varchar(128)         null,
   ShortName            varchar(64)          null,
   Descripcion          varchar(128)         null
)
go

alter table RegionInstitution
   add constraint PK_REGIONINSTITUTION primary key (IdRegionInstitution)
go

/*==============================================================*/
/* Table: Zone                                                  */
/*==============================================================*/
create table Zone (
   IdZone               int                  identity(1, 1),
   GeographicLocationCode varchar(16)          collate Modern_Spanish_CI_AS null,
   ZoneCode             varchar(16)          collate Modern_Spanish_CI_AS not null,
   Description          varchar(256)         collate Modern_Spanish_CI_AS null,
   Data                 varchar(1024)        collate Modern_Spanish_CI_AS null
)
on "PRIMARY"
go

alter table Zone
   add constraint PK_ZONE primary key (IdZone)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_Countryn                                           */
/*==============================================================*/
create index IX_Countryn on Zone (
GeographicLocationCode ASC
)
on "PRIMARY"
go

alter table CatalogueDetail
   add constraint FK_CATALOGU_REFERENCE_CATALOGU1 foreign key (IdCatalogue)
      references Catalogue (IdCatalogue)
go

alter table CatalogueDetailIns
   add constraint FK_CATALOGU_REFERENCE_INSTITUT foreign key (IdInstitution)
      references Institution (IdInstitution)
go

alter table CatalogueDetailIns
   add constraint FK_CATALOGU_REFERENCE_CATALOGU foreign key (IdCatalogue)
      references Catalogue (IdCatalogue)
go

alter table ESBEndPointException
   add constraint FK_ESBENDPO_REFERENCE_ESBEXCEP foreign key (IdESBException)
      references ESBException (IdESBException)
go

alter table ESBEndPointException
   add constraint FK_ESBENDPO_REFERENCE_ESBENDPO foreign key (IdESBEndPoint)
      references ESBEndPoint (IdESBEndPoint)
go

alter table GeographicLocation1
   add constraint FK_GEOGRAPH_REFERENCE_COUNTRY foreign key (IdCountry)
      references Country (IdCountry)
go

alter table GeographicLocation2
   add constraint FK_GEOGRAPH_REFERENCE_GEOGRAPH2 foreign key (IdGeographicLocation1)
      references GeographicLocation1 (IdGeographicLocation1)
go

alter table GeographicLocation3
   add constraint FK_GEOGRAPH_REFERENCE_GEOGRAPH3 foreign key (IdGeographicLocation2)
      references GeographicLocation2 (IdGeographicLocation2)
go

alter table GeographicLocation4
   add constraint FK_GEOGRAPH_REFERENCE_GEOGRAPH4 foreign key (IdGeographicLocation3)
      references GeographicLocation3 (IdGeographicLocation3)
go

alter table InstitutionSystem
   add constraint FK_INSTITUT_REFERENCE_INSTITUT foreign key (IdInstitution)
      references Institution (IdInstitution)
go

alter table Office
   add constraint FK_OFFICE_REFERENCE_INSTITUT foreign key (IdInstitution)
      references Institution (IdInstitution)
go

alter table ParameterInstitution
   add constraint FK_PARAMETE_REFERENCE_PARAMETE foreign key (IdParameter)
      references Parameter (IdParameter)
go
