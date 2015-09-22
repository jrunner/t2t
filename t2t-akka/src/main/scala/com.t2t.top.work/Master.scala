package com.t2t.top.work


import akka.actor.{Props, ActorRef, Actor}
import akka.routing.RoundRobinRouter

import scala.concurrent.duration.Duration
import java.util.Date

/**
 * Created by ypf on 2015/5/25.
 * nrOfWorkers  – 定义我们会启动多少工作actor
 * nrOfMessages – 定义会有多少整数段发送给工作actor
 * nrOfElements – 定义发送给工作actor的每个整数段的大小
 */
class Master(nrOfWorkers: Int, nrOfMessages: Int, nrOfElements: Int, listener: ActorRef) extends Actor {

  var pi: Double = _
  var nrOfResults: Int = _
  val start: Long = System.currentTimeMillis

  val workerRouter = context.actorOf(Props[Worker].withRouter(RoundRobinRouter(nrOfWorkers)), name = "workerRouter")

  def receive = {
    //    Calculate 处理器会通过其路由器向所有的 工作 actor 发送工作内容.
    case Calculate => {
      for (i <- 0 until nrOfMessages) {
        workerRouter ! Work(i * nrOfElements, nrOfElements)
      }
    }
    //      Result 用来汇总不同的计算结果
    case Result(value) => {
      pi += value
      nrOfResults += 1
      if (nrOfResults == nrOfMessages) {
        // Send the result to the listener ，发送结果到监听
        listener ! PiApproximation(pi, System.currentTimeMillis - start)
        // Stops this actor and all its supervised children ，停止当前actor和所有监听子类
        context.stop(self)
      }
    }
  }

}