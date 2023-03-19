
use Bookstrap

INSERT INTO Members (acccount, password, valid, member_level) VALUES ('abc123@gmail.com', 'abc123', 1, 1),
																	('def456@gmail.com', 'def456', 1, 1),
																	('ghi789@gmail.com', 'ghi789', 1, 1),
																	('jkl123@gmail.com', 'jkl123', 1, 1),
																	('123abc@oulook.com', '123abc', 1, 1),
																	('456def@oulook.com', '456def', 1, 1),
																	('789ghi@oulook.com', '789ghi', 1, 1),
																	('123jkl@oulook.com', '123jkl', 1, 1);
																	
																	
										

DECLARE @ImageData1 VARBINARY(MAX);
SELECT @ImageData1 = BulkColumn FROM OPENROWSET(BULK 'C:\Bookstrap\user\01.png', SINGLE_BLOB) as filedata;

DECLARE @ImageData2 VARBINARY(MAX);
SELECT @ImageData2 = BulkColumn FROM OPENROWSET(BULK 'C:\Bookstrap\user\02.png', SINGLE_BLOB) as filedata;

DECLARE @ImageData3 VARBINARY(MAX);
SELECT @ImageData3 = BulkColumn FROM OPENROWSET(BULK 'C:\Bookstrap\user\03.png', SINGLE_BLOB) as filedata;

DECLARE @ImageData4 VARBINARY(MAX);
SELECT @ImageData4 = BulkColumn FROM OPENROWSET(BULK 'C:\Bookstrap\user\04.png', SINGLE_BLOB) as filedata;

DECLARE @ImageData5 VARBINARY(MAX);
SELECT @ImageData5 = BulkColumn FROM OPENROWSET(BULK 'C:\Bookstrap\user\05.png', SINGLE_BLOB) as filedata;

DECLARE @ImageData6 VARBINARY(MAX);
SELECT @ImageData6 = BulkColumn FROM OPENROWSET(BULK 'C:\Bookstrap\user\06.png', SINGLE_BLOB) as filedata;

DECLARE @ImageData7 VARBINARY(MAX);
SELECT @ImageData7 = BulkColumn FROM OPENROWSET(BULK 'C:\Bookstrap\user\07.png', SINGLE_BLOB) as filedata;

DECLARE @ImageData8 VARBINARY(MAX);
SELECT @ImageData8 = BulkColumn FROM OPENROWSET(BULK 'C:\Bookstrap\user\08.png', SINGLE_BLOB) as filedata;

INSERT INTO MemberDetails (member_id, member_lastname, member_firstname, photo, sex, email, cellphone, address, birthday) 
VALUES
(115, '張', '庭予', @ImageData1, 2, 'abc123@gmail.com', '0988321123', '台北市大安區復興南路一段55號3樓', '1995-06-20'),
(116, '王', '世堅', @ImageData2, 1, 'def456@gmail.com', '0989325879', '台北市大安區復興南路一段150號2樓', '1993-08-22'),
(117, '陳', '佳境', @ImageData3, 2, 'ghi789@gmail.com', '0931526895', '台北市大安區復興北路一段55號3樓', '1997-07-30'),
(118, '王', '凱翔', @ImageData4, 1, 'jkl123@gmail.com', '0988832598', '台北市大安區羅斯福路一段42', '1995-02-21'),
(119, '吳', '瀚', @ImageData5, 1, '123abc@oulook.com', '0987621456', '台北市大安區敦化南路二段2號3樓', '1998-10-01'),
(120, '林', '珮瑄', @ImageData6, 2, '456def@oulook.com', '0930568789', '台北市大安區敦化南路三段25號', '1992-09-09'),
(121, '柯', '文哲', @ImageData7, 1, '789ghi@oulook.com', '0985986689', '台北市大安區復興北一段20號3樓', '1993-11-05'),
(122, '陳', '家昊', @ImageData8, 1, '123jkl@oulook.com', '09883829409', '台北市大安區復興北一段30號3樓', '1995-03-16');
