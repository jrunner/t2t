package com.t2t.top.app

import scala.swing.Dialog.Message
import scala.swing._
import scala.swing.event.{EditDone, ButtonClicked}

/**
 * 注册
 */
object RegisterApp extends SimpleSwingApplication {
  val btnSubmit = new Button("提交")
  val btnClear = new Button("清空")
  val txtUser = new TextField("", 25)
  val txtPassword = new TextField("", 25)
  val lblUser = new Label("用户名：")
  val lblPassword = new Label("密码：")

  val mainPanel = new FlowPanel {
    contents += lblUser
    contents += txtUser
    contents += lblPassword
    contents += txtPassword
    contents += btnSubmit
    contents += btnClear
    border = Swing.EmptyBorder(50, 50, 50, 80)
  }

  def top = new MainFrame {
    title = "RegisterApp"
    contents = mainPanel
    listenTo(btnSubmit, btnClear)
    reactions += {
      //提交操作
      case ButtonClicked(`btnSubmit`) => insert
      // 关闭操作
      case ButtonClicked(`btnClear`) => clear
    }
  }

  /**
   * 添加数据
   */
  def insert() {
    import Dialog._
    if (txtUser.text.trim.length == 0) {
      showMessage(mainPanel, "用户名不允许为空!")
      txtUser.requestFocus
      return
    }

    if (txtPassword.text.trim.length == 0) {
      showMessage(mainPanel, "密码不允许为空!")
      txtPassword.requestFocus
      return
    }

    val countSql = "select count(*) num from TBL_USER where user='{0}'".replace("{0}", txtUser.text)
    val r = DBHelper.executeQuery(countSql)
    r.next()
    if (r.getInt(1) > 0) {
      showMessage(mainPanel, "用户名已存在，添加失败!")
      return
    }
    val sql = "insert into TBL_USER (user,password) values ('{0}','{1}')".replace("{0}", txtUser.text).replace("{1}", txtPassword.text)
    val result = DBHelper.executeUpdate(sql)
    if (result > 0) {
      println("添加成功!")
      showMessage(mainPanel, "添加成功!")
    } else {
      println("添加失败!")
      showMessage(mainPanel, "添加失败!")
    }

    clear
  }

  /**
   * 清空文本框
   */
  def clear() {
    txtUser.text = ""
    txtPassword.text = ""
  }
}