package com.t2t.tss.listener

import javax.servlet.ServletContext

import com.t2t.tss.ui._
import org.scalatra._

class ScalatraBootstrap extends LifeCycle {

  override def init(context: ServletContext) {
    context.mount(new UserServlet, "/UserServlet")
    context.mount(new MainServlet, "/MainServlet")
    context.mount(new HistoryServlet, "/HistoryServlet")
    context.mount(new WelcomeServlet, "/WelcomeServlet")
    context.mount(new RecruitServlet, "/RecruitServlet")
  }

  override def destroy(context: ServletContext) {
  }
}
