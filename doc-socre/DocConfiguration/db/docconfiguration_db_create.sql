/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     05-Nov-19 3:56:18 PM                         */
/*==============================================================*/

Use master

IF  EXISTS (SELECT * FROM sys.databases WHERE name = 'DocConfiguration')
BEGIN
DROP DATABASE [DocConfiguration]
END


CREATE DATABASE DocConfiguration
go
USE DocConfiguration

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Area') and o.name = 'FK_AREA_REFERENCE_TYPEDOCU')
alter table Area
   drop constraint FK_AREA_REFERENCE_TYPEDOCU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AreaOcr') and o.name = 'FK_AREAOCR_REFERENCE_TYPEDOCU')
alter table AreaOcr
   drop constraint FK_AREAOCR_REFERENCE_TYPEDOCU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FormVersion') and o.name = 'FK_FORMVERS_REFERENCE_TYPEDOCU')
alter table FormVersion
   drop constraint FK_FORMVERS_REFERENCE_TYPEDOCU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FormVersion') and o.name = 'FK_FORMVERS_REFERENCE_WATERMAR')
alter table FormVersion
   drop constraint FK_FORMVERS_REFERENCE_WATERMAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeBoxField') and o.name = 'FK_TYPEBOXF_REFERENCE_FIELD')
alter table TypeBoxField
   drop constraint FK_TYPEBOXF_REFERENCE_FIELD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeBoxField') and o.name = 'FK_TYPEBOXF_REFERENCE_TYPEBOX')
alter table TypeBoxField
   drop constraint FK_TYPEBOXF_REFERENCE_TYPEBOX
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeDctoField') and o.name = 'FK_TYPEDCTO_REFERENCE_TYPEDOCUabc')
alter table TypeDctoField
   drop constraint FK_TYPEDCTO_REFERENCE_TYPEDOCUabc
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeDctoField') and o.name = 'FK_TYPEDCTO_REFERENCE_FIELD')
alter table TypeDctoField
   drop constraint FK_TYPEDCTO_REFERENCE_FIELD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeDctoFolder') and o.name = 'FK_TYPEDCTO_REFERENCE_TYPEFOLD')
alter table TypeDctoFolder
   drop constraint FK_TYPEDCTO_REFERENCE_TYPEFOLD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeDctoFolder') and o.name = 'FK_TYPEDCTO_REFERENCE_TYPEDOCUABCD')
alter table TypeDctoFolder
   drop constraint FK_TYPEDCTO_REFERENCE_TYPEDOCUABCD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeDctoProfile') and o.name = 'FK_TYPEDCTO_REFERENCE_TYPEDOCU')
alter table TypeDctoProfile
   drop constraint FK_TYPEDCTO_REFERENCE_TYPEDOCU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeFolderField') and o.name = 'FK_TYPEFOLD_REFERENCE_FIELD')
alter table TypeFolderField
   drop constraint FK_TYPEFOLD_REFERENCE_FIELD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeFolderField') and o.name = 'FK_TYPEFOLD_REFERENCE_TYPEFOLD')
alter table TypeFolderField
   drop constraint FK_TYPEFOLD_REFERENCE_TYPEFOLD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Area')
            and   name  = 'IX_Area'
            and   indid > 0
            and   indid < 255)
   drop index Area.IX_Area
go

alter table Area
   drop constraint PK_AREA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Area')
            and   type = 'U')
   drop table Area
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AreaOcr')
            and   name  = 'IX_AreaOcr'
            and   indid > 0
            and   indid < 255)
   drop index AreaOcr.IX_AreaOcr
go

alter table AreaOcr
   drop constraint PK_AREAOCR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AreaOcr')
            and   type = 'U')
   drop table AreaOcr
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Field')
            and   name  = 'IX_Field'
            and   indid > 0
            and   indid < 255)
   drop index Field.IX_Field
go

alter table Field
   drop constraint PK_FIELD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Field')
            and   type = 'U')
   drop table Field
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FormVersion')
            and   name  = 'IX_FormVersion'
            and   indid > 0
            and   indid < 255)
   drop index FormVersion.IX_FormVersion
go

