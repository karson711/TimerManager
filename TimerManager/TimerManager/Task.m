//
//  Task.m
//  TimerManager
//
//  Created by anfa on 2019/11/5.
//  Copyright © 2019 anfa. All rights reserved.
//

#import "Task.h"

@implementation Task

-(instancetype)initWithTime:(NSUInteger)time handler:(void(^)(void))handler{
    self = [super init];
    if (self) {
        self.time = time;
        self.event = handler;
        _taskID = [NSUUID UUID].UUIDString;
    }
    return self;
}

@end
