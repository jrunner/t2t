package com.t2t.top.app.example

/**
 * Created by ypf on 2015/3/23.
 */

import scala.swing._

object FirstSwingApp extends SimpleSwingApplication {

  override def top = new MainFrame {
    title = "First Swing App"
    contents = new Button {
      text = "Click me"
    }
  }

}