alter table FormVersion
   drop constraint PK_FORMVERSION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FormVersion')
            and   type = 'U')
   drop table FormVersion
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeBox')
            and   name  = 'IX_TypeBox'
            and   indid > 0
            and   indid < 255)
   drop index TypeBox.IX_TypeBox
go

alter table TypeBox
   drop constraint PK_TYPEBOX
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeBox')
            and   type = 'U')
   drop table TypeBox
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeBoxField')
            and   name  = 'IX_TypeBoxField'
            and   indid > 0
            and   indid < 255)
   drop index TypeBoxField.IX_TypeBoxField
go

alter table TypeBoxField
   drop constraint PK_TYPEBOXFIELD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeBoxField')
            and   type = 'U')
   drop table TypeBoxField
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeDctoField')
            and   name  = 'IX_TypeDctoField'
            and   indid > 0
            and   indid < 255)
   drop index TypeDctoField.IX_TypeDctoField
go

alter table TypeDctoField
   drop constraint PK_TYPEDCTOFIELD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeDctoField')
            and   type = 'U')
   drop table TypeDctoField
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeDctoFolder')
            and   name  = 'IX_TypeDctoFolder'
            and   indid > 0
            and   indid < 255)
   drop index TypeDctoFolder.IX_TypeDctoFolder
go

alter table TypeDctoFolder
   drop constraint PK_TYPEDCTOFOLDER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeDctoFolder')
            and   type = 'U')
   drop table TypeDctoFolder
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeDctoProfile')
            and   name  = 'IX_TypeDctoProfile'
            and   indid > 0
            and   indid < 255)
   drop index TypeDctoProfile.IX_TypeDctoProfile
go

alter table TypeDctoProfile
   drop constraint PK_TYPEDCTOPROFILE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeDctoProfile')
            and   type = 'U')
   drop table TypeDctoProfile
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeDocument')
            and   name  = 'IX_TypeDocument'
            and   indid > 0
            and   indid < 255)
   drop index TypeDocument.IX_TypeDocument
go

alter table TypeDocument
   drop constraint PK_TYPEDOCUMENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeDocument')
            and   type = 'U')
   drop table TypeDocument
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeFolder')
            and   name  = 'IX_TypeFolder'
            and   indid > 0
            and   indid < 255)
   drop index TypeFolder.IX_TypeFolder
go

alter table TypeFolder
   drop constraint PK_TYPEFOLDER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeFolder')
            and   type = 'U')
   drop table TypeFolder
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeFolderField')
            and   name  = 'IX_TypeFolderField'
            and   indid > 0
            and   indid < 255)
   drop index TypeFolderField.IX_TypeFolderField
go

alter table TypeFolderField
   drop constraint PK_TYPEFOLDERFIELD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeFolderField')
            and   type = 'U')
   drop table TypeFolderField
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeImage')
            and   name  = 'IX_TypeImage'
            and   indid > 0
            and   indid < 255)
   drop index TypeImage.IX_TypeImage
go

alter table TypeImage
   drop constraint PK_TYPEIMAGE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeImage')
            and   type = 'U')
   drop table TypeImage
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WaterMark')
            and   name  = 'IX_WaterMark'
            and   indid > 0
            and   indid < 255)
   drop index WaterMark.IX_WaterMark
go

alter table WaterMark
   drop constraint PK_WATERMARK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WaterMark')
            and   type = 'U')
   drop table WaterMark
go

