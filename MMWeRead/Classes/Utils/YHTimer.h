//
//  YHTimer.h
//  GlobalScanner
//
//  Created by kiefer on 15/12/9.
//  Copyright (c) 2015年 Neo Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YHTimerDelegate;
@interface YHTimer : NSObject {
    NSTimer *_timer;
    NSMutableSet *delegateSet;
}

+ (YHTimer *)sharedTimer;

// 添加一个代理实现
- (void)addDelegate:(id<YHTimerDelegate>)delegate;
// 移除一个代理实现
- (void)removeDelegate:(id<YHTimerDelegate>)delegate;

@end

@protocol YHTimerDelegate <NSObject>
// 开启倒计时
- (void)startTimer;
// 关闭倒计时
- (void)stopTimer;
// 响应倒计时
- (void)handleTimer;

@end
