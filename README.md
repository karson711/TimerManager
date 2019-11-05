# TimerManager
NSTimer任务管理工具类

添加任务：

Task *t = [[Task alloc] initWithTime:30 handler:^{
        NSLog(@"event");
} ];

self.taskID = t.taskID;

[[TimerManager sharedManager] runTask:t];


删除任务：

[[TimerManager sharedManager] cancelTaskWithID:self.taskID];