/*==============================================================*/
/* Table: Area                                                  */
/*==============================================================*/
create table Area (
   IdArea               int                  identity,
   IdTypeDocument       int                  not null,
   Code                 varchar(128)         not null,
   X                    smallint             null constraint DF__AREAS_IMA__AREA___708B2022 default 0,
   Y                    smallint             null constraint DF__AREAS_IMA__AREA___717F445B default 0,
   Tall                 smallint             null constraint DF__AREAS_IMA__AREA___72736894 default 0,
   Wide                 smallint             null constraint DF__AREAS_IMA__AREA___73678CCD default 0,
   IdNewTypeDocument    int                  null default 0,
   IsActive             bit                  null default 1
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IdNewTypeDocument')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Area', 'column', 'IdNewTypeDocument'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Código d enuevo tipo de dcto',
   'user', @CurrentUser, 'table', 'Area', 'column', 'IdNewTypeDocument'
go

alter table Area
   add constraint PK_AREA primary key (IdArea)
go

/*==============================================================*/
/* Index: IX_Area                                               */
/*==============================================================*/
create unique index IX_Area on Area (
Code ASC,
IdTypeDocument ASC
)
go

/*==============================================================*/
/* Table: AreaOcr                                               */
/*==============================================================*/
create table AreaOcr (
   IdAreaOcr            int                  identity,
   IdTypeDocument       int                  not null,
   Code                 varchar(128)         not null constraint DF__AREAS_IMA__AREA___6F96FBE9 default '0',
   X                    smallint             null constraint DF__AREAS_IMA__AREA___708B2022OCR default 0,
   Y                    smallint             null constraint DF__AREAS_IMA__AREA___717F445BOCR default 0,
   Tall                 smallint             null constraint DF__AREAS_IMA__AREA___72736894OCR default 0,
   Wide                 smallint             null constraint DF__AREAS_IMA__AREA___73678CCDOCR default 0,
   IsActive             bit                  null default 1
)
go

alter table AreaOcr
   add constraint PK_AREAOCR primary key (IdAreaOcr)
go

/*==============================================================*/
/* Index: IX_AreaOcr                                            */
/*==============================================================*/
create unique index IX_AreaOcr on AreaOcr (
Code ASC,
IdTypeDocument ASC
)
go

/*==============================================================*/
/* Table: Field                                                 */
/*==============================================================*/
create table Field (
   IdField              int                  identity,
   Code                 varchar(64)          collate Modern_Spanish_CI_AS not null,
   Institution          varchar(32)          not null,
   Description          varchar(256)         null,
   Type                 varchar(16)          null,
   Length               smallint             null constraint DF__CAMPO_REQ__CREQ___0A3F39D6 default 1,
   IsActive             bit                  not null default 1,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Field')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Field', 'column', 'Type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Catalogo TYPEFIELD',
   'user', @CurrentUser, 'table', 'Field', 'column', 'Type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Field')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsActive')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Field', 'column', 'IsActive'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Es Activo',
   'user', @CurrentUser, 'table', 'Field', 'column', 'IsActive'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Field')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Field', 'column', 'CreationDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Creación',
   'user', @CurrentUser, 'table', 'Field', 'column', 'CreationDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Field')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Field', 'column', 'CreationUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Creación',
   'user', @CurrentUser, 'table', 'Field', 'column', 'CreationUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Field')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Field', 'column', 'CreationOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Creación',
   'user', @CurrentUser, 'table', 'Field', 'column', 'CreationOfficeID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Field')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Field', 'column', 'UpdateDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Actualización',
   'user', @CurrentUser, 'table', 'Field', 'column', 'UpdateDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Field')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Field', 'column', 'UpdateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Actualización',
   'user', @CurrentUser, 'table', 'Field', 'column', 'UpdateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Field')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Field', 'column', 'UpdateOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Actualización',
   'user', @CurrentUser, 'table', 'Field', 'column', 'UpdateOfficeID'
go

alter table Field
   add constraint PK_FIELD primary key (IdField)
go

