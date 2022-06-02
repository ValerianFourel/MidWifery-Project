

-- NAME: Valerian Raphael FOUREL



CREATE TABLE father
(
 femail VARCHAR(30) NOT NULL UNIQUE
, fname VARCHAR(20) NOT NULL
, fdob DATE
, framqid VARCHAR(12)
, fphonenumber VARCHAR(12) NOT NULL
, faddress VARCHAR(30)
, fbloodtype VARCHAR(5)
, fprofession VARCHAR(20)
, PRIMARY KEY(femail)
);

CREATE TABLE technician
(
techid INTEGER NOT NULL
,  tname VARCHAR(20)
, tphonenumber VARCHAR(12)
, PRIMARY KEY(techid)
);

CREATE TABLE mother
(
mramqid VARCHAR(12) NOT NULL
, memail VARCHAR(30)
, mname VARCHAR(20)
, mdob DATE
, mphonenumber VARCHAR (12)
, maddress VARCHAR(30)
, mbloodtype VARCHAR(5)
, mprofession VARCHAR(20)
, PRIMARY KEY(mramqid)
);

-- CREATE TYPE typeinsti as ENUM ('BirthCenter','CommClinic');

CREATE TABLE healthcarefacility
(
  hfphonenumber VARCHAR(12) NOT NULL
, hfname VARCHAR(20) NOT NULL
, hfemail VARCHAR(30) NOT NULL
, typeinstitution VARCHAR(11) NOT NULL CHECK (typeinstitution in ('BirthCenter','CommClinic'))
, website VARCHAR(20)
, hfaddress VARCHAR(30)
, PRIMARY KEY(hfphonenumber, hfname, hfemail)
);

CREATE TABLE pairedwith
( mramqid VARCHAR(12) NOT NULL
, hfphonenumber VARCHAR(12) NOT NULL
, hfname VARCHAR(20) NOT NULL
, hfemail VARCHAR(30) NOT NULL
, PRIMARY KEY(mramqid,hfphonenumber,hfname,hfemail)
, FOREIGN KEY (mramqid) REFERENCES mother (mramqid)
, FOREIGN KEY (hfphonenumber,hfname,hfemail) REFERENCES healthcarefacility (hfphonenumber,hfname,hfemail)
);


CREATE TABLE couple
(
 fatherphone VARCHAR(12) NOT NULL --  REFERENCES father (fphonenumber)
, fathername VARCHAR(20) NOT NULL --  REFERENCES father (fname)
, motherramq VARCHAR(12) NOT NULL
, femail VARCHAR(30) NOT NULL
, cemail VARCHAR(30) 
, PRIMARY KEY(motherramq,femail)
, CONSTRAINT motherinfo FOREIGN KEY( motherramq )  REFERENCES mother (mramqid)
, CONSTRAINT fatherinfo FOREIGN KEY( femail ) REFERENCES father (femail)
);


CREATE TABLE midwife
(
 practionerid INTEGER NOT NULL
,miphonenumber VARCHAR(12)
,miemail VARCHAR(30)
, miname VARCHAR(20)
, PRIMARY KEY(practionerid)
);

CREATE TABLE worksat (
	mpid INTEGER NOT NULL,
	hfphone VARCHAR(12) NOT NULL,
	hfname VARCHAR(20) NOT NULL,
	hfemail VARCHAR(30) NOT NULL,
	PRIMARY KEY (mpid, hfphone, hfname, hfemail),
	FOREIGN KEY (mpid) REFERENCES midwife (practionerid) ,
	FOREIGN KEY (hfphone, hfname, hfemail) REFERENCES healthcarefacility(hfphonenumber, hfname, hfemail)
);

CREATE TABLE pregnancy
(
 pregnancyid INTEGER NOT NULL
, firstdate DATE NOT NULL
, numofbabies INTEGER
, PRIMARY KEY(pregnancyid)
);

