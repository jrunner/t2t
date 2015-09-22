package com.t2t.tss.listener

import javax.servlet.{ServletContext, ServletContextEvent, ServletContextListener}

import com.t2t.tss.job.FetchRecruitJob

/**
 * Created by yangpengfei on 2015/6/2.
 */
class ServletContextScheduleListener extends ServletContextListener {

  def contextDestroyed(e: ServletContextEvent) {
  }

  def contextInitialized(e: ServletContextEvent) {
    System.out.println("------- 任务调度(start) ----------------")
    FetchRecruitJob.run()
  }
}
