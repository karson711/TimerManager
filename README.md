# TimerManager

##NSTimer任务管理工具类

添加任务：

Task *t = [[Task alloc] initWithTime:30 handler:^{
        NSLog(@"event");
} ];

self.taskID = t.taskID;

[[TimerManager sharedManager] runTask:t];


删除任务：

[[TimerManager sharedManager] cancelTaskWithID:self.taskID];

-----------------------------------------------------------------------------------------------------------------------

CADisplayLink

self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkLog)];

[self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
-----------------------------------------------------------------------------------------------------------------------

GCD

self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());

//设置频率

dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), 1*NSEC_PER_SEC, 0);

//设置执行的代码块

dispatch_source_set_event_handler(self.timer, ^{

    NSLog(@"GCD定时器");
});

//激活
dispatch_resume(self.timer);
