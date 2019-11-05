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
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[TimerManager sharedManager] cancelTaskWithID:self.taskID];
}


@end
