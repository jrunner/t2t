package com.t2t.tss.ui

import com.google.gson.Gson
import com.t2t.tss.util.PageUtil
import org.scalatra.ScalatraServlet

/**
 * Created by ypf on 2015/5/27.
 */
class WelcomeServlet extends ScalatraServlet {

  get("/click") {
    //response.sendRedirect(request.getContextPath + "/jsp/menu.jsp")

    if (this.getServletContext.getAttribute("CLICK_COUNT") == null) {
      this.getServletContext.setAttribute("CLICK_COUNT", 1)
    }

    val map = new java.util.HashMap[String, AnyRef]
    map.put("info", "click")
    map.put("count", this.getServletContext.getAttribute("CLICK_COUNT") + "")
    PageUtil.WriteReponseJson(response, map)

  }

  get("/menu") {
    if (this.getServletContext.getAttribute("CLICK_COUNT") == null) {
      this.getServletContext.setAttribute("CLICK_COUNT", 1)
    }

    val count = this.getServletContext.getAttribute("CLICK_COUNT").toString.toInt + 1
    this.getServletContext.setAttribute("CLICK_COUNT", count)

    response.sendRedirect(request.getContextPath + "/jsp/menu.jsp")
  }

}
