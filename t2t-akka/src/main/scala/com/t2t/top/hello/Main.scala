package com.t2t.top.hello


import akka.actor.{Props, ActorSystem}

/**
 * Created by ypf on 2015/5/25.
 */
object Main extends App{

  val system =  ActorSystem("lol")

  val helloActor = system.actorOf(Props(new HelloActor("Fred")), name = "helloactor")
  helloActor ! "hello"
  helloActor ! "hey"

}