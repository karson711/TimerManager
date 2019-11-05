//
//  Task.h
//  TimerManager
//
//  Created by anfa on 2019/11/5.
//  Copyright © 2019 anfa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

-(instancetype)initWithTime:(NSUInteger)time handler:(void(^)(void))handler;
//标志
@property (nonatomic,strong,readonly)NSString *taskID;
//时间单位为1/60秒
@property (nonatomic,assign)NSUInteger time;
//要执行的动作
@property (nonatomic,copy) void (^event)(void);

@end

NS_ASSUME_NONNULL_END