/*==============================================================*/
/* Index: IX_Field                                              */
/*==============================================================*/
create unique index IX_Field on Field (
Code ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: FormVersion                                           */
/*==============================================================*/
create table FormVersion (
   IdFormVersion        int                  identity(1,1),
   IdTypeDocument       int                  null,
   IdWaterMark          int                  null,
   IsWaterMarked        bit                  not null default (0),
   Template             varbinary(max)       not null,
   StartValidityDate    datetime             not null,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null,
   Code                 varchar(64)          null,
   Institution          varchar(32)          null,
   Module               varchar(16)          null,
   CodeSP               varchar(64)          null,
   EndValidityDate      datetime             null,
   IsActive             bit                  null,
   Description          varchar(64)          null
)
ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go

alter table FormVersion
   add constraint PK_FORMVERSION primary key (IdFormVersion)
      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
go

/*==============================================================*/
/* Index: IX_FormVersion                                        */
/*==============================================================*/
create index IX_FormVersion on FormVersion (
IdTypeDocument ASC,
StartValidityDate ASC
)
go

/*==============================================================*/
/* Table: TypeBox                                               */
/*==============================================================*/
create table TypeBox (
   IdTypeBox            int                  identity,
   Code                 varchar(16)          not null,
   Institution          varchar(32)          not null,
   Description          varchar(256)         null,
   Type                 varchar(16)          null,
   IsActive             bit                  not null default 1,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeBox')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'Type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Validar el tipo del campo mediante un catálogo',
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'Type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeBox')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsActive')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'IsActive'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Es Activo',
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'IsActive'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeBox')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'CreationDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Creación',
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'CreationDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeBox')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'CreationUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Creación',
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'CreationUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeBox')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'CreationOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Creación',
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'CreationOfficeID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeBox')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'UpdateDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Actualización',
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'UpdateDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeBox')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'UpdateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Actualización',
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'UpdateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeBox')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'UpdateOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Actualización',
   'user', @CurrentUser, 'table', 'TypeBox', 'column', 'UpdateOfficeID'
go

alter table TypeBox
   add constraint PK_TYPEBOX primary key (IdTypeBox)
go

/*==============================================================*/
/* Index: IX_TypeBox                                            */
/*==============================================================*/
create unique index IX_TypeBox on TypeBox (
Code ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: TypeBoxField                                          */
/*==============================================================*/
create table TypeBoxField (
   IdTypeBoxField       int                  identity,
   IdField              int                  not null,
   IdTypeBox            int                  not null,
   IsActive             bit                  null default 1,
   IsObligatory         bit                  null default 1,
   IsConstant           bit                  null default 0,
   "Order"              smallint             null default 1,
   CodeField            varchar(64)          not null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeBoxField')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsConstant')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeBoxField', 'column', 'IsConstant'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Flag que indica que son palabras obligatorias en el dcto',
   'user', @CurrentUser, 'table', 'TypeBoxField', 'column', 'IsConstant'
go

alter table TypeBoxField
   add constraint PK_TYPEBOXFIELD primary key (IdTypeBoxField)
go

/*==============================================================*/
/* Index: IX_TypeBoxField                                       */
/*==============================================================*/
create unique index IX_TypeBoxField on TypeBoxField (
IdTypeBox ASC,
CodeField ASC
)
go

/*==============================================================*/
/* Table: TypeDctoField                                         */
/*==============================================================*/
create table TypeDctoField (
   IdTypeDctoField      int                  identity,
   IdField              int                  not null,
   IdTypeDocument       int                  not null,
   IsActive             bit                  null default 1,
   IsObligatory         bit                  null default 1,
   IsConstant           bit                  null default 0,
   "Order"              smallint             null default 1,
   CodeField            varchar(64)          not null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDctoField')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsConstant')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDctoField', 'column', 'IsConstant'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Flag que indica que son palabras obligatorias en el dcto',
   'user', @CurrentUser, 'table', 'TypeDctoField', 'column', 'IsConstant'
go

alter table TypeDctoField
   add constraint PK_TYPEDCTOFIELD primary key (IdTypeDctoField)
go

/*==============================================================*/
/* Index: IX_TypeDctoField                                      */
/*==============================================================*/
create unique index IX_TypeDctoField on TypeDctoField (
IdTypeDocument ASC,
CodeField ASC
)
go

/*==============================================================*/
/* Table: TypeDctoFolder                                        */
/*==============================================================*/
create table TypeDctoFolder (
   IdTypeDctoFolder     int                  identity,
   IdTypeFolder         int                  not null,
   IdTypeDocument       int                  not null,
   IndividualSend       bit                  null default 0,
   IsActive             bit                  null default 1,
   "Order"              smallint             null default 1
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDctoFolder')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IndividualSend')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDctoFolder', 'column', 'IndividualSend'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Si este documento de esta carpeta se envia de forma indivudual al archivo fisico',
   'user', @CurrentUser, 'table', 'TypeDctoFolder', 'column', 'IndividualSend'
go

alter table TypeDctoFolder
   add constraint PK_TYPEDCTOFOLDER primary key (IdTypeDctoFolder)
go

/*==============================================================*/
/* Index: IX_TypeDctoFolder                                     */
/*==============================================================*/
create unique index IX_TypeDctoFolder on TypeDctoFolder (
IdTypeFolder ASC,
IdTypeDocument ASC
)
go

/*==============================================================*/
/* Table: TypeDctoProfile                                       */
/*==============================================================*/
create table TypeDctoProfile (
   IdTypeDctoProfile    int                  identity,
   IdTypeDocument       int                  not null,
   IdProfile            int                  null,
   IsVisible            bit                  null default 0,
   IsPrinted            bit                  null default 1,
   IsRePrinted          bit                  null default 1,
   IsActive             bit                  null default 1
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDctoProfile')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsVisible')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDctoProfile', 'column', 'IsVisible'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'para saber si el usuario puede ver ono el dcto',
   'user', @CurrentUser, 'table', 'TypeDctoProfile', 'column', 'IsVisible'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDctoProfile')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsPrinted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDctoProfile', 'column', 'IsPrinted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'para saber si el usuario puede imprimir el dcto',
   'user', @CurrentUser, 'table', 'TypeDctoProfile', 'column', 'IsPrinted'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDctoProfile')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsRePrinted')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDctoProfile', 'column', 'IsRePrinted'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pasa saber si el usurio puede reimprimir el dcto',
   'user', @CurrentUser, 'table', 'TypeDctoProfile', 'column', 'IsRePrinted'
