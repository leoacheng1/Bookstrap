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
	gender_id tinyint foreign key references Gender(gender_id), --性別
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
	size nvarchar(50), --重量
	pages_amount int,
	book_intro nvarchar(max), --書簡介
	grade nvarchar(50), --分級: adult, child......
);

Create Table EBooks(
	ebook_id int identity(1,1) primary key,
	ebook_name nvarchar(50),
	category nvarchar(50), --語言類別 >> 類別(eg. 中文書 >> 歷史) 
	languages nvarchar(50), --語言類別
	author nvarchar(50),
	publisher nvarchar(50),
	publish_date Date,
	ebook_photo varbinary(max), --封面圖片
	discount int, --ex.79折，存成整數79
	price int,
	translator nvarchar(50),
	ebookDetail_id int references EBookDetails(ebook_detail_id),
	ebook_file varbinary(max)
);

ALTER TABLE Comment ADD ebook_id int null;

ALTER TABLE ShoppingCarts ADD ebook_id int null;

ALTER TABLE EBooks ADD member_id int null foreign key REFERENCES Members(member_id);


-------3/5-------
password

CREATE TABLE Roles (
    roles_id INT IDENTITY(1,1) PRIMARY KEY,
    roles_name NVARCHAR(255) NOT NULL
);

CREATE TABLE MemberRoles (
    member_role_id INT IDENTITY(1,1) PRIMARY KEY,
    FK_member_id INT NOT NULL,
    FK_role_id INT NOT NULL,
    FOREIGN KEY (FK_member_id) REFERENCES Members(member_id),
    FOREIGN KEY (FK_role_id) REFERENCES Roles(roles_id)
);

------
DROP TABLE IF EXISTS Gender;
CREATE TABLE Gender(
gender_id tinyint primary key not null identity(1,1),
gender nvarchar(6)
);

INSERT INTO Gender(gender) VALUES ('男'), ('女'), ('其他');

INSERT INTO Employees(account, password, emp_position) VALUES ('admin', '123456', 'admin'), ('owner', '12345', 'owner'), ('employee', '1234', 'employee');

--------

CREATE TABLE TestShoppingCarts (        --待結帳
t_s_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
FK_member_id int NOT NULL FOREIGN KEY REFERENCES Members(member_id),
FK_eBook_id int NOT NULL FOREIGN KEY REFERENCES EBooks(ebook_id)
);



CREATE TABLE TestCheckout(                    --結帳完成
t_c_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
FK_ts_id int NOT NULL FOREIGN KEY REFERENCES TestShoppingCarts(t_s_id)
);