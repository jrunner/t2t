package com.t2t.tss.dao

import com.t2t.tss.entity.Revert
import com.t2t.tss.util.DBHelper

import scala.collection.mutable.ArrayBuffer


/**
 * Created by Administrator on 2015/5/28.
 */
class ReverDao extends BaseDao {

  import com.t2t.tss.dao.BaseDaoContext._

  /**
   * 通过留言ID获得回复的ID
   * @param id
   * @return ArrayBuffer
   */
  def get(id: Int): ArrayBuffer[Revert] = {
    val sql: String = "select * from reverts where messageID=" + id
    DBHelper.executeQuery(sql)
  }

  /**
   * 回复留言
   * @param revert
   * @return Int
   */
  def add(revert: Revert): Int = {
    val sql: String = "insert reverts(messageID,content,writer)values(?,?,?)"
    DBHelper.executeUpdate(sql, revert.getMessageID + "", revert.getContent, revert.getWriter)
  }
}

