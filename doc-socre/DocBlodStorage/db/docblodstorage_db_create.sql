/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     05-Nov-19 3:50:34 PM                         */
/*==============================================================*/


Use master

IF  EXISTS (SELECT * FROM sys.databases WHERE name = 'docblodstorage')
BEGIN
DROP DATABASE [docblodstorage]
END


CREATE DATABASE docblodstorage
go
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Box') and o.name = 'FK_BOX_REFERENCE_LOCATION')
alter table Box
   drop constraint FK_BOX_REFERENCE_LOCATION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BoxField') and o.name = 'FK_BOXFIELD_REFERENCE_BOX')
alter table BoxField
   drop constraint FK_BOXFIELD_REFERENCE_BOX
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Document') and o.name = 'FK_DOCUMENT_REFERENCE_FOLDER')
alter table Document
   drop constraint FK_DOCUMENT_REFERENCE_FOLDER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DocumentField') and o.name = 'FK_DOCUMENT_REFERENCE_DOCUMENTFIELD')
alter table DocumentField
   drop constraint FK_DOCUMENT_REFERENCE_DOCUMENTFIELD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DocumentLog') and o.name = 'FK_DOCUMENT_REFERENCE_DOCUMENT')
alter table DocumentLog
   drop constraint FK_DOCUMENT_REFERENCE_DOCUMENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Folder') and o.name = 'FK_FOLDER_REFERENCE_BOX')
alter table Folder
   drop constraint FK_FOLDER_REFERENCE_BOX
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FolderField') and o.name = 'FK_FOLDERFI_REFERENCE_FOLDER')
alter table FolderField
   drop constraint FK_FOLDERFI_REFERENCE_FOLDER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Box')
            and   name  = 'IX_Box'
            and   indid > 0
            and   indid < 255)
   drop index Box.IX_Box
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Box')
            and   type = 'U')
   drop table Box
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BoxField')
            and   name  = 'IX_BoxField'
            and   indid > 0
            and   indid < 255)
   drop index BoxField.IX_BoxField
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BoxField')
            and   type = 'U')
   drop table BoxField
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Document')
            and   name  = 'IX_Document1'
            and   indid > 0
            and   indid < 255)
   drop index Document.IX_Document1
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Document')
            and   name  = 'IX_Document'
            and   indid > 0
            and   indid < 255)
   drop index Document.IX_Document
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Document')
            and   type = 'U')
   drop table Document
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DocumentField')
            and   name  = 'IXDocumentField'
            and   indid > 0
            and   indid < 255)
   drop index DocumentField.IXDocumentField
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DocumentField')
            and   type = 'U')
   drop table DocumentField
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DocumentLog')
            and   type = 'U')
   drop table DocumentLog
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Folder')
            and   name  = 'IX_Folder'
            and   indid > 0
            and   indid < 255)
   drop index Folder.IX_Folder
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Folder')
            and   type = 'U')
   drop table Folder
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FolderField')
            and   name  = 'IX_FolderField'
            and   indid > 0
            and   indid < 255)
   drop index FolderField.IX_FolderField
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FolderField')
            and   type = 'U')
   drop table FolderField
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Location')
            and   name  = 'IX_Location'
            and   indid > 0
            and   indid < 255)
   drop index Location.IX_Location
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Location')
            and   type = 'U')
   drop table Location
go

/*==============================================================*/
/* Table: Box                                                   */
/*==============================================================*/
create table Box (
   IdBox                int                  identity,
   CodeTypeBox          varchar(16)          null,
   Institution          varchar(32)          null,
   Description          varchar(256)         null,
   DateEnd              smalldatetime        null,
   IdLocation           int                  null,
   NumberItems          smallint             null default 0,
   IsActive             bit                  not null default 1,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null,
   constraint PK_BOX primary key (IdBox)
)
go

