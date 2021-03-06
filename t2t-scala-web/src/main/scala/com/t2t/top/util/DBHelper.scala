package com.t2t.top.util

import java.sql.{Connection, DriverManager, ResultSet}
import javax.sql.RowSet

import com.sun.rowset.CachedRowSetImpl

/**
 * ypf
 * 2015/05/05
 */
object DBHelper {

  /**
   * 执行sql
   * @param sql
   * @return 受影响的行数
   */
  def executeUpdate(sql: String): Int = {
    val conn = getConnection()
    try {
      val statement = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE)
      val prep = conn.prepareStatement(sql)
      return prep.executeUpdate()
    } catch {
      case e: Exception => e.printStackTrace
    } finally {
      conn.close
    }
    0
  }

  /**
   * 查询
   * @param sql
   * @return RowSet
   */
  def executeQuery(sql: String): RowSet = {
    val conn = getConnection()
    try {
      val statement = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE)
      val rs = statement.executeQuery(sql)
      return populate(rs)
    } catch {
      case e: Exception => e.printStackTrace
    } finally {
      conn.close
    }
    return null
  }

  def getConnection(): Connection = {
    val db = ReadFile.getDB()
    Class.forName(db._1)
    DriverManager.getConnection(db._2, db._3, db._4)
  }

  def populate(rs: ResultSet): RowSet = {
    val crs = new CachedRowSetImpl();
    crs.populate(rs);
    return crs;
  }

}








