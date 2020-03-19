
Use master

IF  EXISTS (SELECT * FROM sys.databases WHERE name = 'SECURITY_SC')
BEGIN
DROP DATABASE [SECURITY_SC]
END


CREATE DATABASE SECURITY_SC
go
USE SECURITY_SC


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Component') and o.name = 'FK_COMPONEN_REFERENCE_OPTION')
alter table Component
   drop constraint FK_COMPONEN_REFERENCE_OPTION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('InstitutionProfile') and o.name = 'FK_INSTITUT_REFERENCE_PROFILE')
alter table InstitutionProfile
   drop constraint FK_INSTITUT_REFERENCE_PROFILE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"Option"') and o.name = 'FK_OPTION_REFERENCE_MENU')
alter table "Option"
   drop constraint FK_OPTION_REFERENCE_MENU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ProfileComponent') and o.name = 'FK_PROFILEC_REFERENCE_PROFILE')
alter table ProfileComponent
   drop constraint FK_PROFILEC_REFERENCE_PROFILE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ProfileComponent') and o.name = 'FK_PROFILEC_REFERENCE_COMPONEN')
alter table ProfileComponent
   drop constraint FK_PROFILEC_REFERENCE_COMPONEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ProfileOption') and o.name = 'FK_PROFILEO_REFERENCE_OPTION')
alter table ProfileOption
   drop constraint FK_PROFILEO_REFERENCE_OPTION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ProfileOption') and o.name = 'FK_PROFILEO_REFERENCE_PROFILE')
alter table ProfileOption
   drop constraint FK_PROFILEO_REFERENCE_PROFILE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UserProfile') and o.name = 'FK_USERPROF_REFERENCE_PROFILE')
alter table UserProfile
   drop constraint FK_USERPROF_REFERENCE_PROFILE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UserSupervision') and o.name = 'FK_USERSUPE_REFERENCE_SUPERVIS')
alter table UserSupervision
   drop constraint FK_USERSUPE_REFERENCE_SUPERVIS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Component')
            and   name  = 'IndUniq'
            and   indid > 0
            and   indid < 255)
   drop index Component.IndUniq
go

alter table Component
   drop constraint PK_COMPONENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Component')
            and   type = 'U')
   drop table Component
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('InstitutionProfile')
            and   name  = 'IX_InstitutionProfile'
            and   indid > 0
            and   indid < 255)
   drop index InstitutionProfile.IX_InstitutionProfile
go

alter table InstitutionProfile
   drop constraint PK_INSTITUTIONPROFILE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('InstitutionProfile')
            and   type = 'U')
   drop table InstitutionProfile
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LogPassword')
            and   name  = 'IX_UserPassword'
            and   indid > 0
            and   indid < 255)
   drop index LogPassword.IX_UserPassword
go

alter table LogPassword
   drop constraint PK_USERPASSWORD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LogPassword')
            and   type = 'U')
   drop table LogPassword
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LogSecurity')
            and   name  = 'IX_LogSecurity'
            and   indid > 0
            and   indid < 255)
   drop index LogSecurity.IX_LogSecurity
go

alter table LogSecurity
   drop constraint PK_LOGSECURITY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LogSecurity')
            and   type = 'U')
   drop table LogSecurity
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LogSupervision')
            and   name  = 'IX_LogSupervision'
            and   indid > 0
            and   indid < 255)
   drop index LogSupervision.IX_LogSupervision
go

alter table LogSupervision
   drop constraint PK_LOGSUPERVISION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LogSupervision')
            and   type = 'U')
   drop table LogSupervision
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Menu')
            and   name  = 'IX_Menu'
            and   indid > 0
            and   indid < 255)
   drop index Menu.IX_Menu
go

alter table Menu
   drop constraint PK_MENU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Menu')
            and   type = 'U')
   drop table Menu
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"Option"')
            and   name  = 'IX_Option'
            and   indid > 0
            and   indid < 255)
   drop index "Option".IX_Option
go

alter table "Option"
   drop constraint PK_OPTION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"Option"')
            and   type = 'U')
   drop table "Option"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Profile')
            and   name  = 'IX_Profile'
            and   indid > 0
            and   indid < 255)
   drop index Profile.IX_Profile
go

alter table Profile
   drop constraint PK_PROFILE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Profile')
            and   type = 'U')
   drop table Profile
go

alter table ProfileComponent
   drop constraint PK_PROFILECOMPONENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ProfileComponent')
            and   type = 'U')
   drop table ProfileComponent
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ProfileOption')
            and   name  = 'IX_ProfileOption'
            and   indid > 0
            and   indid < 255)
   drop index ProfileOption.IX_ProfileOption
go

