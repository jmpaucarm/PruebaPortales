USE [SECURITY_SC]


--delete from SECURITY_SC..[UserSupervision]
--delete from SECURITY_SC..[InstitutionProfile]
--delete from SECURITY_SC..[UserProfile]
--delete from SECURITY_SC..ProfileOption
--delete from SECURITY_SC..[Profile]
--delete from SECURITY_SC..[Option]
--delete from SECURITY_SC..Menu
--delete from SECURITY_SC..Supervision
--delete from SECURITY_SC..[User]
--delete from SECURITY_SC..[Component]

----SI ES QUE SE CORRE VARIAS VECES EL MISMO SCRIPT HAY QUE EJECUTAR LAS SIGUIENTES LINEAS DE ENCERAR LOS CONTADORES
--DBCC CHECKIDENT (Profile, RESEED, 0)
--DBCC CHECKIDENT (InstitutionProfile, RESEED, 0)
--DBCC CHECKIDENT (Menu, RESEED, 0)
--DBCC CHECKIDENT ([Option], RESEED, 0)
--DBCC CHECKIDENT (ProfileOption, RESEED, 0)
--DBCC CHECKIDENT (Supervision, RESEED, 0)
--DBCC CHECKIDENT ([User], RESEED, 0)
--DBCC CHECKIDENT (UserProfile, RESEED, 0)
----DBCC CHECKIDENT (UserSupervision, RESEED, 0)
--DBCC CHECKIDENT ([Component], RESEED, 0)



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------SCRIPTS LLENADO DE BASE----------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------
------------------------------Profile------------------------------------
-------------------------------------------------------------------------
INSERT INTO Profile (IdInstitution, ProfileCode, Name, Channel, DateValidity, IsGeneral, IsActive ) VALUES(2,'PROGEN','PERFIL GENERAL','SISTEMA','2019-06-05 00:00:00.000', 0,1)


------------------------------------------------------------------------------
------------------------------InstitutionProfile------------------------------
------------------------------------------------------------------------------
INSERT INTO InstitutionProfile (IdProfile,IdInstitution)  VALUES ((select IdProfile from profile where profilecode = 'PROGEN'),2)

------------------------------------------------------------------------------
------------------------------------Menu--------------------------------------
------------------------------------------------------------------------------

INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (NULL,'',GETDATE(),'SEGURIDAD','Seguridad','view-dashboard',1,1,'MODULE','SGS','')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (1,'',GETDATE(),'USUARIOS','Usuarios','widgets',1,2,'SCREEN','SGS','/app/security/user')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (1,'',GETDATE(),'PERFILES','Perfiles','widgets',1,3,'SCREEN','SGS','/app/security/profile')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (1,'',GETDATE(),'REPORTE','Reporte','widgets',1,4,'SCREEN','SGS','/app/security/report')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (1,'',GETDATE(),'MENU','Menú','widgets',1,5,'SCREEN','SGS','/app/security/menu')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (NULL,'',GETDATE(),'CONFIGURACION','Configuración','view-dashboard',1,2,'MODULE','CFG','')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (6,'',GETDATE(),'CATALOGOS','Catálogos','widgets',1,1,'SCREEN','CFG','/app/configuration/catalog')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (6,'',GETDATE(),'PARAMETROS','Parámetros','widgets',1,2,'SCREEN','CFG','/app/configuration/parameter')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (6,'',GETDATE(),'DIASFERIADOS','Días feriados','widgets',1,3,'SCREEN','CFG','/app/configuration/holiday')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (6,'',GETDATE(),'INSTITUCION','Institucion','widgets',1,4,'SCREEN','CFG','/app/configuration/institution')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (6,'',GETDATE(),'UBICACIONGEOGRAFICA','Ubicación Geográfica','view-web',1,5,'SUBMODULE','CFG','')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (11,'',GETDATE(),'UBICACIONUNO','Ubicación I','widgets',1,1,'SCREEN','CFG','/app/configuration/geolocation1')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (11,'',GETDATE(),'UBICACIONDOS','Ubicación II','widgets',1,2,'SCREEN','CFG','/app/configuration/geolocation2')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (11,'',GETDATE(),'UBICACIONTRES','Ubicación III','widgets',1,3,'SCREEN','CFG','/app/configuration/geolocation3')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (11,'',GETDATE(),'UBICACIONCUATRO','Ubicación VI','widgets',1,4,'SCREEN','CFG','/app/configuration/geolocation4')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (NULL,'',GETDATE(),'WORKFLOW','Workflow','view-dashboard',1,3,'MODULE','WKF','')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (16,'',GETDATE(),'BUZON','Buzón','widgets',1,1,'SCREEN','WKF','/app/workflow/tasklist')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (16,'',GETDATE(),'INICIARPROCESO','Iniciar Proceso','widgets',1,2,'SCREEN','WKF','/app/workflow/start-process-list')
INSERT INTO Menu (IdMenuOrigin, Channel, DateSince, Name, Description, Icon, IsActive, [Order], Level, Module, RouteLink) VALUES (16,'',GETDATE(),'CARGARPROCESO','Cargar Proceso','widgets',1,3,'SCREEN','WKF','/app/workflow/upload-bpmn')