go

alter table TypeDctoProfile
   add constraint PK_TYPEDCTOPROFILE primary key (IdTypeDctoProfile)
go

/*==============================================================*/
/* Index: IX_TypeDctoProfile                                    */
/*==============================================================*/
create unique index IX_TypeDctoProfile on TypeDctoProfile (
IdTypeDocument ASC
)
go

/*==============================================================*/
/* Table: TypeDocument                                          */
/*==============================================================*/
create table TypeDocument (
   IdTypeDocument       int                  identity,
   Code                 varchar(16)          not null,
   Institution          varchar(32)          not null,
   Description          varchar(256)         null,
   Prefijo              varchar(16)          collate Modern_Spanish_CI_AS null,
   IsDigitizable        bit                  null default 1,
   IsCentrilizedOnline  bit                  null default 0,
   IdTypeImage          int                  null default 0,
   Type                 varchar(16)          null,
   Path                 varchar(256)         null,
   BlodStorage          varchar(16)          null,
   Profile              varchar(256)         null,
   TimeLive             smallint             null default 1,
   IsVirtual            bit                  null default 0,
   IsActive             bit                  not null default 1,
   IsForm               bit                  null default 0,
   IsScanLote           bit                  null default 0,
   IdTypeForm           int                  null default 0,
   CreationUserID       int                  null,
   Orientation          varchar(16)          not null default (0),
   ValuedDocument       bit                  not null,
   CopyNumber           smallint             not null default (1),
   Reprintable          bit                  not null default (1),
   CreationDate         datetime             null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Código únio del dcto con institución',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Institution')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Institution'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'BCOANTIGUA',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Institution'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Descripción del dcto',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDigitizable')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsDigitizable'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Si es digitalizable',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsDigitizable'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IdTypeImage')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IdTypeImage'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Si es digitalizable se define que tipo de de imagen es',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IdTypeImage'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Cat TYPEDOC',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Path')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Path'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Rute de destino de la imagen [PROD][DNI]',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Path'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'BlodStorage')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'BlodStorage'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Cat BlodStorage: MINIO, SHAREDPOINT,FILESYSTEM,DB',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'BlodStorage'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Profile')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Profile'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Permisos de lo que puede hacer con la imagen[PERFIL1,PERFIL2]',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'Profile'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TimeLive')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'TimeLive'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Tiempo de vida en meses del dcto',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'TimeLive'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsVirtual')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsVirtual'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Es para por eje tipo firma, en donde no existe un dcto sino que se saca de la misma imagen',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsVirtual'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsActive')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsActive'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Es Activo',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsActive'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsForm')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsForm'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'En el caso que sea un tipo de documento FORM',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsForm'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsScanLote')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsScanLote'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'si es que este dcto se scanea en lote',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'IsScanLote'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'CreationUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Creación',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'CreationUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'CreationDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Creación',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'CreationDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'CreationOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Creación',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'CreationOfficeID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'UpdateDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Actualización',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'UpdateDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'UpdateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Actualización',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'UpdateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeDocument')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'UpdateOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Actualización',
   'user', @CurrentUser, 'table', 'TypeDocument', 'column', 'UpdateOfficeID'
