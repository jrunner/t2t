package com.t2t.tss.dao

import javax.sql.RowSet

import com.t2t.tss.entity._

import scala.collection.mutable.ArrayBuffer

/**
 * Created by ypf on 2015/5/28.
 */
class BaseDao {


}

object BaseDaoContext {
  implicit def toRevert(rs: RowSet): Revert = {
    val list = toReverts(rs)
    if (list.size > 0) list(0) else null
  }

  implicit def toProdoct(rs: RowSet): Product = {
    val list = toProdocts(rs)
    if (list.size > 0) list(0) else null
  }

  implicit def toNew(rs: RowSet): News = {
    val list = toNews(rs)
    if (list.size > 0) list(0) else null
  }

  implicit def toMessage(rs: RowSet): Message = {
    val list = toMessages(rs)
    if (list.size > 0) list(0) else null
  }

  implicit def toUser(rs: RowSet): User = {
    val list = toUsers(rs)
    if (list.size > 0) list(0) else null
  }

  implicit def toReverts(rs: RowSet): ArrayBuffer[Revert] = {
    var list = new ArrayBuffer[Revert]
    while (rs.next) {
      val revert: Revert = new Revert
      revert.setContent(rs.getString("content"))
      revert.setMessageID(rs.getInt("messageID"))
      revert.setRevertID(rs.getInt("revertID"))
      revert.setWriter(rs.getString("writer"))
      revert.setWriterDate(rs.getString("writerDate"))
      list += revert
    }
    list
  }

  implicit def toNews(rs: RowSet): ArrayBuffer[News] = {
    var list = new ArrayBuffer[News]
    while (rs.next) {
      val news: News = new News
      news.setNewsID(rs.getInt("newsID"))
      news.setTitle(rs.getString("title"))
      news.setContent(rs.getString("content"))
      news.setWriterDate(rs.getString("writerDate"))
      list += news
    }
    list
  }

  implicit def toMessages(rs: RowSet): ArrayBuffer[Message] = {
    var list = new ArrayBuffer[Message]
    while (rs.next) {
      val message = new Message
      message.setTitle(rs.getString("title"))
      message.setMessageID(rs.getInt("messageID"))
      message.setWriter(rs.getString("writer"))
      message.setWriteDate(rs.getString("writerDate"))
      message.setCount(rs.getInt(5))
      list += message
    }
    list
  }

  implicit def toProdocts(rs: RowSet): ArrayBuffer[Product] = {
    var list = new ArrayBuffer[Product]
    while (rs.next) {
      val product = new Product
      product.setProductID(rs.getString("ProductID"))
      product.setSerialNumber(rs.getString("SerialNumber"))
      product.setName(rs.getString("name"))
      product.setBrand(rs.getString("Brand"))
      product.setModel(rs.getString("Model"))
      product.setPrice(rs.getDouble("price"))
      product.setPicture(rs.getString("Picture"))
      product.setDescription(rs.getString("Description"))
      product
    }
    list
  }

  implicit def toUsers(rs: RowSet): ArrayBuffer[User] = {
    var list = new ArrayBuffer[User]
    while (rs.next) {
      val user = new User
      user.setUserName(rs.getString("userName"))
      user.setUserID(rs.getInt("userID"))
      user.setPassword(rs.getString("password"))
      user.setStatus(rs.getInt("status"))
      list += user
    }
    return list
  }


  implicit def toHistory(rs: RowSet): History = {
    val list = toHistorys(rs)
    if (list.size > 0) list(0) else null
  }

  implicit def toHistorys(rs: RowSet): ArrayBuffer[History] = {

    var list = new ArrayBuffer[History]
    while (rs.next) {
      val bean = new History(rs.getInt("ID"),
        getString(rs.getString("KEYWORD")), getString(rs.getString("MESSAGE")), getString(rs.getString("NOTE")),
        getString(rs.getString("YY")), getString(rs.getString("MM")), getString(rs.getString("DD")),
        getString(rs.getString("KIND")), rs.getInt("LEVEL"))
      list += bean
    }
    return list
  }

  def getString(value: String): String = {
    if (value == null) "" else value
  }
}