------------------------------------------------------------------------------
------------------------------------Option--------------------------------------
------------------------------------------------------------------------------

INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(2,'VIEW','user','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(3,'VIEW','profile','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(4,'VIEW','report','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(5,'VIEW','menu','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(7,'VIEW','catalog','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(8,'VIEW','parameter','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(9,'VIEW','holiday','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(10,'VIEW','institution','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(12,'VIEW','geographic-location-1','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(13,'VIEW','geographic-location-2','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(14,'VIEW','geographic-location-3','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(15,'VIEW','geographic-location-4','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(17,'VIEW','tasklist','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(18,'VIEW','start-process-list','','','',1)
INSERT INTO [Option] (IdMenu, [Type], [View], Url, DashBoard, Report, IsAdministrative) VALUES(19,'VIEW','upload-bpmn','','','',1)


--------------------------------------------------------------------------------------
------------------------------------ProfileOption--------------------------------------
---------------------------------------------------------------------------------------

INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(1,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(2,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(3,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(4,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(5,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(6,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(7,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(8,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(9,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(10,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(11,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(12,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(13,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(14,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)
INSERT INTO ProfileOption (IdOption, IdProfile, IsFavorite, IsActive) VALUES(15,(select IdProfile from profile where profilecode = 'PROGEN'),1,1)


--------------------------------------------------------------------------------------
------------------------------------Supervision--------------------------------------
---------------------------------------------------------------------------------------

--INSERT INTO Supervision (SupervisionCode, Name, Description, IsObservation, IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID ) VALUES ('SUPER1','SUPERVISOR I','SUPERVISOR I', 0,1,null,null,null,null,null,null)




---------------------------------------------------------------------------------------
------------------------------------User-----------------------------------------------
---------------------------------------------------------------------------------------
INSERT INTO [User] (IdInstitution,UserCode,IdentificationType,Dni,FirstName,SecondName,LastName1,LastName2,CellPhone,Email,DateFrom,DateUntil,CtlgState,IsActive,InactivityType,DateStartInactivity,DateEndInactivity,Password,PasswordDateMax,Observation,DateLastAccess,PcName,NumberAccessError,UserHomologation,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) values (2,'GLOBALRED','DNI','1711950111','Juan','Carlos','Pérez','Proaño','0999999999','jperez@portalesit.net','2019-06-05 00:00:00.000','2020-06-05 00:00:00.000','DESC',1,1,'2020-06-05 00:00:00.000','2020-06-05 00:00:00.000','$7$C6..../....5p5dBttREY1Yop5p2YHp24zTJ6vlS9QtJ4qWVO5LSh6$uROmJFeoCQ2HFkGYsPR/.YYiCmB7nesvQqCi24dpFM6','2020-06-05 00:00:00.000',null,'2018-06-05 00:00:00.000',null,0,null,null,null,null,null,null,null)



---------------------------------------------------------------------------------------
------------------------------------UserProfile-----------------------------------------
---------------------------------------------------------------------------------------

INSERT INTO UserProfile (IdProfile, IdUser, IdOffice, DateFrom, DateUntil,IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID) VALUES((select idprofile from profile where  profilecode = 'PROGEN'),(select IdUser from [user] where usercode = 'GLOBALRED'),1,'2019-06-05 00:00:00.000', '2020-06-05 00:00:00.000',1,null,null,null,null,null,null)



---------------------------------------------------------------------------------------
------------------------------------UserSupervision-------------------------------------
---------------------------------------------------------------------------------------

--INSERT INTO UserSupervision (IdUserSupervision,IdSupervision, IdUser, IsActive,CreationDate,CreationUserID,CreationOfficeID,UpdateDate,UpdateUserID,UpdateOfficeID)  VALUES (1,1,1,1,null,null,null,null,null,null)
