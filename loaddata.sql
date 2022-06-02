

-- NAME: Valerian Raphael FOUREL



INSERT INTO father (femail,fname, fdob, framqid, fphonenumber, faddress, fbloodtype,fprofession)
VALUES
('jackson@outlook.com','Jimmy B Goode', '1988-02-03', 'EDF 122332', '5148006020', 
	'Amsterdam Airport', 'AB-', 'business analyst')
,('malik12@lahore.com', 'Malik Saud' , '1930-08-09', 'QWSD 22221', '+243334322',
	'12 Grove Street, Verdun', 'O+','medical doctor')
,('joe@cars.ca','Joe Zinger', '1950-01-01', 'ASSDS 229e','+9821134',
	'Chemin Traverse 3','AB-', 'engineer')
,('maxime@xyz.co','Maxime Laliberte', '1965-07-04','QAS 6754', '514 933 5440',
	'98 Electric Street', 'A+', 'CEO')
,('karl@austria.at','Karl Gross','1970-12-11','QASS 45664','5142340101',
	'Georges Avenue 12','B-','medical doctor')
,('jake@bluesbrothers.com','Jake Blues','1960-12-04',NULL,'2003008888',
	'Wrigley Field','O-','Musician')
,('juan.gutierrez@gmail.com','Juan Gutierrez','1980-12-12','DDDD222','21344423','20 X Street',
	'O+','lawyer')
;

INSERT INTO technician(techid,tname,tphonenumber)
VALUES
(1001,'Johnny Rotten', '670 566 2321')
, (1012, 'Jacques Goad','514 789 9020')
, (2034,'Thaddeus Karl', '123 452 3321')
, (2011,'Jerry Reed','898 800 3000')
,(1021,'Jay Sparrow','780 200 4340')
;

INSERT INTO healthcarefacility(hfphonenumber, hfname,hfemail, typeinstitution, website,hfaddress)
VALUES
('900 210 8000','Faquin Healthcare','faquin@gmail.com','CommClinic','faquinhealth.com','123 Private Drive')
,('780 200 4540', 'Jacques Center','rdv@jacques.ca','BirthCenter','jacques.ca','200 HP Street')
,('500 200 6700','Aq Center', 'rdv@aqcenter.ca','BirthCenter','aqcenter.ca','43 Ella Avenue')
,('120 600 9000','Stu Clinic','sclinic@gmail.com','CommClinic',NULL,'67 Krow Street')
,('123 004 3322','Lac-Saint-Louis','rdv@saintlouis.ca','BirthCenter','saintlouis.ca','80 Max Avenue')
;

INSERT INTO midwife (practionerid, miphonenumber,miemail,miname)
VALUES
(20133, '780 655 9210','marta33@gmail.com','Marta Ville')
,(30445, '900 210 3311','emy1@outlook.com','Emy Joly')
,(34211,'564 212 0000','nabila.is@gmail.com', 'Nabila Ismael')
,(43320,'514 988 2130','sita.bains@saintlouis.ca', 'Sita Bains')
,(50670,'414 700 8000','lex.zinger@gmail.com','Lex Zinger')
, (21888,'900 300 2111','aiko.toyo@gmail.com','Aiko Toyo')
, (25000,'755 321 3000','aline.lemieux@gmail.com','Aline Lemieux')
, (43900, '500 200 4545','marlene.schiappa@aqcenter.ca','Marlene Schiappa')
, (10000,'200 200 2000','marion.girard@gmail.com','Marion Girard')
;

INSERT INTO mother (mramqid, memail,mname,mdob,mphonenumber, maddress,mbloodtype,mprofession)
VALUES
  ('MOMO234333', 'jamilaf@gmail.com','Jamila Beral','1989-02-02','4034568900','Amsterdam Airport','AB+','Researcher')
, ('MAMA90933','murphy@luck.ca','Lucky Jill','1992-04-20','6079845600','12 Father Avenue','A-','Comedian')
, ('QWED21002333','sydney@germany.de','Sydney Dog','1930-01-31','4504503000','20 Kader Road','B-','lab technician')
, ('AORA34005600','grimes@mars.com','Grimes Musk','1990-03-06','7008003000','LA Court','AB-','singer')
, ('IRZQ98760000','marie30dm@gmail.com','Khadija Salah','1999-01-03','5147809000','45 Travis Street',NULL,'Engineer')
, ('SING80004444','carrief@gmail.com','Carrie Fisher','1980-12-05','5149003222','Rue Neige 12','A+','Hairdresser')
,('VICT30002000','victoria@gmail.com','Victoria Gutierrez','1990-03-03','5143002000','22 X Street','O+','lawyer')
;

