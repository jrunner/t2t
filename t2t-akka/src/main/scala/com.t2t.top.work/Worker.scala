package com.t2t.top.work

import akka.actor.{Props, Actor}

/**
 * Created by ypf on 2015/5/25.
 */
class Worker extends Actor {

  // calculatePiFor ...
  def receive = {
    case Work(start, nrOfElements) =>
      sender ! Result(calculatePiFor(start, nrOfElements)) // perform the work
  }

  def calculatePiFor(start: Int, nrOfElements: Int): Double = {
    var acc = 0.0
    for (i <- start until (start + nrOfElements))
      acc += 4.0 * (1 - (i % 2) * 2) / (2 * i + 1)
    acc
  }

}
