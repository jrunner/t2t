package com.t2t.tss.dao

import com.google.gson.Gson
import com.t2t.tss.entity.History
import com.t2t.tss.util.DBHelper

import scala.collection.mutable.ArrayBuffer

/**
 * Created by ypf on 2015/5/28.
 */
object Test {
  def main(args: Array[String]) {
    val dao = new HistoryDao
    val result = dao.timeline("Spark")
    result.foreach(op => {
      println(op._1 + "=>" + op._2)
    })
    val info = new Gson().toJson(result)
    println(info)
  }
}

class HistoryDao extends BaseDao {

  import com.t2t.tss.dao.BaseDaoContext._

  def isNull(op: AnyRef) = {
    (op == null || op.toString.trim.length == 0)
  }

  def maxLevel(): Int = {
    var sql = "SELECT MAX(LEVEL) LEVEL  FROM TOP_HISTORY WHERE LEVEL IS NOT NULL"
    val rs = DBHelper.executeQuery(sql)

    var level = 0
    if (rs.next()) {
      level = rs.getInt("level")
    }
    level + 1
  }

  //时间轴
  def timeline(key: String): ArrayBuffer[(String, Array[History])] = {
    var sql = "SELECT YY from TOP_HISTORY where KEYWORD = '{0}' group by YY desc".replace("{0}", key)
    val result = new ArrayBuffer[(String, Array[History])]

    val rs = DBHelper.executeQuery(sql)
    while (rs.next()) {
      val yy = rs.getString("yy")
      var sql2 = " SELECT * from TOP_HISTORY where KEYWORD = '{0}' and YY = '{1}' ORDER BY YY,MM,DD desc ".replace("{0}", key).replace("{1}", yy)
      val list: ArrayBuffer[History] = DBHelper.executeQuery(sql2)
      result += ((yy, list.toArray))
    }
    result
  }


  /**
   * 查找信息
   */
  def query(param: java.util.HashMap[String, AnyRef]): ArrayBuffer[History] = {
    var sql = "select * from TOP_HISTORY where 1=1 "
    if (!isNull(param.get("keyword"))) {
      sql += " and KEYWORD like '%{0}%' ".replace("{0}", param.get("keyword") + "")
    }
    sql += " order by yy+0  desc";
    DBHelper.executeQuery(sql)
  }

  def get(id: Int): History = {
    val sql = "select * from TOP_HISTORY where id = ? "
    DBHelper.executeQuery(sql, id + "")
  }


  /**
   * 注册用户
   * @param bean
   * @return Int
   */
  def saveOrUpdate(bean: History): Int = {
    if (bean.id == 0) {
      val sql = "INSERT INTO TOP_HISTORY(KEYWORD,MESSAGE,NOTE,YY,MM,DD,KIND,LEVEL) values (?,?,?,?,?,?,?,?)"
      return DBHelper.executeUpdate(sql, bean.key, bean.message, bean.note, bean.yy, bean.mm, bean.dd, bean.kind, bean.order + "")
    }
    //val b = get(bean.id)
    val sql = "UPDATE TOP_HISTORY set KEYWORD=?, MESSAGE=?, NOTE=? ,YY=?,MM=? ,DD=?,KIND=?,LEVEL=? where ID=?"
    DBHelper.executeUpdate(sql, bean.key, bean.message, bean.note, bean.yy, bean.mm, bean.dd, bean.kind, bean.order + "", bean.id + "")
  }

  /**
   * 删除操作
   * @param ids
   * @return 受影响行数
   */
  def del(ids: String): Int = {
    var count = 0
    ids.split(",").foreach(op => {
      val sql = "DELETE FROM TOP_HISTORY WHERE ID = " + op
      count = count + DBHelper.executeUpdate(sql)
    })
    count
  }
}

