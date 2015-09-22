package com.t2t.tss.dao

import com.t2t.tss.entity.Product
import com.t2t.tss.util.DBHelper

import scala.collection.mutable.ArrayBuffer

/**
 * Created by ypf on 2015/5/28.
 */
class ProductDao extends BaseDao {

  import com.t2t.tss.dao.BaseDaoContext._

  /**
   * 查询商品列表 （默认排序）
   * @return
   */
  def top5Product(page: Int): ArrayBuffer[Product] = {
    var list = new ArrayBuffer[Product]
    var rowBegin: Int = 0
    if (page > 1) {
      rowBegin = 5 * (page - 1)
    }
    val sql: String = "select from product where productId not in(select top " + rowBegin + " productId from product order by productId desc)order " +
      "by productId desc limit 5"
    DBHelper.executeQuery(sql)
  }

  /**
   * 首页右边商品滚动 动态获取5张图片
   * @return
   */
  def selectProductList: ArrayBuffer[Product] = {
    val sql: String = "select top 5 * from product order by ProductId desc"
    DBHelper.executeQuery(sql)
  }

  /**
   * 首页8张商品滚动 动态获取8张图片
   * @return
   */
  def top8product(page: Int): ArrayBuffer[Product] = {
    var list = new ArrayBuffer[Product]
    val sql: String = "select * from product order by ProductId desc limit 10"
    DBHelper.executeQuery(sql)
  }

  /**
   * 根据商品ID查找相关产品信息
   * @param productID
   * @return 产品对象
   */
  def getProductByID(productID: Int): Product = {
    var product: Product = null
    val sql: String = "select * from product where productID=" + productID + ""
    DBHelper.executeQuery(sql)
  }


  /**
   * 增加一个商品
   * @return
   */
  def add(product: Product): Int = {
    val sql: String = "insert into product(serialNumber,name,Brand,Model,price,Picture,Description)values(?,?,?,?,?,?,?)"
    DBHelper.executeUpdate(sql, product.getSerialNumber, product.getName, product.getBrand, product.getModel, product.getPrice + "", product
      .getPicture, product.getDescription)
  }

  /**
   * 后台管理 商品管理 列表信息
   * @return
   */
  def top10product(page: Int): ArrayBuffer[Product] = {
    var list = new ArrayBuffer[Product]
    var rowBegin: Int = 0
    if (page > 1) {
      rowBegin = 10 * (page - 1)
    }
    val sql: String = "select * from product where ProductId not in(select top " + rowBegin + " ProductId from product order by ProductId desc)" +
      "order by ProductId desc limit 10"
    DBHelper.executeQuery(sql)

  }


  /**
   * 后台查询共多少页
   * @return
   */
  def ProductPage: ArrayBuffer[Product] = {
    var list = new ArrayBuffer[Product]
    val sql: String = "select * from product"
    DBHelper.executeQuery(sql)
  }

  /**
   * 后台管理 根据ID删除一个商品
   * @param proId
   * @return Int
   */
  def delete(proId: Int): Int = {
    val sql: String = "delete from product where productID=" + proId
    DBHelper.executeUpdate(sql)
  }

  /**
   * 根据一个商品ID更新此商品信息
   * @param product
   * @return Int
   */
  def update(product: Product): Int = {
    val sql: String = "update product set serialNumber=?,name=?,Brand=?,model=?,price=?,picture=?,description=? where productId =" + product.getProductID
    DBHelper.executeUpdate(sql, product.getSerialNumber, product.getName, product.getBrand, product.getModel, product.getPrice + "", product
      .getPicture, product.getDescription)
  }


}

