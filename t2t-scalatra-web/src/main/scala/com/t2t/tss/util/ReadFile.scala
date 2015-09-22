package com.t2t.tss.util

import java.io.{File, FileInputStream}
import java.util.PropertyResourceBundle

/**
 * Created by Administrator on 2015/5/21.
 */
object ReadFile {

  def getDB(): (String, String, String, String) = {
    val file = new File(ReadFile.getClass.getResource("/").getPath + "/t2t-jdbc.properties")
    val is = new FileInputStream(file);
    val read = new PropertyResourceBundle(is);
    val db = (read.getString("mysql.driverClassName")
      , read.getString("mysql.url")
      , read.getString("mysql.username")
      , read.getString("mysql.password"))
    is.close()
    db
  }

  def getCron(): String = {
    val file = new File(ReadFile.getClass.getResource("/").getPath + "/t2t-quartz.properties")
    val is = new FileInputStream(file);
    val read = new PropertyResourceBundle(is);
    val cron = read.getString("cron")
    is.close()
    cron
  }

}