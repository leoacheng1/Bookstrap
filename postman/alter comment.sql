use Bookstrap

alter table Comment add comment_id int not null primary key identity

use Bookstrap
alter table Members add vertification_code nvarchar(255);

use Bookstrap
alter table Members add auth_provider nvarchar(15);

use Bookstrap
alter table MemberDetails add member_lastname nvarchar(50) not null;


alter table MemberDetails add member_firstname nvarchar(50) not null;

use Bookstrap

alter table Members add reset_password_token nvarchar(45);



DROP TABLE IF EXISTS MemberDetails;

Create Table MemberDetails(
	member_id int FOREIGN KEY REFERENCES Members(member_id) primary key,
	member_lastname nvarchar(50) not null,
	member_firstname nvarchar(50) not null,
	photo varbinary,
	gender_id tinyint foreign key references Gender(gender_id), --�ʧO
	sex tinyint,
	email nvarchar(max),
	cellphone nvarchar(max),
	address nvarchar(max),
	birthday Date
) ;


ALTER TABLE Books ADD bookDetail_id int null;



ALTER TABLE Books ADD translator nvarchar(max) null;

-------------Ebook--------------

Create Table EBookDetails(
	ebook_detail_id int identity(1,1) primary key,
	size nvarchar(50), --���q
	pages_amount int,
	book_intro nvarchar(max), --��²��
	grade nvarchar(50), --����: adult, child......
);

Create Table EBooks(
	ebook_id int identity(1,1) primary key,
	ebook_name nvarchar(50),
	category nvarchar(50), --�y�����O >> ���O(eg. ����� >> ���v) 
	languages nvarchar(50), --�y�����O
	author nvarchar(50),
	publisher nvarchar(50),
	publish_date Date,
	ebook_photo varbinary(max), --�ʭ��Ϥ�
	discount int, --ex.79��A�s�����79
	price int,
	translator nvarchar(50),
	ebookDetail_id int references EBookDetails(ebook_detail_id),
	ebook_file varbinary(max)
);

ALTER TABLE Comment ADD ebook_id int null;

ALTER TABLE ShoppingCarts ADD ebook_id int null;

ALTER TABLE EBooks ADD member_id int null foreign key REFERENCES Members(member_id);