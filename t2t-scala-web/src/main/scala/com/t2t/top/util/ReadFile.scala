package com.t2t.top.util

import java.io.{File, FileInputStream}
import java.util.PropertyResourceBundle

/**
 * Created by Administrator on 2015/5/21.
 */
object ReadFile {

  def getDB(): (String, String, String, String) = {
    val file = new File(ReadFile.getClass.getResource("/").getPath + "/jdbc.properties")
    val is = new FileInputStream(file);
    val read = new PropertyResourceBundle(is);
    val db = (read.getString("mysql.driverClassName")
      , read.getString("mysql.url")
      , read.getString("mysql.username")
      , read.getString("mysql.password"))
    is.close()
    db
  }


}