go

alter table TypeDocument
   add constraint PK_TYPEDOCUMENT primary key (IdTypeDocument)
go

/*==============================================================*/
/* Index: IX_TypeDocument                                       */
/*==============================================================*/
create unique index IX_TypeDocument on TypeDocument (
Code ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: TypeFolder                                            */
/*==============================================================*/
create table TypeFolder (
   IdTypeFolder         int                  identity,
   Institution          varchar(32)          not null,
   Code                 varchar(16)          not null,
   Description          varchar(256)         null,
   Type                 varchar(16)          null,
   IsActive             bit                  not null default 1,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeFolder')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'Type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Cat TYPEFOLDER',
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'Type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeFolder')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsActive')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'IsActive'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Es Activo',
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'IsActive'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeFolder')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'CreationDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Creación',
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'CreationDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeFolder')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'CreationUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Creación',
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'CreationUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeFolder')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'CreationOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Creación',
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'CreationOfficeID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeFolder')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'UpdateDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Actualización',
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'UpdateDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeFolder')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'UpdateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Actualización',
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'UpdateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeFolder')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'UpdateOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Actualización',
   'user', @CurrentUser, 'table', 'TypeFolder', 'column', 'UpdateOfficeID'
go

alter table TypeFolder
   add constraint PK_TYPEFOLDER primary key (IdTypeFolder)
go

/*==============================================================*/
/* Index: IX_TypeFolder                                         */
/*==============================================================*/
create unique index IX_TypeFolder on TypeFolder (
Code ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: TypeFolderField                                       */
/*==============================================================*/
create table TypeFolderField (
   IdTypeFolderField    int                  identity,
   IdField              int                  not null,
   IdTypeFolder         int                  not null,
   IsActive             bit                  null default 1,
   IsObligatory         bit                  null default 1,
   IsConstant           bit                  null default 0,
   "Order"              smallint             null default 1,
   CodeField            varchar(64)          not null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeFolderField')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsConstant')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeFolderField', 'column', 'IsConstant'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Flag que indica que son palabras obligatorias en el dcto',
   'user', @CurrentUser, 'table', 'TypeFolderField', 'column', 'IsConstant'
go

alter table TypeFolderField
   add constraint PK_TYPEFOLDERFIELD primary key (IdTypeFolderField)
go

/*==============================================================*/
/* Index: IX_TypeFolderField                                    */
/*==============================================================*/
create unique index IX_TypeFolderField on TypeFolderField (
IdTypeFolder ASC,
CodeField ASC
)
go

/*==============================================================*/
/* Table: TypeImage                                             */
/*==============================================================*/
create table TypeImage (
   IdTypeImage          int                  identity,
   Code                 varchar(32)          not null,
   Institution          varchar(32)          not null,
   Description          varchar(256)         null,
   IsDuplex             bit                  null constraint DF__DEF_IMAGE__DEFI___25E7544B default 0,
   MultiPages           bit                  null default 0,
   VariablesPages       bit                  null default 1,
   NumberPages          smallint             null default 1,
   IsActive             bit                  not null default 1,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsActive')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'IsActive'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Es Activo',
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'IsActive'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'CreationDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Creación',
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'CreationDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'CreationUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Creación',
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'CreationUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'CreationOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Creación',
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'CreationOfficeID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'UpdateDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Actualización',
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'UpdateDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'UpdateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Actualización',
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'UpdateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TypeImage')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'UpdateOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Actualización',
   'user', @CurrentUser, 'table', 'TypeImage', 'column', 'UpdateOfficeID'
go

alter table TypeImage
   add constraint PK_TYPEIMAGE primary key (IdTypeImage)
go

/*==============================================================*/
/* Index: IX_TypeImage                                          */
/*==============================================================*/
create unique index IX_TypeImage on TypeImage (
Code ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: WaterMark                                             */
/*==============================================================*/
create table WaterMark (
   IdWaterMark          int                  identity(1,1),
   Code                 varchar(16)          not null,
   Institution          varchar(32)          not null,
   Description          varchar(256)         null,
   Text                 varchar(64)          null,
   IsImage              bit                  not null,
   Image                varbinary(max)       null,
   IsActive             bit                  not null default 1,
   Location             varchar(16)          null,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WaterMark')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsActive')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'IsActive'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Es Activo',
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'IsActive'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WaterMark')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'CreationDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Creación',
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'CreationDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WaterMark')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'CreationUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Creación',
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'CreationUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WaterMark')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreationOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'CreationOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Creación',
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'CreationOfficeID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WaterMark')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'UpdateDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Fecha de Actualización',
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'UpdateDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WaterMark')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateUserID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'UpdateUserID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Usuario de Actualización',
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'UpdateUserID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WaterMark')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UpdateOfficeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'UpdateOfficeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Oficina de Actualización',
   'user', @CurrentUser, 'table', 'WaterMark', 'column', 'UpdateOfficeID'