CREATE TABLE conceive
( pregnancyid INTEGER NOT NULL
, motherramq VARCHAR(12) NOT NULL
, femail VARCHAR(30) NOT NULL
, numpregnancy INTEGER NOT NULL
, PRIMARY KEY(pregnancyid,motherramq,femail)
, FOREIGN KEY(pregnancyid) REFERENCES pregnancy (pregnancyid)
, FOREIGN KEY(motherramq,femail) REFERENCES couple (motherramq,femail)
);


CREATE TABLE onlinesession
( 
	midwifeid INTEGER NOT NULL
, adate DATE NOT NULL
, ahour TIME NOT NULL
, language VARCHAR(10)  NOT NULL
, PRIMARY KEY(midwifeid, adate, ahour)
, FOREIGN KEY (midwifeid) REFERENCES midwife (practionerid)
);

CREATE TABLE registeredfor
( 
	midwifeid INTEGER NOT NULL
 , adate DATE NOT NULL 
, ahour TIME NOT NULL  
, motherramq VARCHAR(12) NOT NULL
, femail VARCHAR(30) NOT NULL
, hasattended BOOLEAN 
, PRIMARY KEY(midwifeid,adate,ahour,motherramq,femail)
, FOREIGN KEY(midwifeid,adate,ahour) REFERENCES onlinesession (midwifeid, adate, ahour)
, FOREIGN KEY(motherramq,femail) REFERENCES couple (motherramq,femail)
);

CREATE TABLE selects
(
	midwifeid INTEGER NOT NULL
	, adate DATE NOT NULL
	, ahour TIME NOT NULL
	, motherramq VARCHAR(12) NOT NULL
	,femail VARCHAR(30) NOT NULL
	, interested BOOLEAN
	, selected BOOLEAN
	, PRIMARY KEY(midwifeid, adate,ahour, motherramq,femail)
	, FOREIGN KEY(midwifeid,adate,ahour) REFERENCES onlinesession (midwifeid, adate, ahour)
	, FOREIGN KEY(motherramq,femail) REFERENCES couple (motherramq,femail)
);

CREATE TABLE assignedat
(
 pregnancyid INTEGER NOT NULL
, midwife1id INTEGER NOT NULL
, midwife2id INTEGER
, PRIMARY KEY(pregnancyid, midwife1id)
, FOREIGN KEY (pregnancyid) REFERENCES pregnancy (pregnancyid)
, FOREIGN KEY (midwife1id) REFERENCES midwife (practionerid)
, FOREIGN KEY (midwife2id) REFERENCES midwife (practionerid)
);

CREATE TABLE appointment
(
	adate DATE NOT NULL
, ahour TIME NOT NULL
, pregnancyid INTEGER NOT NULL
, midwifeid INTEGER NOT NULL
, PRIMARY KEY ( adate , ahour , pregnancyid )
, FOREIGN KEY( pregnancyid) REFERENCES pregnancy ( pregnancyid )
, FOREIGN KEY(midwifeid) REFERENCES midwife (practionerid)
);



CREATE TABLE generalappointment
(
	gadate DATE NOT NULL
, gahour TIME NOT NULL 
, gapregnancyid INTEGER NOT NULL
, PRIMARY KEY ( gadate, gahour, gapregnancyid )
, FOREIGN KEY (gadate,gahour,gapregnancyid) REFERENCES appointment (adate,ahour,pregnancyid)
);


CREATE TABLE birthsettingapp
(
	  bsadate DATE NOT NULL
	, bsahour TIME NOT NULL
	, bsapregnancyid INTEGER NOT NULL
	, address1 VARCHAR(30) NOT NULL
	, address2 VARCHAR(30)
	, address3 VARCHAR(30)
	, PRIMARY KEY(bsadate,bsahour,bsapregnancyid)
	, FOREIGN KEY(bsadate,bsahour,bsapregnancyid) REFERENCES appointment(adate,ahour,pregnancyid)
);

CREATE TABLE testapp
(
	  tadate DATE NOT NULL
	, tahour TIME NOT NULL
	, tapregnancyid INTEGER NOT NULL
	, taname VARCHAR(15) NOT NULL
	, tadateprescription DATE NOT NULL
	, tadatetest DATE NOT NULL
	, tadatelabwork DATE
	, PRIMARY KEY(tadate,tahour,tapregnancyid,taname,tadateprescription)
	, FOREIGN KEY(tadate,tahour,tapregnancyid) REFERENCES appointment (adate,ahour, pregnancyid)
);

