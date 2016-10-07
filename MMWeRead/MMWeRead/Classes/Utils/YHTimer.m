//
//  YHTimer.m
//  GlobalScanner
//
//  Created by kiefer on 15/12/9.
//  Copyright (c) 2015年 Neo Yang. All rights reserved.
//

#import "YHTimer.h"

@implementation YHTimer

+ (YHTimer *)sharedTimer {
    static YHTimer *mInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        mInstance = [[YHTimer alloc] init];
        [mInstance startTimer];
    });
    return mInstance;
}

- (instancetype)init {
    if ((self = [super init])) {
        delegateSet = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)addDelegate:(id<YHTimerDelegate>)delegate {
    if (delegateSet && ![delegateSet containsObject:delegate]) {
        [delegateSet addObject:delegate];
    }
}

- (void)removeDelegate:(id<YHTimerDelegate>)delegate {
    if (delegateSet && [delegateSet containsObject:delegate]) {
        [delegateSet removeObject:delegate];
    }
}

// 开始倒计时
- (void)startTimer {
    [self stopTimer];
    if (_timer == nil) {
        _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(handleTimer) userInfo:nil repeats:true];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

// 取消倒计时
- (void)stopTimer {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

// 执行倒计时
- (void)handleTimer {
    int count = (int)[[delegateSet allObjects] count];
    if (count > 0) {
        for (int i = count - 1; i >= 0; i--) {
            id<YHTimerDelegate> delegate = [[delegateSet allObjects] objectAtIndex:i];
            if ([delegate respondsToSelector:@selector(handleTimer)]) {
                [delegate handleTimer];
            }
        }
    }
}

@end
