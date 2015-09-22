package com.t2t.tss.ui

import com.google.gson.Gson
import com.t2t.tss.dao.NewsDao
import com.t2t.tss.util.PageUtil
import org.scalatra.ScalatraServlet

/**
 * Created by ypf on 2015/5/27.
 */
class MainServlet extends ScalatraServlet {

  post("/top7news") {
    val dao = new NewsDao
    val map = new java.util.HashMap[String, AnyRef]

    try{
      val list = dao.top7news()
      map.put("list", list.toArray)
      map.put("info", "top7news")
    }catch {
      case e: Exception => {
        e.printStackTrace
        map.put("info", "0")
        map.put("msg", e.getMessage)
      }
    }
    PageUtil.WriteReponseJson(response, map)
  }

  post("/list") {
    val dao = new NewsDao
    val map = new java.util.HashMap[String, AnyRef]

    try{
      val list = dao.top7news()
      map.put("list", list.toArray)
      map.put("info", "list")
    }catch {
      case e: Exception => {
        e.printStackTrace
        map.put("info", "0")
        map.put("msg", e.getMessage)
      }
    }
    PageUtil.WriteReponseJson(response, map)
  }
}
