t2t-scala-web
1. 简单的B/S程序，基于2.10.x
2. 在window下，通过mvn创建工程
3. 通过mvn package打包

--MySql表
CREATE TABLE `TBL_USER` (
    `ID`  int NULL AUTO_INCREMENT ,
    `USER`  varchar(255) NULL ,
    `PASSWORD`  varchar(255) NULL ,
    PRIMARY KEY (`ID`)
);

1. 20150514(周四)，创建mvn工程.
2. 20150516(周六)，添加maven-scala-plugin插件，首个hello scala web完成.
3. 20150521(周四)，CRUD功能基本完成.
4. 20150521(周四)，加入jdbc.properties，并可以发布到百度云上.
5. 20150604(周四)，工程统一命名为t2t-xxx-xxx.