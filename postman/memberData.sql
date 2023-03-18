
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
(115, '�i', '�x��', @ImageData1, 2, 'abc123@gmail.com', '0988321123', '�x�_���j�w�ϴ_���n���@�q55��3��', '1995-06-20'),
(116, '��', '�@��', @ImageData2, 1, 'def456@gmail.com', '0989325879', '�x�_���j�w�ϴ_���n���@�q150��2��', '1993-08-22'),
(117, '��', '�ι�', @ImageData3, 2, 'ghi789@gmail.com', '0931526895', '�x�_���j�w�ϴ_���_���@�q55��3��', '1997-07-30'),
(118, '��', '�͵�', @ImageData4, 1, 'jkl123@gmail.com', '0988832598', '�x�_���j�w��ù���ָ��@�q42', '1995-02-21'),
(119, '�d', '�v', @ImageData5, 1, '123abc@oulook.com', '0987621456', '�x�_���j�w�ϴ��ƫn���G�q2��3��', '1998-10-01'),
(120, '�L', '�\ޱ', @ImageData6, 2, '456def@oulook.com', '0930568789', '�x�_���j�w�ϴ��ƫn���T�q25��', '1992-09-09'),
(121, '�_', '���', @ImageData7, 1, '789ghi@oulook.com', '0985986689', '�x�_���j�w�ϴ_���_�@�q20��3��', '1993-11-05'),
(122, '��', '�a��', @ImageData8, 1, '123jkl@oulook.com', '09883829409', '�x�_���j�w�ϴ_���_�@�q30��3��', '1995-03-16');
