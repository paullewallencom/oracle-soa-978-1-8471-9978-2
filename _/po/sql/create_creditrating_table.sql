CREATE TABLE CREDITCARDINFO
(
SSN VARCHAR2(15) NOT NULL,
FIRST_NAME VARCHAR2(30),
LAST_NAME VARCHAR2(30),
CCNUMBER VARCHAR2(20) NOT NULL,
CREDITRATING NUMBER,
STATUS VARCHAR2(20) NOT NULL
);

insert into CREDITCARDINFO VALUES (
    '111-11-1111',
    'Neena',
    'Kochhar',
    '1234-1234-1234-1234',
	'3'
	, 'VALID'
);

insert into CREDITCARDINFO VALUES (
    '222-22-2222',
    'Steven',
    'King',
    '5678-5678-5678-5678',
	'4'
	, 'VALID'
);

insert into CREDITCARDINFO VALUES (
    '333-33-3333',
    'Lex',
    'De Haan',
    '4321-4321-4321-4321',
	'5'
	, 'INVALID'
);

insert into CREDITCARDINFO VALUES (
    '444-44-4444',
    'Alexander',
    'Hunold',
    '8765-8765-8765-8765',
	'1'
	, 'VALID'
);
Exit;
