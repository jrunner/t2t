package com.t2t.tss.ui

import org.scalatra.ScalatraServlet

/**
 * Created by ypf on 2015/5/27.
 */
class UserServlet extends ScalatraServlet {
  get("/guess/*") {
    "You missed!"
  }
}
