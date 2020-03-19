if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TypeBoxField') and o.name = 'FK_TYPEBOXF_REFERENCE_TYPEBOX')
alter table TypeBoxField
   drop constraint FK_TYPEBOXF_REFERENCE_TYPEBOX
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TypeBox')
            and   name  = 'IX_TypeBox'
            and   indid > 0
            and   indid < 255)
   drop index TypeBox.IX_TypeBox
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

if exists (select 1
            from  sysobjects
           where  id = object_id('TypeBoxField')
            and   type = 'U')
   drop table TypeBoxField
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
   UpdateOfficeID       int                  null,
   constraint PK_TYPEBOX primary key (IdTypeBox)
)
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
   CodeField            varchar(64)          not null,
   constraint PK_TYPEBOXFIELD primary key (IdTypeBoxField)
)
go

/*==============================================================*/
/* Index: IX_TypeBoxField                                       */
/*==============================================================*/
create unique index IX_TypeBoxField on TypeBoxField (
IdTypeBox ASC,
CodeField ASC
)
go

alter table TypeBoxField
   add constraint FK_TYPEBOXF_REFERENCE_TYPEBOX foreign key (IdTypeBox)
      references TypeBox (IdTypeBox)
go
