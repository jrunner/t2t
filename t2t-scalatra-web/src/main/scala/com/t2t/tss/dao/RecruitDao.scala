package com.t2t.tss.dao

import java.util

import com.google.gson.Gson
import com.t2t.tss.entity.{Revert, History}
import com.t2t.tss.util.DBHelper

import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

/**
 * Created by ypf on 2015/5/28.
 */
object TestT {
  def main(args: Array[String]) {
    val dao = new RecruitDao
    val result = dao.show()
    val info = new Gson().toJson(result)
    println(info)
  }
}

class RecruitDao extends BaseDao {

  import com.t2t.tss.dao.BaseDaoContext._

  def show(): java.util.HashMap[String, AnyRef] = {
    var sql = "SELECT DATE_FORMAT(CREATETIME,'%m.%d') label ,AVG(num) num,KEYWORD from T2T_STAT_RECRUIT  group by KEYWORD,DATE_FORMAT(CREATETIME,'%Y%m%d')"
    val rs = DBHelper.executeQuery(sql)

    var list = new ArrayBuffer[(String, Int, String)]
    while (rs.next) {
      val op = (rs.getString("label"), rs.getDouble("num").toInt, rs.getString("keyword"))
      list += op
    }

    val types = mutable.Set.empty[String]
    val data = new ArrayBuffer[String]
    list.foreach(op => {
      types += op._3
    })

    val series = new ArrayBuffer[Any]
    var categories = new ArrayBuffer[String]

    types.foreach(t => {
      categories = new ArrayBuffer[String]
      val n = new ArrayBuffer[Int]
      list.foreach(op => {
        if (op._3 == t) {
          categories += op._1;
          n += op._2
        }
      })

      val item = new java.util.HashMap[String, Any]
      item.put("data", n.toArray)
      item.put("name", t)
      series += item
    })

    val map = new java.util.HashMap[String, AnyRef]
    map.put("series", series.toArray)
    map.put("categories", categories.toArray)
    map
  }


}