/*==============================================================*/
/* Index: IX_Box                                                */
/*==============================================================*/
create index IX_Box on Box (
CodeTypeBox ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: BoxField                                              */
/*==============================================================*/
create table BoxField (
   IdBoxField           int                  identity,
   IdBox                int                  null,
   CodeField            varchar(32)          null,
   Institution          varchar(32)          null default '0',
   Value                varchar(256)         null,
   constraint PK_BOXFIELD primary key (IdBoxField)
)
go

/*==============================================================*/
/* Index: IX_BoxField                                           */
/*==============================================================*/
create index IX_BoxField on BoxField (
Value ASC,
CodeField ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: Document                                              */
/*==============================================================*/
create table Document (
   IdDocument           int                  identity,
   CodeDocument         varchar(256)         null,
   CodeTypeDocument     varchar(16)          not null,
   Institution          varchar(32)          not null,
   PathDocument         varchar(256)         null,
   DateEnd              smalldatetime        null,
   PathDocumentOrigen   varchar(256)         null,
   Iscentralized        bit                  not null default 0,
   PathDocumentFinal    varchar(256)         null,
   Data                 varbinary(max)       null,
   IdBox                int                  null default 0,
   IdFolder             int                  null,
   Type                 varchar(16)          null,
   IsCapLote            bit                  null default 0,
   IsVirtual            bit                  null default 0,
   IsActive             bit                  not null default 1,
   UpdateOfficeID       int                  null,
   IsCopy               bit                  null,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   constraint PK_DOCUMENT primary key (IdDocument)
)
go

/*==============================================================*/
/* Index: IX_Document                                           */
/*==============================================================*/
create index IX_Document on Document (
CodeTypeDocument ASC,
Institution ASC
)
go

/*==============================================================*/
/* Index: IX_Document1                                          */
/*==============================================================*/
create index IX_Document1 on Document (
IdBox ASC,
IsCapLote ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: DocumentField                                         */
/*==============================================================*/
create table DocumentField (
   IdDocumentField      int                  identity,
   IdDocument           int                  null,
   CodeField            varchar(64)          null,
   Institution          varchar(32)          null default '0',
   Value                varchar(256)         null,
   constraint PK_DOCUMENTFIELD primary key (IdDocumentField)
)
go

/*==============================================================*/
/* Index: IXDocumentField                                       */
/*==============================================================*/
create index IXDocumentField on DocumentField (
Value ASC,
CodeField ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: DocumentLog                                           */
/*==============================================================*/
create table DocumentLog (
   IdDocumentLog        int                  identity,
   IdDocument           int                  null,
   PathDocument         varchar(256)         null,
   constraint PK_DOCUMENTLOG primary key (IdDocumentLog)
)
go

/*==============================================================*/
/* Table: Folder                                                */
/*==============================================================*/
create table Folder (
   IdFolder             int                  identity,
   CodeTypeFolder       varchar(32)          not null,
   Institution          varchar(32)          not null,
   Description          varchar(256)         null,
   Path                 varchar(256)         null,
   IdBox                int                  null,
   DateEnd              smalldatetime        null,
   IsActive             bit                  not null default 1,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null,
   constraint PK_FOLDER primary key (IdFolder)
)
go

/*==============================================================*/
/* Index: IX_Folder                                             */
/*==============================================================*/
create index IX_Folder on Folder (
CodeTypeFolder ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: FolderField                                           */
/*==============================================================*/
create table FolderField (
   IdFolderField        int                  identity,
   IdFolder             int                  null,
   CodeField            varchar(16)          null,
   Institution          varchar(32)          null default '0',
   Value                varchar(256)         null,
   constraint PK_FOLDERFIELD primary key (IdFolderField)
)
go

/*==============================================================*/
/* Index: IX_FolderField                                        */
/*==============================================================*/
create index IX_FolderField on FolderField (
Value ASC,
CodeField ASC,
Institution ASC
)
go

/*==============================================================*/
/* Table: Location                                              */
/*==============================================================*/
create table Location (
   IdLocation           int                  identity,
   Code                 varchar(16)          null,
   Institution          varchar(32)          null,
   Description          varchar(256)         null,
   Type                 varchar(16)          null,
   Hijo                 int                  null default 0,
   Padre                int                  null default 0,
   IsLastNode           bit                  null default 0,
   IsActive             bit                  not null default 1,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null,
   constraint PK_LOCATION primary key (IdLocation)
)
go

/*==============================================================*/
/* Index: IX_Location                                           */
/*==============================================================*/
create index IX_Location on Location (
Code ASC,
Institution ASC
)
go

alter table Box
   add constraint FK_BOX_REFERENCE_LOCATION foreign key (IdLocation)
      references Location (IdLocation)
go

alter table BoxField
   add constraint FK_BOXFIELD_REFERENCE_BOX foreign key (IdBox)
      references Box (IdBox)
go

alter table Document
   add constraint FK_DOCUMENT_REFERENCE_FOLDER foreign key (IdFolder)
      references Folder (IdFolder)
go

alter table DocumentField
   add constraint FK_DOCUMENT_REFERENCE_DOCUMENTFIELD foreign key (IdDocument)
      references Document (IdDocument)
go

alter table DocumentLog
   add constraint FK_DOCUMENT_REFERENCE_DOCUMENT foreign key (IdDocument)
      references Document (IdDocument)
go

alter table Folder
   add constraint FK_FOLDER_REFERENCE_BOX foreign key (IdBox)
      references Box (IdBox)
go

alter table FolderField
   add constraint FK_FOLDERFI_REFERENCE_FOLDER foreign key (IdFolder)
      references Folder (IdFolder)
go