INSERT INTO worksat(mpid,hfphone,hfname,hfemail)
VALUES
  (20133, '900 210 8000','Faquin Healthcare','faquin@gmail.com')
, (21888, '900 210 8000','Faquin Healthcare','faquin@gmail.com')
, (34211, '123 004 3322','Lac-Saint-Louis','rdv@saintlouis.ca')
, (43320, '123 004 3322','Lac-Saint-Louis','rdv@saintlouis.ca')
, (50670, '120 600 9000','Stu Clinic','sclinic@gmail.com')
, (25000, '120 600 9000','Stu Clinic','sclinic@gmail.com')
, (30445, '500 200 6700','Aq Center','rdv@aqcenter.ca')
, (43900, '500 200 6700','Aq Center','rdv@aqcenter.ca')
, (10000, '120 600 9000','Stu Clinic','sclinic@gmail.com')
;

INSERT INTO onlinesession (midwifeid,adate,ahour,language)
VALUES
  (20133, '2022-02-02','09:00:00','French')
, (30445, '2021-12-30','10:00:00','English')
, (20133, '2021-11-13','15:00:00','English')
, (34211, '2022-01-15','13:00:00','French')
, (50670, '2022-01-19','14:00:00','English')
, (10000, '2019-10-12','09:00:00','French')
, (20133, '2021-04-01','10:00:00','English')
;

INSERT INTO couple (fatherphone, fathername, motherramq,femail, cemail)
VALUES
  ('5148006020','Jimmy B Goode','MOMO234333','jackson@outlook.com','jamilaf@gmail.com')
, ('5148006020','Jimmy B Goode','MAMA90933','jackson@outlook.com','jackson@outlook.com')
, ('514 933 5440','Maxime Laliberte','MAMA90933','maxime@xyz.co','murphy@luck.ca')
, ('+243334322','Malik Saud','IRZQ98760000','malik12@lahore.com','marie@lahore.com')
, ('5142340101','Karl Gross','QWED21002333','karl@austria.at','karl@germany.de')
, ('2003008888','Jake Blues','SING80004444','jake@bluesbrothers.com','jake@bluesbrothers.com')
, ('21344423','Juan Gutierrez','VICT30002000','juan.gutierrez@gmail.com','victoria@gmail.com')
;

INSERT INTO registeredfor (midwifeid,adate,ahour,motherramq,femail,hasattended)
VALUES
  (20133, '2022-02-02','09:00:00','MAMA90933','jackson@outlook.com',TRUE)
, (30445,'2021-12-30','10:00:00','MOMO234333','jackson@outlook.com',TRUE)
, (20133,'2021-04-01','10:00:00','QWED21002333','karl@austria.at',TRUE)
, (10000,'2019-10-12','09:00:00','IRZQ98760000','malik12@lahore.com',TRUE)
, (20133, '2021-11-13','15:00:00','MAMA90933','jackson@outlook.com',FALSE)
, (50670, '2022-01-19','14:00:00','SING80004444','jake@bluesbrothers.com',TRUE)
;

INSERT INTO selects (midwifeid, adate,ahour,motherramq,femail,interested,selected)
VALUES
  (20133,'2022-02-02','09:00:00','MAMA90933','jackson@outlook.com',TRUE,FALSE)
, (30445,'2021-12-30','10:00:00','MOMO234333','jackson@outlook.com',TRUE,TRUE)
, (10000,'2019-10-12','09:00:00','IRZQ98760000','malik12@lahore.com',TRUE,TRUE)
, (50670,'2022-01-19','14:00:00','SING80004444','jake@bluesbrothers.com',TRUE,TRUE)
, (20133, '2021-11-13','15:00:00','MAMA90933','jackson@outlook.com',TRUE,TRUE)
, (20133, '2021-04-01','10:00:00','QWED21002333','karl@austria.at',TRUE,TRUE)
;

INSERT INTO pairedwith (mramqid,hfphonenumber,hfname,hfemail)
VALUES
  ('SING80004444','123 004 3322','Lac-Saint-Louis','rdv@saintlouis.ca')