alter table ProfileOption
   drop constraint PK_PROFILEOPTION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ProfileOption')
            and   type = 'U')
   drop table ProfileOption
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Supervision')
            and   name  = 'IX_Supervision'
            and   indid > 0
            and   indid < 255)
   drop index Supervision.IX_Supervision
go

alter table Supervision
   drop constraint PK_SUPERVISION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Supervision')
            and   type = 'U')
   drop table Supervision
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"User"')
            and   name  = 'IX_User'
            and   indid > 0
            and   indid < 255)
   drop index "User".IX_User
go

alter table "User"
   drop constraint PK_USER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"User"')
            and   type = 'U')
   drop table "User"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UserProfile')
            and   name  = 'IX_UserProfile'
            and   indid > 0
            and   indid < 255)
   drop index UserProfile.IX_UserProfile
go

alter table UserProfile
   drop constraint PK_USERPROFILE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UserProfile')
            and   type = 'U')
   drop table UserProfile
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UserSupervision')
            and   name  = 'IX_UserSupervision'
            and   indid > 0
            and   indid < 255)
   drop index UserSupervision.IX_UserSupervision
go

alter table UserSupervision
   drop constraint PK_USERSUPERVISION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UserSupervision')
            and   type = 'U')
   drop table UserSupervision
go

/*==============================================================*/
/* Table: Component                                             */
/*==============================================================*/
create table Component (
   IdComponent          int                  identity,
   IdOption             int                  null,
   Description          varchar(64)          null,
   Disabled             bit                  not null,
   Hidden               bit                  not null,
   ComponentName        varchar(64)          not null
)
go

alter table Component
   add constraint PK_COMPONENT primary key (IdComponent)
go

/*==============================================================*/
/* Index: IndUniq                                               */
/*==============================================================*/
create unique index IndUniq on Component (
IdOption ASC,
ComponentName ASC
)
go

/*==============================================================*/
/* Table: InstitutionProfile                                    */
/*==============================================================*/
create table InstitutionProfile (
   IdInstitutionProfile int                  identity(1, 1),
   IdProfile            int                  null,
   IdInstitution        int                  null
)
on "PRIMARY"
go

alter table InstitutionProfile
   add constraint PK_INSTITUTIONPROFILE primary key (IdInstitutionProfile)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_InstitutionProfile                                 */
