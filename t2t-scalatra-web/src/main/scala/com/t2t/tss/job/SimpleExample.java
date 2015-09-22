package com.t2t.tss.job;

import com.t2t.tss.util.ReadFile;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;

import java.util.Date;

import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;


public class SimpleExample {

    public void run() throws Exception {
        String cron = ReadFile.getCron();
        cron = "0/20 * * * * ?";

        SchedulerFactory sf = new StdSchedulerFactory();
        Scheduler sched = sf.getScheduler();
        JobDetail job = newJob(SimpleJob.class).withIdentity("job1", "group1").build();
        CronTrigger trigger = newTrigger().withIdentity("trigger1", "group1").withSchedule(cronSchedule(cron)).build();
        sched.scheduleJob(job, trigger);
        System.out.println("start job " + new Date());
        sched.start();

        System.out.println("------- 开始调度 ----------------");
    }

    public static void main(String[] args) throws Exception {
        SimpleExample example = new SimpleExample();
        example.run();

    }

}