package com.t2t.tss.entity

class News {
  private var newsID: Int = 0
  private var title: String = null
  private var content: String = null
  private var writerDate: String = null

  def getNewsID: Int = {
    return newsID
  }

  def setNewsID(newsID: Int) {
    this.newsID = newsID
  }

  def getTitle: String = {
    return title
  }

  def setTitle(title: String) {
    this.title = title
  }

  def getContent: String = {
    return content
  }

  def setContent(content: String) {
    this.content = content
  }

  def getWriterDate: String = {
    return writerDate
  }

  def setWriterDate(writerDate: String) {
    this.writerDate = writerDate
  }
}