go

alter table WaterMark
   add constraint PK_WATERMARK primary key (IdWaterMark)
      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
go

/*==============================================================*/
/* Index: IX_WaterMark                                          */
/*==============================================================*/
create unique index IX_WaterMark on WaterMark (
Code ASC,
Institution ASC
)
go

alter table Area
   add constraint FK_AREA_REFERENCE_TYPEDOCU foreign key (IdTypeDocument)
      references TypeDocument (IdTypeDocument)
go

alter table AreaOcr
   add constraint FK_AREAOCR_REFERENCE_TYPEDOCU foreign key (IdTypeDocument)
      references TypeDocument (IdTypeDocument)
go

alter table FormVersion
   add constraint FK_FORMVERS_REFERENCE_TYPEDOCU foreign key (IdTypeDocument)
      references TypeDocument (IdTypeDocument)
go

alter table FormVersion
   add constraint FK_FORMVERS_REFERENCE_WATERMAR foreign key (IdWaterMark)
      references WaterMark (IdWaterMark)
go

alter table TypeBoxField
   add constraint FK_TYPEBOXF_REFERENCE_FIELD foreign key (IdField)
      references Field (IdField)
go

alter table TypeBoxField
   add constraint FK_TYPEBOXF_REFERENCE_TYPEBOX foreign key (IdTypeBox)
      references TypeBox (IdTypeBox)
go

alter table TypeDctoField
   add constraint FK_TYPEDCTO_REFERENCE_TYPEDOCUabc foreign key (IdTypeDocument)
      references TypeDocument (IdTypeDocument)
go

alter table TypeDctoField
   add constraint FK_TYPEDCTO_REFERENCE_FIELD foreign key (IdField)
      references Field (IdField)
go

alter table TypeDctoFolder
   add constraint FK_TYPEDCTO_REFERENCE_TYPEFOLD foreign key (IdTypeFolder)
      references TypeFolder (IdTypeFolder)
go

alter table TypeDctoFolder
   add constraint FK_TYPEDCTO_REFERENCE_TYPEDOCUABCD foreign key (IdTypeDocument)
      references TypeDocument (IdTypeDocument)
go

alter table TypeDctoProfile
   add constraint FK_TYPEDCTO_REFERENCE_TYPEDOCU foreign key (IdTypeDocument)
      references TypeDocument (IdTypeDocument)
go

alter table TypeFolderField
   add constraint FK_TYPEFOLD_REFERENCE_FIELD foreign key (IdField)
      references Field (IdField)
go

alter table TypeFolderField
   add constraint FK_TYPEFOLD_REFERENCE_TYPEFOLD foreign key (IdTypeFolder)
      references TypeFolder (IdTypeFolder)
go
