package com.t2t.top.work

import akka.actor.Actor

/**
 * Created by ypf on 2015/5/25.
 */
class Listener extends Actor {
  def receive = {
    case PiApproximation(pi, duration) =>
      println("Pi approximation: \t%s\nCalculation Time: \t%s毫秒".format(pi, duration))
      context.system.shutdown()
  }
}