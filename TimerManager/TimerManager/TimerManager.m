//
//  TimerManager.m
//  TimerManager
//
//  Created by anfa on 2019/11/5.
//  Copyright © 2019 anfa. All rights reserved.
//

#import "TimerManager.h"

@interface TimerManager ()

@property (nonatomic,strong)NSMutableArray  *tasksArray;
@property (nonatomic,strong)NSTimer *timer;

@end

@implementation TimerManager

+(instancetype)sharedManager{
    static dispatch_once_t onceToken;
    static TimerManager *manager = nil;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[TimerManager alloc] init];
        }
    });
    return manager;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

-(void)runTask:(Task *)task{
    for (Task *t in self.tasksArray) {
        if ([t.taskID isEqualToString:task.taskID]) {
            return;
        }
    }
    [self.tasksArray addObject:task];
}

-(void)cancelTaskWithID:(NSString *)taskID{
    for (int i = (int)self.tasksArray.count-1; i >= 0; i--) {
        if ([[self.tasksArray[i] taskID] isEqualToString:taskID]) {
            [self.tasksArray removeObjectAtIndex:i];
        }
    }
}

-(NSMutableArray *)tasksArray{
    if (!_tasksArray) {
        _tasksArray = [NSMutableArray array];
    }
    return _tasksArray;
}

-(NSTimer *)timer{
    if (!_timer) {
        static int index = 0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1/60.0 repeats:YES
                                              block:^(NSTimer * _Nonnull timer){
            
            if (index == 59) {
                index = 0;
            }
            for (Task *t in self.tasksArray) {
                if (index%t.time == 0) {
                    t.event();
                }
            }
            index++;
            
        }];
    }
    return _timer;
}


@end