, ('MOMO234333','123 004 3322','Lac-Saint-Louis','rdv@saintlouis.ca')
, ('IRZQ98760000','900 210 8000','Faquin Healthcare','faquin@gmail.com')
, ('MAMA90933','500 200 6700','Aq Center','rdv@aqcenter.ca')
, ('QWED21002333','120 600 9000','Stu Clinic','sclinic@gmail.com')
, ('VICT30002000','120 600 9000','Stu Clinic','sclinic@gmail.com')
;
INSERT INTO pregnancy (pregnancyid,firstdate,numofbabies)
VALUES
  (300201, '2022-07-01',3)
, (310600, '2022-07-19',1)
, (500333, '2022-07-05',1)
, (700444, '2020-06-30',1)
, (450450, '2021-11-12',2)
, (540663, '2022-06-04',1)
, (200000, '2019-03-01',2)
, (210000, '2021-01-01',2)
, (100000, '2022-07-30',2)
, (100005, '2022-06-15',1)
;


INSERT INTO conceive (pregnancyid,motherramq,femail,numpregnancy)
VALUES
  (310600,'MOMO234333','jackson@outlook.com',1)
, (540663, 'MAMA90933','jackson@outlook.com',2)
, (450450, 'IRZQ98760000','malik12@lahore.com',1)
, (700444, 'QWED21002333','karl@austria.at',3)
, (300201,'SING80004444','jake@bluesbrothers.com',2)
, (200000,'VICT30002000','juan.gutierrez@gmail.com',1)
, (210000,'VICT30002000','juan.gutierrez@gmail.com',2)
, (100000,'VICT30002000','juan.gutierrez@gmail.com',3)
, (100005,'QWED21002333','karl@austria.at',4)
;

INSERT INTO assignedat(pregnancyid,midwife1id,midwife2id)
VALUES
  (300201,34211,43320)
, (310600,34211,NULL)
, (500333,10000,34211)
, (450450,20133,21888)
, (540663,30445,43900)
, (700444,50670,10000)
, (100000,10000,50670)
, (100005,10000,25000)
, (210000,10000,NULL)
;


INSERT INTO appointment (adate,ahour,pregnancyid,midwifeid)
VALUES
  ('2022-03-21','09:00:00',100000,10000)
, ('2022-03-22','10:00:00',100000,10000)
, ('2022-03-25','11:00:00',100005,10000) -- giutierrez 
, ('2022-03-23','09:00:00',100005,10000)
, ('2020-07-01','10:00:00',210000,10000)
, ('2020-06-01','09:00:00',210000,10000)
; 

INSERT INTO appointment (adate,ahour,pregnancyid,midwifeid)
VALUES
  ('2022-01-02','09:00:00',310600,34211) -- ga  // 2022-07-19 2021-12-30
, ('2022-01-17','10:00:00',310600,34211) -- ga
, ('2022-02-02','10:00:00',310600,34211) -- jackson and momo / test / sampling
, ('2022-03-02','11:00:00',310600,34211) -- test blood sampling
, ('2022-04-02','15:00:00',310600,34211) -- expecteddatemeeting
, ('2022-06-30','16:00:00',310600,34211) -- birthsetting
;

INSERT INTO appointment (adate,ahour,pregnancyid,midwifeid)
VALUES
  ('2022-03-20','09:00:00',540663,30445) -- jackson and mama ga //2022-07-04 - 2021-11-10
, ('2022-04-15','10:00:00',540663,43900) -- blood type test sampling
, ('2022-10-16','15:00:00',540663,30445) -- birth setting
, ('2022-05-02','10:00:00',540663,43900) -- sampling test
, ('2022-06-12','11:00:00',540663,30445) -- test physical DR
, ('2022-06-10','12:00:00',540663,30445) -- expected date
, ('2022-06-30','13:00:00',540663,30445) -- ga
;

INSERT INTO appointment (adate,ahour,pregnancyid,midwifeid)
VALUES
  ('2020-02-15','09:00:00',700444,50670) -- karl and qwed ga // 2020-06-30 - 2019-09-30
, ('2020-03-15','10:00:00',700444,10000) -- ga
, ('2020-06-20','09:00:00',700444,50670) -- birth setting
, ('2020-06-10','11:00:00',700444,50670) -- expected date setting
;

INSERT INTO appointment (adate,ahour,pregnancyid,midwifeid)
VALUES
  ('2021-03-18','10:00:00',450450,20133) -- malik and irzq ga //2021-11-12 - 2021-03-01
