package com.t2t.top.web

import javax.servlet.http.{HttpServlet, HttpServletRequest, HttpServletResponse}

import scala.xml.{NodeSeq, PrettyPrinter}
;

/**
 * Created by ypf on 2015/5/14.
 */
class ScalaTestServlet extends HttpServlet {

  override def doGet(request: HttpServletRequest, response: HttpServletResponse) {

    response.setContentType("text/html")
    response.setCharacterEncoding("UTF-8")

    val responseBody: NodeSeq =
      <html>
        <body>
          <h1>ScalaTestServlet Test!</h1>
        </body>
      </html>

    val printer = new PrettyPrinter(80, 2)

    response.getWriter.write(printer.formatNodes(responseBody))
  }

  override def doPost(req: HttpServletRequest, resp: HttpServletResponse): Unit = doGet(req, resp)
}
