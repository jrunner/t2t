package com.t2t.tss.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobKey;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 这外例子说明了如何开始和关闭一个 Quartz scheduler
 * 及如何运行一个任务
 */
public class SimpleJob implements Job {

    /**
     * 实现你自己的定时方法 ,至于里面写什么,您说了蒜!<br>
     */
    @Override
    public void execute(JobExecutionContext context) {
        System.out.println("------------------");
        System.out.println("Hello World! - " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        JobKey jobKey = context.getJobDetail().getKey();
        System.out.println("SimpleJob says: " + jobKey + " executing at " + new Date());

        FetchRecruit.print("java");
        FetchRecruit.print("scala");
        FetchRecruit.print("spark");
        System.out.println("------------------");
    }

}