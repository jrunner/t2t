package com.t2t.tss.entity

;

class Revert {

  private var revertID: Int = 0
  private var messageID: Int = 0
  private var content: String = null
  private var writer: String = null
  private var writerDate: String = null

  def getRevertID: Int = {
    return revertID
  }

  def setRevertID(revertID: Int) {
    this.revertID = revertID
  }

  def getMessageID: Int = {
    return messageID
  }

  def setMessageID(messageID: Int) {
    this.messageID = messageID
  }

  def getContent: String = {
    return content
  }

  def setContent(content: String) {
    this.content = content
  }

  def getWriter: String = {
    return writer
  }

  def setWriter(writer: String) {
    this.writer = writer
  }

  def getWriterDate: String = {
    return writerDate
  }

  def setWriterDate(writerDate: String) {
    this.writerDate = writerDate
  }


}