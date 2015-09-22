package com.t2t.tss.ui

import org.scalatra.RouteTransformer

/**
 * Created by Administrator on 2015/5/31.
 */
class Test {
  def post(op: String*)(action: => Any): Unit = {}
}


class SubTest extends Test {
  post("op"){

  }
}
