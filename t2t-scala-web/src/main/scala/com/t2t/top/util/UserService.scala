package com.t2t.top.util

import com.t2t.top.web.UserBean

import scala.collection.mutable.ArrayBuffer

/**
 * Created by Administrator on 2015/5/20.
 */
class UserService {

  def exists(useranme: String, id: Int): Boolean = {
    var sql = "SELECT count(*) num FROM TBL_USER WHERE USER = '{0}'".replace("{0}", useranme)

    //修改是id不能为本身
    if (id != 0)
      sql += " and ID <> " + id

    val rs = DBHelper.executeQuery(sql)
    if (rs.next())
      return rs.getInt("num") > 0
    return false
  }

  /**
   * 返回受影响行数
   * @param bean
   * @return Int
   */
  def update(bean: UserBean): Int = {
    val sql =
      if (bean.id == 0)
        "INSERT INTO TBL_USER(USER,PASSWORD) VALUE('{0}','{1}')".replace("{0}", bean.username).replace("{1}", bean.password)
      else
        "UPDATE TBL_USER SET USER='{0}',PASSWORD='{1}' WHERE ID={2}".replace("{0}", bean.username).replace("{1}", bean.password).replace("{2}", bean.id + "")

    DBHelper.executeUpdate(sql)
  }

  /**
   * 根据id查询用户
   * @param id
   * @return 用户对象
   */
  def get(id: Int): UserBean = {
    val sql = "SELECT * FROM TBL_USER WHERE ID = " + id

    val rs = DBHelper.executeQuery(sql)
    if (rs.next()) {
      return new UserBean(rs.getInt("ID"), rs.getString("USER"), rs.getString("PASSWORD"));
    }
    null
  }

  /**
   * 查询功能
   * @param bean
   * @return 查询列表
   */
  def query(bean: UserBean): ArrayBuffer[UserBean] = {
    val sql = "SELECT * FROM TBL_USER WHERE  1 = 1"
    val arr = ArrayBuffer[UserBean]()
    val rs = DBHelper.executeQuery(sql)
    while (rs.next()) {
      arr += UserBean(rs.getInt("ID"), rs.getString("USER"), rs.getString("PASSWORD"));
    }
    arr
  }

  /**
   * 删除操作
   * @param ids
   * @return 受影响行数
   */
  def del(ids: String): Int = {
    var count = 0
    ids.split(",").foreach(op => {
      val sql = "DELETE FROM TBL_USER WHERE ID = " + op
      count = count + DBHelper.executeUpdate(sql)
    })
    count
  }
}
