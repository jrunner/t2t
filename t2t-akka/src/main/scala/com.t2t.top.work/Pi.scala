package com.t2t.top.work


import java.util.Date

import akka.actor._
import akka.routing.RoundRobinRouter
import scala.concurrent.duration.Duration

sealed trait PiMessage

//Calculate – 发送给 主 actor 来启动计算。
case object Calculate extends PiMessage

//Work – 从 主 actor 发送给各 工作 actor，包含工作分配的内容。
case class Work(start: Int, nrOfElements: Int) extends PiMessage

//Result – 从 工作 actors 发送给 主 actor，包含工作actor的计算结果。
case class Result(value: Double) extends PiMessage

//PiApproximation – 从 主 actor发送给 监听器 actor，包含pi的最终计算结果和整个计算耗费的时间。
case class PiApproximation(pi: Double, time: Long)

/**
 * 由一个主actor来启动整个计算过程，创建一组工作actor。
 * 整个工作会被分割成具体的小段
 * 各小段会以round-robin的方式发送到不同的工作actor。
 * 主actor等待所有的工作actor完全各种的工作并将其送回的结果汇总。当计算完成以后，主actor将结果发送监视器actor，由它来输出结果。
 */
object Pi extends App {

  calculate(nrOfWorkers = 4, nrOfElements = 10000, nrOfMessages = 10000)

  def calculate(nrOfWorkers: Int, nrOfElements: Int, nrOfMessages: Int) {
    // Create an Akka system
    // 创建一个akka系统
    val system = ActorSystem("PiSystem")

    // create the result listener, which will print the result and shutdown the system
    // 创建一个监听，打印结果和关闭系统
    val listener = system.actorOf(Props[Listener], name = "listener")

    // create the master
    // 创建一个master
    val master = system.actorOf(Props(new Master(nrOfWorkers, nrOfMessages, nrOfElements, listener)), name = "master")

    // start the calculation
    // 开始计算
    master ! Calculate

  }
}