, ('2021-04-05','09:00:00',450450,21888) -- ga
, ('2021-05-05','10:00:00',450450,20133) -- sampling test blood
, ('2021-06-01','11:00:00',450450,20133) -- birth time setting 
, ('2021-07-10','14:00:00',450450,20133) -- ga
, ('2021-08-10','10:00:00',450450,20133) -- sampling test 2
, ('2021-05-14','11:00:00',450450,21888) -- expected date test
, ('2021-11-01','12:00:00',450450,21888) -- birth setting
;

INSERT INTO appointment (adate,ahour,pregnancyid,midwifeid)
VALUES
  ('2022-02-01','14:00:00',300201,34211) -- jake and SING // 2022-07-09 - 2022-01-19
, ('2022-02-16','11:00:00',300201,43320) -- gA
, ('2022-02-28','09:00:00',300201,43320) -- TEST app
, ('2022-03-09','10:00:00',300201,34211) -- sampling test
, ('2022-03-19','11:00:00',300201,34211) -- sampling test
, ('2022-05-20','12:00:00',300201,43320) -- birth setting
, ('2022-04-02','12:00:00',300201,34211) -- ga
, ('2022-05-15','14:00:00',300201,34211) -- test Dr general
, ('2022-03-10','15:00:00',300201,34211) -- expected meeting test
, ('2022-06-20','09:00:00',300201,34211) -- birht setting
;

INSERT INTO generalappointment (gadate,gahour,gapregnancyid)
VALUES
  ('2022-03-21','09:00:00',100000)
, ('2022-03-22','10:00:00',100000)
, ('2022-03-25','11:00:00',100005)
, ('2022-03-23','09:00:00',100005)
, ('2020-07-01','10:00:00',210000)
, ('2020-06-01','09:00:00',210000)
, ('2022-01-02','09:00:00',310600)
, ('2022-01-17','10:00:00',310600)
, ('2022-03-20','09:00:00',540663)
, ('2022-06-30','13:00:00',540663)
, ('2020-02-15','09:00:00',700444)
, ('2020-03-15','10:00:00',700444)
;

INSERT INTO generalappointment (gadate,gahour,gapregnancyid)
VALUES
  ('2021-03-18','10:00:00',450450)
, ('2021-04-05','09:00:00',450450)
, ('2021-07-10','14:00:00',450450)
, ('2022-02-01','14:00:00',300201)
, ('2022-02-16','11:00:00',300201)
, ('2022-04-02','12:00:00',300201)
;

INSERT INTO testapp (tadate,tahour,tapregnancyid,taname,tadateprescription,tadatetest,tadatelabwork)
VALUES
  ('2022-02-02','10:00:00',310600,'Hormone sample','2022-01-17','2022-02-04','2022-02-04')
, ('2022-03-02','11:00:00',310600,'blood iron','2022-02-02','2022-03-02','2022-03-09')
, ('2020-07-01','10:00:00',210000,'blood iron','2020-07-01','2020-07-02','2020-07-03')
, ('2020-06-01','09:00:00',210000,'blood iron','2020-06-01','2020-06-02','2020-06-03')
, ('2022-04-02','15:00:00',310600,'Expected date','2022-03-02','2022-04-04','2022-04-07')
;

INSERT INTO testapp (tadate,tahour,tapregnancyid,taname,tadateprescription,tadatetest,tadatelabwork)
VALUES
  ('2022-04-15','10:00:00',540663,'blood iron','2022-03-20','2022-04-23','2022-04-27')
, ('2022-05-02','10:00:00',540663,'Hormone sample','2022-04-15','2022-05-04','2022-05-11')
, ('2022-06-12','11:00:00',540663,'Dr test','2022-05-02','2022-06-04','2022-06-08')
, ('2022-06-10','12:00:00',540663,'Expected date','2022-05-02','2022-06-11','2022-06-12')
;

INSERT INTO testapp (tadate,tahour,tapregnancyid,taname,tadateprescription,tadatetest,tadatelabwork)
VALUES
  ('2020-06-10','11:00:00',700444,'Expected date','2020-06-10','2020-06-12','2020-06-13')
, ('2021-05-05','10:00:00',450450,'blood iron','2021-04-05','2021-05-07','2021-05-09')
, ('2021-08-10','10:00:00',450450,'Hormone sample','2021-07-10','2021-08-12','2021-08-14')
, ('2021-05-14','11:00:00',450450,'Expected date','2021-05-05','2021-05-15','2021-05-17')
;

