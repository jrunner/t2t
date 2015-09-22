package com.t2t.tss.job

import java.text.SimpleDateFormat
import java.util.Date

import com.t2t.tss.util.{DBHelper, ReadFile}
import org.joda.time._
import org.quartz.CronScheduleBuilder._
import org.quartz.JobBuilder._
import org.quartz.TriggerBuilder._
import org.quartz._
import org.quartz.impl.StdSchedulerFactory

import scala.io.Source

/**
 * Created by ypf on 2015/6/5.
 *
 * 基于scala实现的job调度
 */
object FetchRecruitJob {

  @throws(classOf[Exception])
  def run() = {
    var cron: String = ReadFile.getCron
    //    cron = "0/20 * * * * ?"
    val sf: SchedulerFactory = new StdSchedulerFactory
    val sched: Scheduler = sf.getScheduler
    val job: JobDetail = newJob(classOf[FetchRecruitJob]).withIdentity("job1", "group1").build
    val trigger: CronTrigger = newTrigger.withIdentity("trigger1", "group1").withSchedule(cronSchedule(cron)).build
    sched.scheduleJob(job, trigger)
    System.out.println("start job " + new Date)
    sched.start
    System.out.println("------- 开始调度 ----------------")
  }

  @throws(classOf[Exception])
  def main(args: Array[String]) {
    FetchRecruitJob.run
  }

}

class FetchRecruitJob extends Job {
  /**
   * 实现你自己的定时方法 ,至于里面写什么,您说了蒜!<br>
   */
  override def execute(context: JobExecutionContext) {
    System.out.println("------------------")
    System.out.println("Hello World! - " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date))
    val jobKey: JobKey = context.getJobDetail.getKey
    System.out.println("SimpleJob says: " + jobKey + " executing at " + new Date)

    "java,spark,hadoop".split(",").foreach(key => {
      val bean = FetchRecruit.get(key)
      val sql = "INSERT INTO `T2T_STAT_RECRUIT`(KEYWORD,NUM,LABEL,CREATETIME) VALUES (?, ?, ?, ?)"
      DBHelper.executeUpdate(sql, bean.keyword, bean.num, bean.label, bean.createtime)
    })

    System.out.println("------------------")
  }
}