ALTER TABLE testapp
ADD CONSTRAINT date_check1
CHECK( tadatelabwork >= tadateprescription)
;

ALTER TABLE testapp
ADD CONSTRAINT date_check
CHECK(tadatetest >= tadateprescription)
;

CREATE TABLE samplingtestapp
(
	  tadate DATE NOT NULL
	, tahour TIME NOT NULL
	, tapregnancyid INTEGER NOT NULL
	, taname VARCHAR(15) NOT NULL
	, tadateprescription DATE NOT NULL
-- 	, tadatetest DATE NOT NULL
-- 	, tadatelabwork DATE
	, saname VARCHAR(15) NOT NULL
	, PRIMARY KEY(tadate,tahour,tapregnancyid,taname,tadateprescription)
	, FOREIGN KEY(tadate,tahour,tapregnancyid,taname,tadateprescription) REFERENCES testapp (tadate,tahour,tapregnancyid,taname,tadateprescription)
);

CREATE TABLE expectedmeeting
(
	  tadate DATE NOT NULL
	, tahour TIME NOT NULL
	, tapregnancyid INTEGER NOT NULL
	, taname VARCHAR(15) NOT NULL
	, tadateprescription DATE NOT NULL
-- 	, tadatetest DATE NOT NULL
-- 	, tadatelabwork DATE
	, method VARCHAR(25) NOT NULL
	, expecteddate DATE
	, PRIMARY KEY(tadate,tahour,tapregnancyid,taname,tadateprescription)
	, FOREIGN KEY(tadate,tahour,tapregnancyid,taname,tadateprescription) REFERENCES testapp (tadate,tahour,tapregnancyid,taname,tadateprescription)
);

CREATE TABLE labwork
(
	tadate DATE NOT NULL
	, tahour TIME NOT NULL
	, tapregnancyid INTEGER NOT NULL
	, taname VARCHAR(15) NOT NULL
	, tadateprescription DATE NOT NULL
	, techid INTEGER NOT NULL
	, result VARCHAR(50)
	, PRIMARY KEY(tadate,tahour,tapregnancyid,taname,tadateprescription,techid)
	, FOREIGN KEY (techid) REFERENCES technician (techid)
	, FOREIGN KEY(tadate,tahour,tapregnancyid,taname,tadateprescription) REFERENCES testapp (tadate,tahour, tapregnancyid, taname, tadateprescription)
);

CREATE TABLE notes
(
	nadate DATE NOT NULL 
	, nahour TIME NOT NULL
	, npregnancyid INTEGER NOT NULL
	, ntimestamp TIMESTAMP NOT NULL
	, ncontent VARCHAR(200) NOT NULL
	, PRIMARY KEY ( nadate , nahour , npregnancyid , ntimestamp )
	, FOREIGN KEY ( nadate , nahour , npregnancyid ) REFERENCES appointment (adate, ahour, pregnancyid)
);

CREATE TABLE birthoperation
(      pregnancyid INTEGER NOT NULL
	, location VARCHAR(30) NOT NULL
        , operatingmid INTEGER NOT NULL
	, chosendate DATE NOT NULL
	, PRIMARY KEY(pregnancyid)
	, FOREIGN KEY (pregnancyid) REFERENCES pregnancy (pregnancyid)
	, FOREIGN KEY (operatingmid) REFERENCES midwife (practionerid)
);

-- CREATE TYPE sexb AS ENUM ('F','M');

CREATE TABLE baby
( 
pregnancyid INTEGER NOT NULL,
babyorder INTEGER NOT NULL,
dob DATE NOT NULL,
timebirth TIME NOT NULL,
bname VARCHAR(20),
sex VARCHAR(1) NOT NULL CHECK (sex in ('F','M')),
bloodtype VARCHAR(5),
PRIMARY KEY(pregnancyid,babyorder),
FOREIGN KEY (pregnancyid) REFERENCES pregnancy (pregnancyid)
);




