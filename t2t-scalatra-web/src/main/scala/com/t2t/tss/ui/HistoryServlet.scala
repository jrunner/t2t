package com.t2t.tss.ui

import com.t2t.tss.dao.HistoryDao
import com.t2t.tss.entity.History
import com.t2t.tss.util.PageUtil
import org.scalatra.ScalatraServlet

/**
 * Created by ypf on 2015/5/27.
 */
class HistoryServlet extends ScalatraServlet {

  val dao = new HistoryDao

  post("/maxLevel") {
    val level = dao.maxLevel()
    val map = new java.util.HashMap[String, AnyRef]
    map.put("level", level + "")
    map.put("info", "maxLevel")
    PageUtil.WriteReponseJson(response, map)
  }
  post("/timeline") {
    val map = new java.util.HashMap[String, AnyRef]
    try {
      val result = dao.timeline(request.getParameter("keyword"))
      map.put("list", result.toArray)
    } catch {
      case e: Exception => print(map)(e)
    }
    PageUtil.WriteReponseJson(response, map)
  }

  post("/list") {
    val map = new java.util.HashMap[String, AnyRef]
    try {
      val param = new java.util.HashMap[String, AnyRef]
      val list = dao.query(param)
      map.put("data", list.toArray)
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

  post("/del") {
    val ids = request.getParameter("ids")
    dao.del(ids)

    val map = new java.util.HashMap[String, AnyRef]
    map.put("info", "del")
    map.put("msg", "删除成功")
    PageUtil.WriteReponseJson(response, map)
  }

  post("/add") {
    val map = new java.util.HashMap[String, AnyRef]
    try {
      val yymmdd = request.getParameter("yymmdd")
      val yy = if (yymmdd.length >= 4) yymmdd.substring(0, 4) else ""
      val mm = if (yymmdd.length >= 6) yymmdd.substring(4, 6) else ""
      val dd = if (yymmdd.length >= 8) yymmdd.substring(6, 8) else ""
      val bean = new History(Integer.parseInt(request.getParameter("id")), request.getParameter("key"), request.getParameter("message"), request.getParameter("note"), yy,
        mm, dd, request.getParameter("kind"), request.getParameter("order").toInt)
      dao.saveOrUpdate(bean)
      map.put("info", "1")
    } catch {
      case e: Exception => print(map)(e)
    }
    PageUtil.WriteReponseJson(response, map)
  }

  post("/view") {
    val id = request.getParameter("id")
    val ID = if (id == "") 0 else id.toInt
    val bean = dao.get(ID)
    val map = new java.util.HashMap[String, AnyRef]
    map.put("info", "view")
    map.put("msg", bean)
    PageUtil.WriteReponseJson(response, map)
  }

}