/*==============================================================*/
create index IX_InstitutionProfile on InstitutionProfile (
IdInstitution ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: LogPassword                                           */
/*==============================================================*/
create table LogPassword (
   IdUserPassword       int                  identity(1, 1),
   IdUser               int                  null,
   Password             varchar(128)         collate Modern_Spanish_CI_AS not null,
   CreationDate         datetime             null,
   CreationUserID       int                  null constraint DF__UserPassw__Creat__4F7CD00D default (0),
   CreationOfficeID     int                  null constraint DF__UserPassw__Creat__5070F446 default (0),
   UpdateDate           datetime             null,
   UpdateUserID         int                  null constraint DF__UserPassw__Updat__5165187F default (0),
   UpdateOfficeID       int                  null constraint DF__UserPassw__Updat__52593CB8 default (0)
)
on "PRIMARY"
go

alter table LogPassword
   add constraint PK_USERPASSWORD primary key (IdUserPassword)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_UserPassword                                       */
/*==============================================================*/
create index IX_UserPassword on LogPassword (
IdUser ASC
)
go

/*==============================================================*/
/* Table: LogSecurity                                           */
/*==============================================================*/
create table LogSecurity (
   IdLogSecurity        int                  identity(1, 1),
   Event                varchar(16)          collate Modern_Spanish_CI_AS null,
   DateRegistry         datetime             null,
   IdOffice             int                  null,
   Machine              varchar(64)          collate Modern_Spanish_CI_AS null,
   IdUser               int                  null,
   UserCode             varchar(32)          collate Modern_Spanish_CI_AS null,
   Attempts             int                  null,
   IdProfile            int                  null,
   Observation          varchar(128)         collate Modern_Spanish_CI_AS null,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null
)
on "PRIMARY"
go

alter table LogSecurity
   add constraint PK_LOGSECURITY primary key (IdLogSecurity)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_LogSecurity                                        */
/*==============================================================*/
create index IX_LogSecurity on LogSecurity (
UserCode ASC
)
go

/*==============================================================*/
/* Table: LogSupervision                                        */
/*==============================================================*/
create table LogSupervision (
   IdLogSupervision     int                  not null,
   IdSupervision        int                  not null,
   IdUser               int                  not null,
   "Transaction"        varchar(32)          collate Modern_Spanish_CI_AS null,
   Action               varchar(64)          collate Modern_Spanish_CI_AS null,
   Date                 datetime             null,
   IdOffice             int                  null,
   Observation          varchar(128)         collate Modern_Spanish_CI_AS null
)
on "PRIMARY"
go

alter table LogSupervision
   add constraint PK_LOGSUPERVISION primary key (IdLogSupervision)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_LogSupervision                                     */
/*==============================================================*/
create index IX_LogSupervision on LogSupervision (
IdUser ASC
)
go

/*==============================================================*/
/* Table: Menu                                                  */
/*==============================================================*/
create table Menu (
   IdMenu               int                  identity(1, 1),
   IdMenuOrigin         int                  null,
   Channel              varchar(32)          collate Modern_Spanish_CI_AS null,
   DateSince            datetime             null,
   Name                 varchar(64)          collate Modern_Spanish_CI_AS not null,
   Description          varchar(128)         collate Modern_Spanish_CI_AS not null,
   Icon                 varchar(32)          collate Modern_Spanish_CI_AS null,
   IsActive             bit                  not null,
   "Order"              int                  not null,
   Level                varchar(32)          collate Modern_Spanish_CI_AS not null,
   Module               varchar(16)          collate Modern_Spanish_CI_AS not null,
   RouteLink            varchar(32)          collate Modern_Spanish_CI_AS not null,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
on "PRIMARY"
go

alter table Menu
   add constraint PK_MENU primary key (IdMenu)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_Menu                                               */
/*==============================================================*/
create index IX_Menu on Menu (
Channel ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: "Option"                                              */
/*==============================================================*/
create table "Option" (
   IdOption             int                  identity(1, 1),
   IdMenu               int                  null,
   Type                 varchar(32)          collate Modern_Spanish_CI_AS not null,
   "View"               varchar(64)          collate Modern_Spanish_CI_AS not null,
   Url                  varchar(128)         collate Modern_Spanish_CI_AS not null,
   DashBoard            varchar(256)         collate Modern_Spanish_CI_AS null,
   Report               varchar(256)         collate Modern_Spanish_CI_AS null,
   IsAdministrative     bit                  not null constraint DF__Option__IsAdmini__2B3F6F97 default (0),
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
on "PRIMARY"
go

alter table "Option"
   add constraint PK_OPTION primary key (IdOption)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_Option                                             */
/*==============================================================*/
create index IX_Option on "Option" (
IdMenu ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Profile                                               */
/*==============================================================*/
create table Profile (
   IdProfile            int                  identity(1, 1),
   IdInstitution        int                  not null,
   ProfileCode          varchar(32)          collate Modern_Spanish_CI_AS not null,
   Name                 varchar(128)         collate Modern_Spanish_CI_AS not null,
   Channel              varchar(16)          collate Modern_Spanish_CI_AS not null,
   DateValidity         datetime             null,
   IsGeneral            bit                  not null constraint DF__Profile__IsGener__2F10007B default (0),
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

alter table Profile
   add constraint PK_PROFILE primary key (IdProfile)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_Profile                                            */
/*==============================================================*/
create unique index IX_Profile on Profile (
ProfileCode ASC,
IdInstitution ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: ProfileComponent                                      */
/*==============================================================*/
create table ProfileComponent (
   IdProfileComponent   int                  identity,
   IdProfile            int                  not null,
   IdComponent          int                  not null
)
go

alter table ProfileComponent
   add constraint PK_PROFILECOMPONENT primary key (IdProfileComponent)
go

/*==============================================================*/
/* Table: ProfileOption                                         */
/*==============================================================*/
create table ProfileOption (
   IdProfileOption      int                  identity(1, 1),
   IdOption             int                  not null,
   IdProfile            int                  not null,
   IsFavorite           bit                  not null,
   IsActive             bit                  not null
)
on "PRIMARY"
go

alter table ProfileOption
   add constraint PK_PROFILEOPTION primary key (IdProfileOption)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_ProfileOption                                      */
/*==============================================================*/
create unique index IX_ProfileOption on ProfileOption (
IdOption ASC,
IdProfile ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: Supervision                                           */
/*==============================================================*/
create table Supervision (
   IdSupervision        int                  identity(1, 1),
   SupervisionCode      varchar(32)          collate Modern_Spanish_CI_AS not null,
   Name                 varchar(64)          collate Modern_Spanish_CI_AS not null,
   Description          varchar(128)         collate Modern_Spanish_CI_AS null,
   IsObservation        bit                  not null,
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

alter table Supervision
   add constraint PK_SUPERVISION primary key (IdSupervision)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_Supervision                                        */
/*==============================================================*/
create unique index IX_Supervision on Supervision (
SupervisionCode ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" (
   IdUser               int                  identity(1, 1),
   IdInstitution        int                  not null,
   UserCode             varchar(32)          collate Modern_Spanish_CI_AS not null,
   IdentificationType   varchar(16)          collate Modern_Spanish_CI_AS not null,
   Dni                  varchar(16)          collate Modern_Spanish_CI_AS not null,
   FirstName            varchar(32)          collate Modern_Spanish_CI_AS not null,
   SecondName           varchar(32)          collate Modern_Spanish_CI_AS null,
   LastName1            varchar(32)          collate Modern_Spanish_CI_AS not null,
   LastName2            varchar(32)          collate Modern_Spanish_CI_AS null,
   CellPhone            varchar(16)          collate Modern_Spanish_CI_AS not null,
   Email                varchar(256)         collate Modern_Spanish_CI_AS null,
   DateFrom             datetime             null,
   DateUntil            datetime             null,
   CtlgState            varchar(16)          collate Modern_Spanish_CI_AS not null,
   IsActive             bit                  null constraint DF__User__IsActive__48CFD27E default (1),
   InactivityType       varchar(16)          null,
   DateStartInactivity  smalldatetime        null,
   DateEndInactivity    smalldatetime        null,
   Password             varchar(128)         collate Modern_Spanish_CI_AS not null,
   PasswordDateMax      smalldatetime        null,
   Observation          varchar(256)         collate Modern_Spanish_CI_AS null,
   DateLastAccess       datetime             null,
   PcName               varchar(64)          collate Modern_Spanish_CI_AS null,
   NumberAccessError    smallint             not null constraint DF__User__NumberAcce__49C3F6B7 default (0),
   UserHomologation     varchar(32)          collate Modern_Spanish_CI_AS null,
   CreationDate         datetime             null,
   CreationUserID       int                  null,
   CreationOfficeID     int                  null,
   UpdateDate           datetime             null,
   UpdateUserID         int                  null,
   UpdateOfficeID       int                  null
)
on "PRIMARY"
go

alter table "User"
   add constraint PK_USER primary key (IdUser)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_User                                               */
/*==============================================================*/
create unique index IX_User on "User" (
UserCode ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: UserProfile                                           */
/*==============================================================*/
create table UserProfile (
   IdUserProfile        int                  identity(1, 1),
   IdProfile            int                  null,
   IdUser               int                  null,
   IdOffice             int                  not null,
   DateFrom             datetime             null,
   DateUntil            datetime             null,
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

alter table UserProfile
   add constraint PK_USERPROFILE primary key (IdUserProfile)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_UserProfile                                        */
/*==============================================================*/
create index IX_UserProfile on UserProfile (
IdUser ASC,
IdProfile ASC
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: UserSupervision                                       */
/*==============================================================*/
create table UserSupervision (
   IdUserSupervision    int                  not null,
   IdSupervision        int                  not null,
   IdUser               int                  not null,
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

alter table UserSupervision
   add constraint PK_USERSUPERVISION primary key (IdUserSupervision)
      on "PRIMARY"
go

/*==============================================================*/
/* Index: IX_UserSupervision                                    */
/*==============================================================*/
create unique index IX_UserSupervision on UserSupervision (
IdSupervision ASC,
IdUser ASC
)
on "PRIMARY"
go

alter table Component
   add constraint FK_COMPONEN_REFERENCE_OPTION foreign key (IdOption)
      references "Option" (IdOption)
go

alter table InstitutionProfile
   add constraint FK_INSTITUT_REFERENCE_PROFILE foreign key (IdProfile)
      references Profile (IdProfile)
go

alter table "Option"
   add constraint FK_OPTION_REFERENCE_MENU foreign key (IdMenu)
      references Menu (IdMenu)
go

alter table ProfileComponent
   add constraint FK_PROFILEC_REFERENCE_PROFILE foreign key (IdProfile)
      references Profile (IdProfile)
go

alter table ProfileComponent
   add constraint FK_PROFILEC_REFERENCE_COMPONEN foreign key (IdComponent)
      references Component (IdComponent)
go

alter table ProfileOption
   add constraint FK_PROFILEO_REFERENCE_OPTION foreign key (IdOption)
      references "Option" (IdOption)
go

alter table ProfileOption
   add constraint FK_PROFILEO_REFERENCE_PROFILE foreign key (IdProfile)
      references Profile (IdProfile)
go

alter table UserProfile
   add constraint FK_USERPROF_REFERENCE_PROFILE foreign key (IdProfile)
      references Profile (IdProfile)
go

alter table UserSupervision
   add constraint FK_USERSUPE_REFERENCE_SUPERVIS foreign key (IdSupervision)
      references Supervision (IdSupervision)
go
