package com.t2t.tss.dao

import com.t2t.tss.entity.User
import com.t2t.tss.util.DBHelper

import scala.collection.mutable.ArrayBuffer

/**
 * Created by ypf on 2015/5/28.
 */
class UserDao extends BaseDao {

  import com.t2t.tss.dao.BaseDaoContext._

  /**
   * 查找用户信息
   */
  def getUserByName(userName: String): User = {
    val user = new User
    val sql: String = "select * from User where userName='" + userName + "'"
    DBHelper.executeQuery(sql)
  }

  /**
   * 查询会员
   * @return
   */
  def query: ArrayBuffer[User] = {
    var list = new ArrayBuffer[User]()
    val sql: String = "select * from User"
    DBHelper.executeQuery(sql)
  }

  /**
   * 注册用户
   * @param user
   * @return Int
   */
  def add(user: User): Int = {
    val sql: String = "insert User(userName,password)values('" + user.getUserName + "','" + user.getPassword + "')"
    DBHelper.executeUpdate(sql)
  }

  /**
   * 添加管理员
   */
  def addManager(User: User): Int = {
    val sql: String = "insert User(userName,password,status)values('\" + User.getUserName + \"','\" + User.getPassword + \"',1)"
    DBHelper.executeUpdate(sql)
  }


  /**
   * 删除会员
   * @param id
   * @return
   */
  def delete(id: Int): Int = {
    val sql: String = "delete User where userID =" + id
    DBHelper.executeUpdate(sql)
  }
}

