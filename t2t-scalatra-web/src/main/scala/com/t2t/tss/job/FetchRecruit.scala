package com.t2t.tss.job

import java.text.SimpleDateFormat

import org.joda.time._

import scala.io.Source
import scala.util.matching.Regex

/**
 * Created by ypf on 2015/6/5.
 */
object FetchRecruit {

  def main(args: Array[String]) {
    val v = """[0-9]+""".r.findFirstIn("为您找到1234个相关职位")
    println(v)

    val pattern = """[^((\d+\.){0,1}\d+)^\s+]+""".r

    pattern.findAllIn("123aa123aaaaa111").foreach(println)

    print("spark")
    print("java")
    print("c++")
    println(get("java"))
  }

  def print(key: String): Unit = {
    var value = ""
    val url = "http://opendata.baidu.com/zhaopin/s?wd=" + key + "&rn=18&p=mini&style=list&type="
    val p = "为您找到.*?个相关职位".r
    Source.fromURL(url).getLines().foreach(op => {
      val r = p.findFirstIn(op)
      if (r.isDefined) value = r.get;
    }
    )
    val sdf = new SimpleDateFormat("yyyy-MM-dd H:mm:ss")
    println(key + " = " + sdf.format(DateTime.now.toDate) + " = " + value)
  }

  case class StatRecruit(val id: Int, val keyword: String, val num: Int, val label: String, var createtime: java.util.Date)

  def get(key: String): StatRecruit = {

    var value = ""
    val url = "http://opendata.baidu.com/zhaopin/s?wd=" + key + "&rn=18&p=mini&style=list&type="
    val p = "为您找到.*?个相关职位".r
    Source.fromURL(url, "UTF-8").getLines().foreach(op => {
      val r = p.findFirstIn(op)
      if (r.isDefined) value = r.get;
    }
    )

    val sdf = new SimpleDateFormat("yyyy-MM-dd H:mm:ss")
    println(key + " = " + sdf.format(DateTime.now.toDate) + " = " + value)
    val num = """[0-9]+""".r.findFirstIn(value).getOrElse("0").toInt
    new StatRecruit(0, key, num, value, DateTime.now.toDate)
  }


}
