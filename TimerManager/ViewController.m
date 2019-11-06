//
//  ViewController.m
//  TimerManager
//
//  Created by anfa on 2019/11/5.
//  Copyright © 2019 anfa. All rights reserved.
//

#import "ViewController.h"
#import "TimerManager.h"
#import "Task.h"

@interface ViewController ()

@property (nonatomic,strong)NSString *taskID;

@property (nonatomic,strong)CADisplayLink *displayLink;

@property (nonatomic,strong)dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Task *t = [[Task alloc] initWithTime:30 handler:^{
        NSLog(@"event");
    } ];
    
    self.taskID = t.taskID;
    Task *t2 = [[Task alloc] initWithTime:10 handler:^{
        NSLog(@"event2");
    }];
    [[TimerManager sharedManager] runTask:t];
    [[TimerManager sharedManager] runTask:t2];
    
    
    //CADisplayLink
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkLog)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    
    //GCD
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    //设置频率
    dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), 1*NSEC_PER_SEC, 0);
    //设置执行的代码块
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"GCD定时器");
    });
    //激活
    dispatch_resume(self.timer);
}

-(void)linkLog{
    static NSTimeInterval curr = 0;
    if (curr!=0) {
        NSLog(@"%f",1/(self.displayLink.timestamp-curr));
    }
    curr = self.displayLink.timestamp;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //根据taskID删除任务
    [[TimerManager sharedManager] cancelTaskWithID:self.taskID];
    
    //设置CADisplayLink失效
    [self.displayLink invalidate];
    
    //停止（取消timer）
    dispatch_source_cancel(self.timer);
}


@end
