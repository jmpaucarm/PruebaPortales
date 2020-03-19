USE SECURITY_SC

INSERT INTO Profile (IdInstitution, ProfileCode, Name, Channel, DateValidity, IsGeneral, IsActive ) VALUES(2,'DOCCON','PERFIL DOC CONFIGURATION','SISTEMA','2019-06-05 00:00:00.000', 0,1)

INSERT INTO InstitutionProfile (IdProfile,IdInstitution)  VALUES (2,2)

INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (NULL,'',GETDATE(),'DOC CONFIGURATION','Configuracion de documentos','view-dashboard',1,1,'MODULE','DCO','')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (20,'',GETDATE(),'DOCUMENTOS','Documentos','widgets',1,1,'SCREEN','DCO','/app/docConfiguration/typeDoc')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (20,'',GETDATE(),'CARPETAS','Carpetas','widgets',1,1,'SCREEN','DCO','/app/docConfiguration/typeFolder')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (20,'',GETDATE(),'CAJAS','Cajas','widgets',1,1,'SCREEN','DCO','/app/docConfiguration/typeBox')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (20,'',GETDATE(),'IMAGENES','Imagenes','widgets',1,1,'SCREEN','DCO','/app/docConfiguration/typeImage')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (20,'',GETDATE(),'CAMPOS','Campos','widgets',1,1,'SCREEN','DCO','/app/docConfiguration/field')


INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(21,'VIEW','typeFolder','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(22,'VIEW','typeBox','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(23,'VIEW','typeImage','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(24,'VIEW','field','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(25,'VIEW','typeDoc','','','',1)

INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(16,2,1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(17,2,1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(18,2,1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(19,2,1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(20,2,1,1)

INSERT INTO [User] (IdInstitution,UserCode,IdentificationType,Dni,FirstName,SecondName,LastName1,LastName2,CellPhone,Email,DateFrom,DateUntil,CtlgState,IsActive,InactivityType,DateStartInactivity,DateEndInactivity,Password,PasswordDateMax,Observation,DateLastAccess,PcName,NumberAccessError,UserHomologation,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values (2,'DOCCONJP','DNI','1718325226','Jhonathan','Paucar','Mauricio','Morales','099-983-3302','jpaucar@portalesit.net','2019-06-05 00:00:00.000','2020-06-05 00:00:00.000','DESC',1,1,'2020-06-05 00:00:00.000','2020-06-05 00:00:00.000','$7$C6..../....5p5dBttREY1Yop5p2YHp24zTJ6vlS9QtJ4qWVO5LSh6$uROmJFeoCQ2HFkGYsPR/.YYiCmB7nesvQqCi24dpFM6','2020-06-05 00:00:00.000',null,'2018-06-05 00:00:00.000',null,0,null,null,null,null,null,null,null)

INSERT INTO UserProfile (IdProfile, IdUser, IdOffice, DateFrom, DateUntil,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) VALUES(2,2,1,'2019-06-05 00:00:00.000', '2020-06-05 00:00:00.000',1,null,null,null,null,null,null)

use  CONFIGURATION_SC

INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('DCO','TypeDoc','Tipo de documentos o archivos',1,0,null,null,null,null,null,null)
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('DCO','PathDoc','Esctructura de como se genera el path de los archivos',1,0,null,null,null,null,null,null)
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('DCO','BlodStorageDoc','Repositorios para guardar documentos',1,0,null,null,null,null,null,null)
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('DCO','TypeBox','Tipo de caja',1,0,null,null,null,null,null,null)
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('DCO','TypeField','Palabras claves',1,0,null,null,null,null,null,null)
INSERT INTO [Catalogue] (Module,Code,Description,IsActive,IsInstitution,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('DCO','TypeFolder','Tipo de carpetas',1,0,null,null,null,null,null,null)

INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeDoc'),'EXCEL','EXCEL',1,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeDoc'),'TXT','TXT',2,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeDoc'),'JPG','JPG',3,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeDoc'),'WORD','WORD',4,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeDoc'),'PDF','PDF',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='PathDoc'),'PRD,DNI','[Producto,Dni]',4,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='PathDoc'),'PDF','[Dni,Producto]',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='BlodStorageDoc'),'SHAREPOINT','Share Point',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='BlodStorageDoc'),'MINIO','Minio',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='BlodStorageDoc'),'FILESYSTEM','File System',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='BlodStorageDoc'),'BDD','Base de datos',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='BlodStorageDoc'),'AZURE','Azure',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeBox'),'CRDCON','Crédito Consumo',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeBox'),'CRDMIC','Microcrédito',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeBox'),'CRDPAG','Pagarés',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeField'),'TEXT','Texto',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeField'),'DATE','Fecha',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeField'),'INT','Entero',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeField'),'DECIMAL','Decimal',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeFolder'),'SOLCRDCON','Sol. de consumo',5,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [CatalogueDetail] (IdCatalogue,Code,[Description],[Order],IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ((select idcatalogue from catalogue where code='TypeFolder'),'SOLCRDMIC','Sol de micro',5,1,NULL,NULL,NULL,NULL,NULL,NULL)

INSERT INTO [Parameter] (System,Code,Description,Type,IntegerValue,DecimalValue,TextValue,DateValue,BooleanValue,IsInstitution,IsEncripted,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('DOC','SHAREPOINT','Servidor de share point','TEXT',0,NULL,'\\\\10.10.0.50\\TestForms\\','','',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [Parameter] (System,Code,Description,Type,IntegerValue,DecimalValue,TextValue,DateValue,BooleanValue,IsInstitution,IsEncripted,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('DOC','MINIO','Servidor de minio','TEXT',0,NULL,'"http:10.10.10.10"','','',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL)
INSERT INTO [Parameter] (System,Code,Description,Type,IntegerValue,DecimalValue,TextValue,DateValue,BooleanValue,IsInstitution,IsEncripted,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('DOC','FILESYSTEM','Servidor File System','TEXT',0,NULL,'C:\\Archivos','','',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL)


use DocConfiguration

INSERT INTO [Field] (Code,Institution,Description,Type,Length,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('CED','2','CEDULA IDENTIDAD','STRING',10,1,null,null,null,null,null,null)
INSERT INTO [Field] (Code,Institution,Description,Type,Length,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('OFICINA','2','OFICINA','STRING',16,1,null,null,null,null,null,null)
INSERT INTO [Field] (Code,Institution,Description,Type,Length,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('CODCRED','2','CODIGO CREDITO','STRING',32,1,null,null,null,null,null,null)
INSERT INTO [Field] (Code,Institution,Description,Type,Length,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values ('FECHA','2','FECHA','DATE',16,1,null,null,null,null,null,null)

INSERT INTO [TypeDocument] (Code,Institution,Description,Prefijo,IsDigitizable,IdTypeImage,Type,Path,BlodStorage,Profile,TimeLive,IsVirtual,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID,ValuedDocument,Orientation) values ('CEDULA','2','CEDULA IDENTIDAD','CED',1,0,'JPG','CED/CODCRED/OFICINA/FECHA','FILESYSTEM',0,12,0,1,null,1,1,null,1,1,1,'Horizontal')


INSERT INTO [TypeDctoField] (IdField,IdTypeDocument,IsActive,IsObligatory,"Order",CodeField) values (1,1,1,1,1,'CED')
INSERT INTO [TypeDctoField] (IdField,IdTypeDocument,IsActive,IsObligatory,"Order",CodeField) values (2,1,1,1,3,'OFICINA')
INSERT INTO [TypeDctoField] (IdField,IdTypeDocument,IsActive,IsObligatory,"Order",CodeField) values (3,1,1,1,2,'CODCRED')
INSERT INTO [TypeDctoField] (IdField,IdTypeDocument,IsActive,IsObligatory,"Order",CodeField) values (4,1,1,1,4,'FECHA')


