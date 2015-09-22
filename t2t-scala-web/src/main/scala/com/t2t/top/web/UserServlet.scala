package com.t2t.top.web

import java.io.IOException
import javax.servlet.http.{HttpServlet, HttpServletRequest, HttpServletResponse}

import com.google.gson.Gson
import com.t2t.top.util.UserService

import scala.collection.mutable.ArrayBuffer
;

/**
 * 用户控制类
 */
class UserServlet extends HttpServlet {
  val userService = new UserService()

  override def doGet(request: HttpServletRequest, response: HttpServletResponse) {
    response.setContentType("text/html")
    response.setCharacterEncoding("UTF-8")

    val cmd: String = request.getParameter("cmd")

    cmd match {
      case "list" => list(request, response)
      case "del" => del(request, response)
      case "update" => update(request, response)
      case "view" => view(request, response)
      case _ => println("error")
    }
  }

  override def doPost(request: HttpServletRequest, response: HttpServletResponse): Unit = doGet(request, response)

  def del(request: HttpServletRequest, response: HttpServletResponse): Unit = {
    val ids = request.getParameter("ids")
    userService.del(ids)

    val map = new java.util.HashMap[String, AnyRef]
    map.put("info", request.getParameter("cmd"))
    map.put("msg", "删除成功")
    PageUtil.WriteReponseJson(response, map)
  }

  def update(request: HttpServletRequest, response: HttpServletResponse): Unit = {
    val id = request.getParameter("id")
    val ID = if (id == "" || id == null) 0 else id.toInt
    val bean = new UserBean(ID, request.getParameter("username"), request.getParameter("password"))

    val map = new java.util.HashMap[String, AnyRef]
    map.put("info", request.getParameter("cmd"))

    if (userService.exists(bean.username, bean.id)) {
      map.put("msg", "用户名已存在!")
    } else {
      userService.update(bean)
      map.put("msg", "操作成功!")
    }
    PageUtil.WriteReponseJson(response, map)
  }

  def view(request: HttpServletRequest, response: HttpServletResponse): Unit = {
    val id = request.getParameter("id")
    val ID = if (id == "") 0 else id.toInt
    val bean = userService.get(ID)
    val map = new java.util.HashMap[String, AnyRef]
    map.put("info", request.getParameter("cmd"))
    map.put("msg", bean)
    PageUtil.WriteReponseJson(response, map)
  }

  def list(request: HttpServletRequest, response: HttpServletResponse): Unit = {
    var info = ""
    try {
      val bean = new UserBean(1, "杨鹏飞", "yangpf")
      val map = new java.util.HashMap[String, AnyRef]
      map.put("data", userService.query(bean).toArray)
      info = new Gson().toJson(map)
      println(info)
    } catch {
      case e: IOException => {
        e.printStackTrace()
        info = e.getMessage
      }
    }
    PageUtil.WriteReponseText(response, info)
  }

}

case class UserBean(id: Int, username: String, password: String)

object PageUtil {

  def main(args: Array[String]) {
    val arr = ArrayBuffer[UserBean]()
    arr += new UserBean(1, "杨鹏飞", "yangpf")
    arr += new UserBean(2, "小王", "xiaow")
    arr += new UserBean(3, "张娜拉", "zhangnl")
    arr += new UserBean(4, "成龙", "chengl")
    val map = new java.util.HashMap[String, AnyRef]
    map.put("data", arr.toArray)

    val info = new Gson().toJson(map)
    println(info)
  }

  def WriteReponseJson(response: HttpServletResponse, data: AnyRef) {
    val info = new Gson().toJson(data)
    response.reset();
    response.setContentType("text/json; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    try {
      response.getWriter().write(info);
      response.getWriter().flush();
    } catch {
      case e: IOException => {
        e.printStackTrace
      }
    }
  }

  /**
   * 客户端输出文本
   */
  def WriteReponseText(response: HttpServletResponse, info: String) {
    response.reset
    response.setContentType("text/html;charset=UTF-8")
    response.setHeader("Cache-Control", "no-cache")
    try {
      response.getWriter.write(info)
      response.getWriter.flush
    } catch {
      case e: IOException => {
        e.printStackTrace
      }
    }
  }

  /**
   * 客户端输出xml
   */
  def WriteReponseXML(response: HttpServletResponse, info: String, msg: String, strings: String*) {
    response.reset
    response.setContentType("text/xml;charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    var xml = "<?xml version = \"1.0\" encoding=\"UTF-8\"?>";
    xml += "<response>";
    xml += "<info>" + info + "</info>";
    xml += "<msg>" + msg + "</msg>";
    if (strings.length > 0)
      xml += strings(0);
    xml += "</response>";
    try {
      response.getWriter().write(xml);
      response.getWriter().flush();
    } catch {
      case e: Exception => {
        e.printStackTrace
      }
    }
  }

  def toConvert(element: String, msg: String): String = {
    if (msg == null || element == null)
      return ""

    "<" + element + ">" + msg.toString().trim() + "</" + element + ">";
  }

}

