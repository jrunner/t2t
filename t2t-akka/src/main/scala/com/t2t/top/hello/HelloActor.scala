package com.t2t.top.hello

/**
 * Created by ypf on 2015/5/25.
 */

import akka.actor.{Props, ActorSystem, Actor}

/**
 * Created by ypf on 2015/5/25.
 */
class HelloActor(myName: String) extends Actor {
  def receive = {
    case "hello" => println("hello from %s".format(myName))
    case _ => println("'huh?', said %s".format(myName))
  }
}