INSERT INTO testapp (tadate,tahour,tapregnancyid,taname,tadateprescription,tadatetest,tadatelabwork)
VALUES
  ('2022-02-28','09:00:00',300201,'Dr test','2022-02-16','2022-03-01','2022-03-03')
, ('2022-03-09','10:00:00',300201,'Hormone sample','2022-02-28','2022-03-11','2022-03-14')
, ('2022-03-19','11:00:00',300201,'blood iron','2022-03-09','2022-03-11','2022-03-12')
, ('2022-05-15','14:00:00',300201,'Dr test','2022-04-02','2022-04-04','2022-04-05')
;

INSERT INTO testapp(tadate,tahour,tapregnancyid,taname,tadateprescription,tadatetest,tadatelabwork)
VALUES
  ('2022-03-10','15:00:00',300201,'Expected date','2022-03-09','2022-03-12','2022-03-15')
;

INSERT INTO notes (nadate,nahour,npregnancyid,ntimestamp,ncontent)
VALUES
  ('2022-03-21','09:00:00',100000,'2022-03-21-09.30.34','Mother healthy')
, ('2022-03-22','10:00:00',100000,'2022-03-22-10.40.22','Father healthy')
, ('2022-03-25','11:00:00',100005,'2022-03-25-11.46.45','Parents happy')
, ('2022-03-23','09:00:00',100005,'2022-03-23-10.01.01','No test needed')
, ('2020-07-01','10:00:00',210000,'2020-07-01-10.40.40','Pregnancy well')
, ('2020-06-01','09:00:00',210000,'2020-06-01-09.50.50','change of address')
, ('2022-01-02','09:00:00',310600,'2022-01-02-09.10.34','Mother and father healthy')
, ('2022-01-17','10:00:00',310600,'2022-01-17-10.32.10','test needed1')
, ('2022-02-02','10:00:00',310600,'2022-02-02-10.45.11','successful sampling')
, ('2022-03-02','11:00:00',310600,'2022-03-02-11.54.22','expected date')
, ('2022-04-02','15:00:00',310600,'2022-04-02-16.01.22','birth preparation')
, ('2022-06-30','16:00:00',310600,'2022-06-30-16.32.20','birth setting')
;

INSERT INTO notes (nadate,nahour,npregnancyid,ntimestamp,ncontent)
VALUES
  ('2022-03-20','09:00:00',540663,'2022-03-20-09.32.11','blood test needed')
, ('2022-04-15','10:00:00',540663,'2022-04-15-10.54.30','sampling went good')
, ('2022-10-16','15:00:00',540663,'2022-10-16-15.45.45','BIRTH setted')
, ('2022-05-02','10:00:00',540663,'2022-05-02-10.21.41','Sampled draw')
, ('2022-06-12','11:00:00',540663,'2022-06-12-11.11.11','dr testing')
, ('2022-06-10','12:00:00',540663,'2022-06-10-13.02.21','date expected')
;

INSERT INTO notes (nadate,nahour,npregnancyid,ntimestamp,ncontent)
VALUES
  ('2022-06-30','13:00:00',540663,'2022-06-30-14.01.55','Mother has high hormones')
, ('2020-02-15','09:00:00',700444,'2020-02-15-09.54.22','Father has private clinic')
, ('2020-03-15','10:00:00',700444,'2020-03-15-10.40.03','Father and Mother healthy')
, ('2020-06-20','09:00:00',700444,'2020-06-20-10.00.11','Birth is setted')
, ('2020-06-20','09:00:00',700444,'2020-06-20-09.23.44','Father wants a home birth')
, ('2020-06-10','11:00:00',700444,'2020-06-10-11.55.20','EXPECTED DATE ready')
;

INSERT INTO notes(nadate,nahour,npregnancyid,ntimestamp,ncontent)
VALUES
  ('2021-03-18','10:00:00',450450,'2021-03-18-10.32.11','Mother very healthy')
, ('2021-04-05','09:00:00',450450,'2021-04-05-09.22.21','Mother travels a lot, and keeps to')
, ('2021-05-05','10:00:00',450450,'2021-05-05-10.55.43','Sampling may need to be done again')
, ('2021-06-01','11:00:00',450450,'2021-06-01-11.33.33','birth time setted')
, ('2021-07-10','14:00:00',450450,'2021-07-10-14.55.33','Mother and baby doing good')
;
INSERT INTO notes(nadate,nahour,npregnancyid,ntimestamp,ncontent)
VALUES
  ('2021-08-10','10:00:00',450450,'2021-08-10-10.55.44','New sample was needed')
