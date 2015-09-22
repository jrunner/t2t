1. 简单的C/S程序，基于2.10.x
2. 在window下，通过mvn创建工程
3. 通过mvn package打包
4. 20150604(周四)，工程统一命名为t2t-xxx-xxx.

--MySql表
CREATE TABLE `TBL_USER` (
    `ID`  int NULL AUTO_INCREMENT ,
    `USER`  varchar(255) NULL ,
    `PASSWORD`  varchar(255) NULL ,
    PRIMARY KEY (`ID`)
);

java -classpath C:\DTools\SDK\scala-2.10.4\lib\scala-compiler.jar;RegisterApp
java -classpath C:\DTools\SDK\scala-2.10.4\lib\scala-compiler.jar;

编译，执行

D:\codes\idea-mvn-spark\scala-desktop-mvn\target>scala -cp scala-desktop-mvn-0.0.1-SNAPSHOT.jar  com.t2t.top.app.RegisterApp
D:\codes\idea-mvn-spark\scala-desktop-mvn\target>java -cp scala-desktop-mvn-0.0.1-SNAPSHOT\lib\scala-desktop-mvn-0.0.1-SNAPSHOT.jar  com.t2t.top.app.RegisterApp

