//
//  TimerManager.h
//  TimerManager
//
//  Created by anfa on 2019/11/5.
//  Copyright © 2019 anfa. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface TimerManager : NSObject

//单例方法
+(instancetype)sharedManager;
//运行定时器任务
-(void)runTask:(Task *)task;
//取消定时器任务
-(void)cancelTaskWithID:(NSString *)taskID;

@end

NS_ASSUME_NONNULL_END
