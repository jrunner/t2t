package com.t2t.tss.listener

import java.util.{ArrayList, List}
import javax.servlet.http.{HttpSessionBindingEvent, HttpSessionBindingListener}

/**
 * Created by ypf on 2015/6/2.
 */
class LoginBindingEvent extends HttpSessionBindingListener {
  override def valueBound(event: HttpSessionBindingEvent): Unit = ???

  override def valueUnbound(event: HttpSessionBindingEvent): Unit = ???
}
