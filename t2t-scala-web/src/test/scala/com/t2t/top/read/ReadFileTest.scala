package com.t2t.top.read

import java.io.{InputStream, BufferedInputStream, FileInputStream, File}
import java.util.PropertyResourceBundle

import scala.io.Source

/**
 * Created by Administrator on 2015/5/21.
 */
object ReadFileTest {

  def main(args: Array[String]) {
    val file = new File(ReadFileTest.getClass.getResource("/").getPath + "/jdbc.properties")
    println(file.getAbsolutePath)
    val lines = Source.fromFile(file.getAbsolutePath).getLines()
    lines.foreach(println)
    println("==============")
    val is = new FileInputStream(file);
    val read = new PropertyResourceBundle(is);
    println(read.getString("mysql.driverClassName"))
    println(read.getString("mysql.url"))
    println(read.getString("mysql.username"))
    println(read.getString("mysql.password"))
    is.close()
  }

}