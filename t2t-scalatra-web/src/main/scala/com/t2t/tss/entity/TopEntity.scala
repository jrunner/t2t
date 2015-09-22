package com.t2t.tss.entity

/**
 * Created by ypf on 2015/5/29.
 */

case class Resource(var id: Int, var createTime: java.util.Date)

//用户
case class AuthUser(var id: Int, var name: String, var password: String, var status: Int)

case class History(var id: Int, var key: String, var message: String,
                    var note: String, var yy: String, var mm: String,
                    var dd: String, var kind: String, var order: Int)

