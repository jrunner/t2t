package com.t2t.tss.entity

class Message {

  private var messageID: Int = 0
  private var title: String = null
  private var content: String = null
  private var writer: String = null
  private var writeDate: String = null
  private var count: Int = 0

  def getContent: String = {
    return content
  }

  def setContent(content: String) {
    this.content = content
  }

  def getCount: Int = {
    return count
  }

  def setCount(count: Int) {
    this.count = count
  }

  def getMessageID: Int = {
    return messageID
  }

  def setMessageID(messageID: Int) {
    this.messageID = messageID
  }

  def getTitle: String = {
    return title
  }

  def setTitle(title: String) {
    this.title = title
  }

  def getWriteDate: String = {
    return writeDate
  }

  def setWriteDate(writeDate: String) {
    this.writeDate = writeDate
  }

  def getWriter: String = {
    return writer
  }

  def setWriter(writer: String) {
    this.writer = writer
  }
}
