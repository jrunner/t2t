package com.t2t.tss

/**
 * Created by Administrator on 2015/5/31.
 */
object Test {
  def main(args: Array[String]) {
    val yymmdd = "20141012"
    val yy = if (yymmdd.length >= 4) yymmdd.substring(0, 4) else ""
    val mm = if (yymmdd.length >= 6) yymmdd.substring(4, 6) else ""
    val dd = if (yymmdd.length >= 8) yymmdd.substring(6, 8) else ""
    println(yy)
    println(mm)
    println(dd)
  }
}
