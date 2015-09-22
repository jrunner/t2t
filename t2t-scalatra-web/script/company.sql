
-- 创建 新闻表:TBL_NEWS
create table TBL_NEWS 
(
	newsID int not null,
	title varchar(50) ,	
	content varchar(800),
	writerDate varchar(20),
  constraint PK_TBL_NEWS primary key (newsID)
);


-- 创建 商品表:TBL_PRODUCT
create table TBL_PRODUCT
(
	productID int not null,
	serialNumber varchar(20),
	name varchar(20)  ,
	brand varchar(20),
	model varchar(20),
	price numeric(9,2),
	picture varchar(20),
	description varchar(800),
  constraint PK_TBL_PRODUCT primary key (productID)
);


-- 创建 用户表:TBL_USER
create table TBL_USER
(
	userID int not null,
	userName varchar(20) ,
	password varchar(20)  ,
	status int ,
  constraint PK_TBL_USER primary key (userID)
);

-- 创建 留言表:TBL_MESSAGE
create table TBL_MESSAGE
(
	messageID int   not null,
	title varchar(50),
	name varchar(20)  ,
	content varchar(800),
	leaveDate  varchar(20) ,
  constraint PK_TBL_MESSAGE primary key (messageID)
);


-- 创建 回贴表: TBL_REVERT
create table TBL_REVERT
(
	revertID INT   not null,
	title varchar(50) ,
	name varchar(20) ,
	content varchar(800),
	writerDate  varchar(20) ,
	messageID int ,
  constraint PK_TBL_REVERT primary key (revertID)
);


