package com.t2t.tss.dao

import com.t2t.tss.entity.News
import com.t2t.tss.util.DBHelper

import scala.collection.mutable.ArrayBuffer

/**
 * Created by ypf on 2015/5/28.
 */
class NewsDao extends BaseDao {

  import com.t2t.tss.dao.BaseDaoContext._

  /**
   * 查询news表的方法
   */
  def top7news(): ArrayBuffer[News] = {
    val sql = "SELECT * FROM TBL_NEWS ORDER BY WRITERDATE DESC limit 7"
    DBHelper.executeQuery(sql)
  }

  /**
   * 根据新闻ID查询相关新闻内容
   */
  def findNewsByID(id: String): News = {
    val sql = "SELECT * FROM NEWS WHERE NEWSID = ? "
    DBHelper.executeQuery(sql, id)
  }

  /**
   * 分页查询
   */
  def fenyeList(p: Int): ArrayBuffer[News] = {
    var counts: Int = 1
    if (p > 1) {
      counts = 10 * (p - 1)
    }
    val sql = "select * from news where newsID not in(select top " + counts + " newsID  from news order by writerDate desc)order by writerDate desc " +
      " limit 10"
    DBHelper.executeQuery(sql)
  }

  /**
   * 添加新闻信息
   *
   * @param news
	 * 封装了信息的新闻对象
   * @return 执行SQL语句所影响数据库的行数
   */
  def insert(news: News): Int = {
    val sql: String = "insert into news(title,[content])values(?,?)"
    DBHelper.executeUpdate(sql, news.getTitle, news.getContent)
  }

  /**
   * 删除新闻信息
   */
  def delete(id: Int): Int = {
    val sql: String = "delete from news where newsID = ?"
    DBHelper.executeUpdate(sql, id + "")
  }

}

