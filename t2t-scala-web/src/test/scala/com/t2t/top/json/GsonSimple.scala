package com.t2t.top.json

import com.google.gson.Gson

import scala.collection.mutable.ArrayBuffer

/**
 * Created by ypf on 2015/5/19.
 */
object GsonSimple {
  def main(args: Array[String]) {

    val list = ArrayBuffer[String]()
    for (i <- 1 to 20) yield list += "a" + i

    println(new Gson().toJson(list.toArray))
    println(new Gson().toJson(list))


  }
}