, ('2021-05-14','11:00:00',450450,'2021-05-14-12.12.12','Expected date is done')
, ('2021-11-01','12:00:00',450450,'2021-11-01-12.50.50','birth is setted')
, ('2022-02-01','14:00:00',300201,'2022-02-01-14.56.55','Father on music tour, mother needs tests')
, ('2022-02-16','11:00:00',300201,'2022-02-16-11.50.32','father needs testing')
, ('2022-02-28','09:00:00',300201,'2022-02-28-09.40.30','father dr check, blood drawn')
;
INSERT INTO notes(nadate,nahour,npregnancyid,ntimestamp,ncontent)
VALUES
  ('2022-03-09','10:00:00',300201,'2022-03-09-11.02.02','mother needs a sampling')
, ('2022-03-19','11:00:00',300201,'2022-03-19-11.33.33','mother needs hormone checked')
, ('2022-05-20','12:00:00',300201,'2022-05-20-12.54.30','birth is setted')
, ('2022-04-02','12:00:00',300201,'2022-04-02-13.01.01','Mother and father excited for birth')
, ('2022-05-15','14:00:00',300201,'2022-05-15-14.30.21','Dr test for liver')
, ('2022-03-10','15:00:00',300201,'2022-03-10-15.49.50','Expected date setting')
;

INSERT INTO notes (nadate,nahour,npregnancyid,ntimestamp,ncontent)
VALUES
 ('2022-06-20','09:00:00',300201,'2022-06-20-10.02.02','Birth is setted')
;

INSERT INTO birthsettingapp(bsadate,bsahour,bsapregnancyid,address1,address2,address3)
VALUES
  ('2022-06-30','16:00:00',310600,'Ashley Drive 4','80 Max Avenue','67 Krow Street')
, ('2022-10-16','15:00:00',540663,'43 Ella Avenue','20 X Street')
, ('2020-06-20','09:00:00',700444,'123 Private Drive','Rue Neige 12','20 Kader Road')
, ('2021-06-01','11:00:00',450450,'200 HP Drive','80 Max Avenue',NULL)
, ('2021-11-01','12:00:00',450450,'Amsterdam Airport','45 Travis Street','12 Grove Street, Verdun')
, ('2022-05-20','12:00:00',300201,'80 Max Avenue',NULL,NULL)
, ('2022-06-20','09:00:00',300201,'80 Max Avenue',NULL,NULL)
;

INSERT INTO birthoperation(pregnancyid,location,operatingmid,chosendate)
VALUES
  (300201,'80 Max Avenue',34211,'2022-07-09')
, (310600,'Montreal Hospital',34211,'2022-07-19')
, (450450,'12 Grove Street, Verdun',20133,'2021-11-12')
, (540663,'43 Ella Avenue',30445,'2022-06-04')
, (700444,'20 Kader Road',50670,'2020-06-30')
;

INSERT INTO baby(pregnancyid,babyorder,dob,timebirth,bname,sex,bloodtype)
VALUES
  (300201,1,'2022-07-09','23:30:21','Mark','M','AB+')
, (300201,3,'2020-07-10','00:03:22','Marie','F','AB+')
, (300201,2,'2022-07-09','23:47:33','John','M','B+')
, (310600,1,'2022-07-14','11:48:21','Jacques','M','B-')
, (700444,1,'2020-06-30','11:39:00','Alexis','F','A+')
, (450450,1,'2021-11-12','10:44:22','Charles','M','A+')
, (450450,2,'2021-11-12','12:02:50','Hugo','M','A+')
, (540663,1,'2022-06-04','19:45:56','Ananya','F','O+')
;

INSERT INTO samplingtestapp(tadate,tahour,tapregnancyid,taname,tadateprescription,saname)
VALUES
  ('2022-02-02','10:00:00',310600,'Hormone sample','2022-01-17','Saliva')
