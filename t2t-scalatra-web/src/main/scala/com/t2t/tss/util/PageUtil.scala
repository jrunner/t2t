package com.t2t.tss.util

import java.io.IOException
import javax.servlet.http.HttpServletResponse

import com.google.gson.Gson

/**
 * Created by Administrator on 2015/5/30.
 */
object PageUtil {

  def WriteReponseJson(response: HttpServletResponse, data: AnyRef) {
    val info = new Gson().toJson(data)
    println(info)
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

