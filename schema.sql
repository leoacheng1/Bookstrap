USE Bookstrap;

Create Table Members(
	member_id int identity(1,1) primary key,
	acccount nvarchar(max) not null,
	password nvarchar(max) not null,
	valid tinyint not null, --驗證，有沒有停權
	member_level nvarchar(50)
);

Create Table MemberDetails(
	member_id int FOREIGN KEY REFERENCES Members(member_id) primary key,
	member_name nvarchar(50),
	photo varbinary,
	sex tinyint, --性別
	email nvarchar(max),
	cellphone nvarchar(max),
	address nvarchar(max),
	birthday Date
) ;
Create Table BookDetails(
	book_id int identity(1,1) primary key,
	size nvarchar(50), --重量
	pages_amount int,
	book_intro nvarchar(max), --書簡介
	grade nvarchar(50), --分級: adult, child......
);

Create Table Books(
	book_id int identity(1,1) primary key,
	book_name nvarchar(max),
	category nvarchar(max), --語言類別 >> 類別(eg. 中文書 >> 歷史) 
	languages nvarchar(max), --語言類別
	author nvarchar(max),
	publisher nvarchar(max),
	publish_date Date,
	book_photo varbinary(max), --封面圖片
	discount int, --ex.79折，存成整數79
	price int,
	translator nvarchar(max),
	bookDetail_id int references BookDetails(book_id)
);



Create Table Employees(
	emp_id int identity(1,1) primary key,
	account nvarchar(max) ,
	password nvarchar(max) ,		
	emp_name nvarchar(max),
	sex tinyint,
	emp_photo varbinary(max),
	emp_position nvarchar(max) --職位 eg. 普通員工,經理,.......
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

create table ShopEmployees(
	emp_id int primary key foreign key references Employees(emp_id),
	emp_shopid int foreign key references Shops(shop_id),
	emp_name nvarchar(50) not null,
	emp_photo varbinary(max),
	emp_title nvarchar(50) not null,
	emp_salary int not null,
)

/*Create Table EmployeeWorkdays(
	emp_id int foreign key references Employees(emp_id),
	workday Date, 
	worktime nvarchar(50) --早班 晚班
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
	payment nvarchar(max), --貨到付款, 線上付款
	pay nvarchar(max), --linepay ... etc
	weight int not null,
	state nvarchar(50), --處理中、取消、已出貨
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
	content nvarchar(max), --內文
	rating tinyint not null,  --打分 eg.星星 1~5顆星
	favorite tinyint not null --最愛 0:沒有 1:有
);

Create Table Visited( --商城曾經看過功能
	member_id int foreign key references Members(member_id),
	book_id int foreign key references Books(book_id),
	visit_date Date not null
) 
--------------------------------排班新增---------------------------------
create table Shift(
shift_id int primary key identity(1,1) not null,
shift_class nvarchar(50) not null,
shift_time nvarchar(50)not null,
)

create table Vacation(
vacation_id int primary key identity(1,1) not null,
vacation_class nvarchar(50) not null,
)

create table ShopEmployeesAttendance(
attend_id int primary key identity(1,1) not null,
attend_date date,
attend_empid int foreign key references ShopEmployees(emp_id),
attend_vacationid int foreign key references Vacation(vacation_id),
attend_time decimal,
attend_agree int,
attend_salary int
)

create table ShopEmployeesSchedule(
schedule_id int primary key identity(1,1) not null,
schedule_date date,
schedule_empid int foreign key references ShopEmployees(emp_id),
schedule_shiftid int foreign key references Shift(shift_id),
)