, ('2022-03-02','11:00:00',310600,'blood iron','2022-02-02','Blood')
, ('2022-04-15','10:00:00',540663,'blood iron','2022-03-20','Blood')
, ('2022-05-02','10:00:00',540663,'Hormone sample','2022-04-15','Saliva')
, ('2022-06-12','11:00:00',540663,'Dr test','2022-05-02','Stool')
, ('2021-05-05','10:00:00',450450,'blood iron','2021-04-05','Blood')
, ('2021-08-10','10:00:00',450450,'Hormone sample','2021-07-10','Saliva')
, ('2022-02-28','09:00:00',300201,'Dr test','2022-02-16','Stool')
, ('2022-03-09','10:00:00',300201,'Hormone sample','2022-02-28','Saliva')
, ('2022-03-19','11:00:00',300201,'blood iron','2022-03-09','Blood')
, ('2022-05-15','14:00:00',300201,'Dr test','2022-04-02','Urine')
, ('2020-07-01','10:00:00',210000,'blood iron','2020-07-01','Blood')
, ('2020-06-01','09:00:00',210000,'blood iron','2020-06-01','Blood')
;

INSERT INTO expectedmeeting(tadate,tahour,tapregnancyid,taname,tadateprescription,method,expecteddate)
VALUES
  ('2022-04-02','15:00:00',310600,'Expected date','2022-03-02','last menstrual period','2022-07-21')
, ('2022-06-10','12:00:00',540663,'Expected date','2022-05-02','dating ultrasound','2022-06-12')
, ('2020-06-10','11:00:00',700444,'Expected date','2020-06-10','dating ultrasound','2020-07-10')
, ('2021-05-14','11:00:00',450450,'Expected date','2021-05-05','last menstrual period','2021-11-15')
, ('2022-03-10','15:00:00',300201,'Expected date','2022-03-09','dating ultrasound','2022-06-01')
;

INSERT INTO labwork(tadate,tahour,tapregnancyid,taname,tadateprescription,techid,result)
VALUES
  ('2020-07-01','10:00:00',210000,'blood iron','2020-07-01',1001,'Blood is perfect!')
, ('2020-06-01','09:00:00',210000,'blood iron','2020-06-01',1012,'Blood iron is low. Meds prescribed.')
, ('2022-02-02','10:00:00',310600,'Hormone sample','2022-01-17',1001,'Low estrogen')
, ('2022-03-02','11:00:00',310600,'blood iron','2022-02-02',1012,'Blood type confirmed')
, ('2022-04-15','10:00:00',540663,'blood iron','2022-03-20',2034,'Blood type confirmed for mother')
, ('2022-05-02','10:00:00',540663,'Hormone sample','2022-04-15',2011,'High serotonine')
, ('2022-06-12','11:00:00',540663,'Dr test',       '2022-05-02',1021,'negative for all drugs')
;

INSERT INTO labwork(tadate,tahour,tapregnancyid,taname,tadateprescription,techid,result)
VALUES
  ('2021-05-05','10:00:00',450450,'blood iron','2021-04-05',1021,'High count of hemoglobin')
, ('2021-08-10','10:00:00',450450,'Hormone sample','2021-07-10',1012,'testosterone too high')
, ('2022-02-28','09:00:00',300201,'Dr test',       '2022-02-16',2034,'low vitamins')
, ('2022-03-09','10:00:00',300201,'Hormone sample','2022-02-28',1001,'High estrogen')
, ('2022-03-19','11:00:00',300201,'blood iron','2022-03-09',2034,'Blood type confirmed for both parents')
, ('2022-05-15','14:00:00',300201,'Dr test',       '2022-04-02',1001,'Optimal levels of vitamins')
;

INSERT INTO labwork(tadate,tahour,tapregnancyid,taname,tadateprescription,techid,result)
VALUES
  ('2022-04-02','15:00:00',310600,'Expected date', '2022-03-02',1001,'menstrual sampling successful')
, ('2022-06-10','12:00:00',540663,'Expected date', '2022-05-02',2034,'baby is 8months old')
, ('2020-06-10','11:00:00',700444,'Expected date', '2020-06-10',2011,'baby boy is healthy')
, ('2021-05-14','11:00:00',450450,'Expected date', '2021-05-05',2011, 'menstrual sampling verified')
, ('2022-03-10','15:00:00',300201,'Expected date', '2022-03-09',1001,'baby is 7months old')
;





--SELECT a.adate,a.ahour,m.mramqid,m.mname,m.mphonenumber
--FROM appointment a, mother m,  conceive co
--WHERE co.pregnancyid = a.pregnancyid AND co.motherramq=m.mramqid
--AND a.adate BETWEEN '2022-03-21' AND '2022-03-25' AND
--a.midwifeid IN ( SELECT m.practionerid 
--FROM midwife m
--WHERE miname='Marion Girard')
--;