insert into TBL_NEWS(newsID,title,writerDate,content)
values(1,'爱国者数码相机今日七折优惠','2000-9-26','说起索尼的w系列相机，
相信大家都不会感到陌生，其不错的功能表现外加时尚前卫的外形设计，
一度颇受消费者认可，今日，笔者从索尼专家处获悉，
其对w系低端机型w55推出1550元的促销价格，附送一张512M的记忆棒，颇为超值，
感兴趣的读者可以关注一下');
insert into TBL_NEWS(newsID,title,writerDate,content)
values(2,'爱国者数码相机今日七折优惠','2000-9-26','说起索尼的w系列相机，
相信大家都不会感到陌生，其不错的功能表现外加时尚前卫的外形设计，
一度颇受消费者认可，今日，笔者从索尼专家处获悉，
其对w系低端机型w55推出1550元的促销价格，附送一张512M的记忆棒，颇为超值，
感兴趣的读者可以关注一下');
insert into TBL_NEWS(newsID,title,writerDate,content)
values(3,'爱国者数码相机今日七折优惠','2000-9-26','说起索尼的w系列相机，
相信大家都不会感到陌生，其不错的功能表现外加时尚前卫的外形设计，
一度颇受消费者认可，今日，笔者从索尼专家处获悉，
其对w系低端机型w55推出1550元的促销价格，附送一张512M的记忆棒，颇为超值，
感兴趣的读者可以关注一下');
insert into TBL_NEWS(newsID,title,writerDate,content)
values(4,'爱国者数码相机今日七折优惠','2000-9-26','说起索尼的w系列相机，
相信大家都不会感到陌生，其不错的功能表现外加时尚前卫的外形设计，
一度颇受消费者认可，今日，笔者从索尼专家处获悉，
其对w系低端机型w55推出1550元的促销价格，附送一张512M的记忆棒，颇为超值，
感兴趣的读者可以关注一下');
insert into TBL_NEWS(newsID,title,writerDate,content)
values(5,'爱国者数码相机今日七折优惠','2000-9-26','说起索尼的w系列相机，
相信大家都不会感到陌生，其不错的功能表现外加时尚前卫的外形设计，
一度颇受消费者认可，今日，笔者从索尼专家处获悉，
其对w系低端机型w55推出1550元的促销价格，附送一张512M的记忆棒，颇为超值，
感兴趣的读者可以关注一下');


insert INTO TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(1,'v3','索爱手机','索爱',60,'5000.00','d_r11_10_r1_c22.jpg','索爱v3');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(2,'v1','数码相机','柯达',70,'8000.00','d_r11_10_r1_c16.jpg','柯达v1');
insert  INTO TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(3,'v2','摄像机','松下',80,'8000.00','d_r11_10_r1_c116.jpg','松下v2');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(4,'v3','笔记本','IBM',90,'8000.00','d_r11_10_r1_c1.jpg','IBMv3');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(5,'v4','手机','摩托罗拉',80,'8000.00','d_r11_10_r1_c221.jpg','摩托罗拉v4');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(6,'v5','手机','索爱',60,'5000.00','d_r11_10_r1_c22.jpg','索爱v3');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(7,'v6','相机','柯达',70,'8000.00','d_r11_10_r1_c8.jpg','柯达v1');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(8,'v7','松下摄像机','松下',80,'8000.00','d_r11_10_r1_c16.jpg','松下v2');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(9,'v8','松下笔记本','IBM',90,'8000.00','d_r11_10_r1_c2.jpg','IBMv3');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(10,'v9','手机','摩托罗拉',80,'8000.00','d_r11_10_r1_c22.jpg','摩托罗拉v4');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(11,'v6','相机','柯达',70,'8000.00','d_r11_10_r1_c22.jpg','柯达v1');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(12,'v7','松下摄像机','松下',80,'8000.00','d_r11_10_r1_c81.jpg','松下v2');
insert INTO  TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(13,'v8','松下笔记本','IBM',90,'8000.00','d_r11_10_r1_c1.jpg','IBMv3');
insert INTO TBL_PRODUCT(productID,serialNumber,name,brand,model,price,picture,description)
values(14,'v9','手机','摩托罗拉',80,'8000.00','d_r11_10_r1_c22.jpg','摩托罗拉v4');

insert into TBL_USER(userID,userName,password,status)values(1,'accpAdmin','456','0');
insert into TBL_USER(userID,userName,password,status)values(2,'000','456','0');
insert into TBL_USER(userID,userName,password,status)values(3,'跃马天涯','456','0');
insert into TBL_USER(userID,userName,password,status)values(4,'卡卡可乐','456','0');
insert into TBL_USER(userID,userName,password,status)values(5,'海阔天空','456','0');
insert into TBL_USER(userID,userName,password,status)values(6,'秋风落叶','456','0');
insert into TBL_USER(userID,userName,password,status)values(7,'叶子','456','0');
insert into TBL_USER(userID,userName,password,status)values(8,'tear..','456','0');
insert into TBL_USER(userID,userName,password,status)values(9,'不喜欢你','456','0');
insert into TBL_USER(userID,userName,password,status)values(10,'456-对牛弹吉他','456','0');
insert into TBL_USER(userID,userName,password,status)values(11,'mary','456','0');
insert into TBL_USER(userID,userName,password,status)values(12,'你,跑步过来！','789','0');

-- select (select TO_CHAR(SYSDATE, 'yyyy-mm-dd hh24:mi:ss') as a from dual);

insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(1,'按时大法师的发生的发生地方？','456','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(2,'阿斯蒂芬破？','456','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(3,'MP4价格是多少','456','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(4,'皮哦爱上对方','accp','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(5,'按时打发斯蒂芬','456','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(6,'MP4价格是多少','accp','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(7,'怕啥地方是打发斯蒂芬','456','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(8,'MP4价格是多少','不喜欢你','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(9,'了哦爱的方式打法二','456','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(10,'MP4价格是多少','小龙女','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(11,'二三等等地地道道','你，跑步过来!','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(12,'恩爱的发生地方是大方的','456','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(13,'价鹅鹅鹅鹅鹅鹅鹅鹅鹅饿格是多少','456','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(14,'鹅鹅鹅鹅鹅鹅饿','飞狐','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(15,'MP4价格是多少','郭靖','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(16,'品红服务宗旨是什么','对牛弹吉他','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(17,'华山论剑时什么时候','456','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(18,'价格是多少?','跃马天涯','阿里大方科技阿里斯顿','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(19,'安顺利地放开','tear..','阿斯利康到福建爱上对方','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(20,'MP4价格是多少','卡卡可乐','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(21,'品红服务宗旨是什么','米老鼠','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(22,'华山论剑时什么时候','秋分落叶','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(23,'价格是多少?','魄夜之星','阿里大方科技阿里斯顿','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(24,'安顺利地放开,太怒不了。。。','秋风落叶','阿斯利康到福建爱上对方','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(25,'品红服务宗旨是什么','你，跑步过来','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(26,'华山论剑时什么时候,都有谁知地道呀','对牛弹吉他','MP4价格是255元左右','2000-12-12');
insert into TBL_MESSAGE(messageID,title,name,content,leaveDate)values(27,'有谁知道Mp3价格是多少?','海阔天空','阿里大方科技阿里斯顿','2000-12-12');

insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(1,'价格是多少','789','估计有120元吧','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(2,'后台管理功能','789','估计有120元吧','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(3,'查看留言和回复留言','789','估计有120元吧','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(4,'最终效果是什么样的','789','估计有120元吧','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(5,'有户名和密码错误','789','估计有120元吧','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(6,'估计有120元吧','789','估计有120元吧','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(7,'楼上的你知道不','789','估计有120元吧','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(8,'还行吧','789','估计有120元吧','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(9,'估计有120元吧','789','估计有120元吧','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(10,'5月1日','789','5月1日','2000-12-12',1);
insert into TBL_REVERT(revertID,title,name,content,writerDate,messageID)values(11,'不知道','789','不知道','2000-12-12',1);


select * from TBL_NEWS;
select * from TBL_PRODUCT;
select * from TBL_USER;
select * from TBL_MESSAGE;
select * from TBL_REVERT ;