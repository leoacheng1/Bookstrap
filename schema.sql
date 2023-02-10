USE Bookstrap;

Create Table Members(
	member_id int identity(1,1) primary key,
	acccount nvarchar(max) not null,
	password nvarchar(max) not null,
	valid tinyint not null, --���ҡA���S�����v
	member_level nvarchar(50)
);

Create Table MemberDetails(
	member_id int FOREIGN KEY REFERENCES Members(member_id) primary key,
	member_name nvarchar(50),
	photo varbinary,
	sex tinyint, --�ʧO
	email nvarchar(max),
	cellphone nvarchar(max),
	address nvarchar(max),
	birthday Date
) ;
Create Table BookDetails(
	book_id int identity(1,1) primary key,
	size nvarchar(50), --���q
	pages_amount int,
	book_intro nvarchar(max), --��²��
	grade nvarchar(50), --����: adult, child......
);

Create Table Books(
	book_id int identity(1,1) primary key,
	book_name nvarchar(max),
	category nvarchar(max), --�y�����O >> ���O(eg. ����� >> ���v) 
	languages nvarchar(max), --�y�����O
	author nvarchar(max),
	publisher nvarchar(max),
	publish_date Date,
	book_photo varbinary, --�ʭ��Ϥ�
	discount int, --ex.79��A�s�����79
	price int,
	translator nvarchar(max),
	bookDetail_id int references BookDetails(book_id)
);



Create Table Employees(
	emp_id int identity(1,1) primary key,
	acccount nvarchar(max) not null,
	password nvarchar(max) not null,		
	emp_name nvarchar(max),
	sex tinyint,
	emp_position nvarchar(max) --¾�� eg. ���q���u,�g�z,.......
);

Create Table Shops(
	shop_id int not null identity(1,1) primary key,
	shop_name nvarchar(max),
	address nvarchar(max),
	phone nvarchar(max),
    open_hour nvarchar(max),
	close_hour nvarchar(max),
	shop_photo varbinary(max),
	latitude nvarchar(max),
	longitude nvarchar(max)
);

Create Table ShopEmployees(
	emp_id int foreign key references Employees(emp_id),
	shop_id int foreign key references Shops(shop_id),
	salary int not null, --(���~)
	title nvarchar(max), --(¾��: ����,���u....)
	PRIMARY KEY (emp_id,shop_id)
)

/*Create Table EmployeeWorkdays(
	emp_id int foreign key references Employees(emp_id),
	workday Date, 
	worktime nvarchar(50) --���Z �߯Z
)*/


Create Table ShopStock(
	shop_id int foreign key references Shops(shop_id),
	book_id int foreign key references Books(book_id),
	amount int not null 
	primary key(shop_id, book_id)
);

Create Table Sales(
	sale_id int not null identity(1,1) primary key,
	address nvarchar(max),
	delievery nvarchar(max),
	payment nvarchar(max), --�f��I��, �u�W�I��
	pay nvarchar(max), --linepay ... etc
	weight int not null,
	state nvarchar(50), --�B�z���B�����B�w�X�f
	member_id int foreign key references Members(member_id)
);

Create Table SalesDetails(
	sales_id int foreign key references Sales(sale_id),
	book_id int foreign key references Books(book_id),
	amount int not null,
	primary key(sales_id, book_id)
);

Create Table ShoppingCarts(
	member_id int foreign key references Members(member_id),
	book_id int foreign key references Books(book_id),
	amount int not null,
	primary key(member_id, book_id)
);


Create Table Coupons(
	coupon_id int not null identity(1,1) primary key,
	name nvarchar(max),
	discount int,
);

Create Table UserCoupon(
	member_id int foreign key references Members(member_id),
	coupon_id int foreign key references Coupons(coupon_id),
	amount int not null
	primary key(member_id, coupon_id)
);

Create Table Comment(
	comment_id int primary key identity,
	member_id int foreign key references Members(member_id),
	book_id int foreign key references Books(book_id),
	content nvarchar(max), --����
	rating tinyint not null,  --���� eg.�P�P 1~5���P
	favorite tinyint not null --�̷R 0:�S�� 1:��
);

Create Table Visited( --�ӫ����g�ݹL�\��
	member_id int foreign key references Members(member_id),
	book_id int foreign key references Books(book_id),
	visit_date Date not null
) 

