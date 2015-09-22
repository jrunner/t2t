package com.t2t.tss.ui

import java.util.{Random, Date}

import com.t2t.tss.dao.{RecruitDao, HistoryDao}
import com.t2t.tss.entity.Product
import com.t2t.tss.job.FetchRecruit
import com.t2t.tss.util.PageUtil
import org.scalatra.ScalatraServlet

import scala.collection.mutable.ArrayBuffer

/**
 * Created by ypf on 2015/5/27.
 */
class RecruitServlet extends ScalatraServlet {

  val dao = new RecruitDao

  get("/show") {
    val map = new java.util.HashMap[String, AnyRef]
    try {
      val result = dao.show()
      map.putAll(result)
      map.put("info", "1")
    } catch {
      case e: Exception => print(map)(e)
    }
    PageUtil.WriteReponseJson(response, map)
  }

  def print(map: java.util.HashMap[String, AnyRef])(e: Exception): Unit = {
    e.printStackTrace
    map.put("info", "0")
    map.put("msg", e.getMessage)
  }

  get("/fetch") {

    val map = new java.util.HashMap[String, AnyRef]
    map.put("info", "1")

    var list = new ArrayBuffer[Item]

    val keys = request.getParameter("keys")

    val d = new java.util.Date()
    keys.split(",").foreach(op => {
      val r = FetchRecruit.get(op)
      r.createtime = d
      list += new Item(r.createtime.getTime, r.num)
    })

    map.put("items", list.toArray)

    PageUtil.WriteReponseJson(response, map)

  }

  case class Item(x: Long, y: Int)

}
