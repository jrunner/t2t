package com.t2t.tss.dao

import com.t2t.tss.entity.Message
import com.t2t.tss.util.DBHelper

import scala.collection.mutable.ArrayBuffer

/**
 * Created by ypf on 2015/5/28.
 */
class MessageDao extends BaseDao {
  import com.t2t.tss.dao.BaseDaoContext._

  def findAllMessage: ArrayBuffer[Message] = {
    val sql = "select * from Message"
    DBHelper.executeQuery(sql)
  }

  def addMessage(title: String, content: String, name: String, time: String): Int = {
    val sql = "insert into Message values(?,?,?,?,0)"
    DBHelper.executeUpdate(sql, title, content, name, time)
  }

  def find(id: String): Message = {
    val sql = "select * from Message where messageID = ? "
    DBHelper.executeQuery(sql, id)
  }
}