--SELECT lb.tadate, lb.tadateprescription, lb.result
--FROM mother mo, pregnancy p, conceive co, labwork lb
--WHERE p.pregnancyid=co.pregnancyid AND mo.mramqid=co.motherramq
--AND lb.tapregnancyid=p.pregnancyid
--AND lb.taname='blood iron'
--AND mo.mname='Victoria Gutierrez'
--AND p.firstdate NOT IN (SELECT MIN(p.firstdate)
  --     FROM mother mo, pregnancy p, conceive co
--	WHERE p.pregnancyid=co.pregnancyid AND mo.mramqid=co.motherramq
--	AND mo.mname='Victoria Gutierrez')
--GROUP BY p.firstdate,lb.tadate,lb.tadateprescription,lb.result
--HAVING MIN(p.firstdate)=p.firstdate
--;

--WITH cd AS(
--  SELECT CURRENT DATE as c
--  FROM sysibm.sysdummy1
--)
--SELECT mo.mramqid, mo.mname, mo.mphonenumber
--FROM mother mo, worksat wa, assignedat aa, conceive co
--WHERE mo.mramqid=co.motherramq AND co.pregnancyid=aa.pregnancyid
--AND aa.midwife1id=wa.mpid
--AND (co.pregnancyid IN (SELECT p.pregnancyid
--	       	FROM pregnancy p 
--		GROUP BY p.firstdate,p.pregnancyid
--		HAVING p.firstdate >=( SELECT MAX(cd.c) FROM cd)  ) 
--       OR co.pregnancyid IN (SELECT bo.pregnancyid
--			FROM birthoperation bo
--			GROUP BY bo.chosendate,bo.pregnancyid	
--			HAVING bo.chosendate >= (SELECT MAX(cd.c) FROM cd )))
--AND wa.hfname='Lac-Saint-Louis'
--;


--WITH wap AS(
--SELECT wa.hfname AS hfname ,p.pregnancyid AS pid
--FROM  worksat wa,  assignedat aa, birthoperation bo, pregnancy p
--WHERE aa.midwife1id=wa.mpid AND bo.pregnancyid=aa.pregnancyid
--AND p.pregnancyid=aa.pregnancyid
--AND bo.chosendate BETWEEN '2022-07-01' AND '2022-07-31'
--GROUP BY wa.hfname, p.pregnancyid
--UNION
--SELECT wa.hfname AS hfname ,p.pregnancyid  AS pid
--FROM worksat wa, assignedat aa, pregnancy p
--WHERE aa.midwife1id=wa.mpid AND p.pregnancyid=aa.pregnancyid
--AND p.pregnancyid NOT IN(SELECT bo.pregnancyid FROM birthoperation bo)
--AND p.firstdate BETWEEN '2022-07-01' AND '2022-07-31'
--GROUP BY wa.hfname, p.pregnancyid
-- )
--SELECT wap.hfname  , COUNT(wap.pid) as pregnancyid_count
--FROM wap
--GROUP BY wap.hfname
--;

--SELECT m.mramqid,m.mname,SUM(p.numofbabies) AS baby_count
--FROM conceive co, pregnancy p, mother m
--WHERE p.pregnancyid=co.pregnancyid AND co.motherramq=m.mramqid
--AND p.numofbabies >1
--GROUP BY m.mramqid,m.mname
--;

--CREATE VIEW midwifeinfo
--AS
--SELECT mi.practionerid AS pid , mi.miname AS miname, mi.miphonenumber AS phonenumber, mi.miemail AS email, hcf.hfname AS hfname, hcf.hfaddress AS address
--FROM midwife mi, worksat wa, healthcarefacility hcf
--WHERE mi.practionerid=wa.mpid AND hcf.hfphonenumber=wa.hfphone AND hcf.hfname=wa.hfname 
--AND hcf.hfemail=wa.hfemail;

--SELECT *
--FROM midwifeinfo
--FETCH FIRST 5 ROWS ONLY;

--SELECT *
--FROM midwifeinfo mi
--WHERE mi.hfname='Lac-Saint-Louis'
--FETCH FIRST 5 ROWS ONLY;

--INSERT INTO midwifeinfo(pid,miname,phonenumber,email,hfname,address)
--VALUES
--(100,'Jacqueline Maire','5140002000','jac@aqcenter','Aq Center','43 Ella Avenue');

