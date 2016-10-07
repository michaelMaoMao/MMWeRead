//
//  UIControl+Event.m
//  GlobalScanner
//
//  Created by kiefer on 16/3/7.
//  Copyright (c) 2016年 xiaojian. All rights reserved.
//

#import "UIControl+Event.h"
#import "objc/runtime.h"

@implementation UIControl (Event)

static char acceptEventIntervalKey;
static char acceptEventTimeKey;

+ (void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__yh_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (NSTimeInterval)acceptEventInterval {
    return [objc_getAssociatedObject(self, &acceptEventIntervalKey) doubleValue];
}

- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval {
    objc_setAssociatedObject(self, &acceptEventIntervalKey, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)acceptEventTime {
    return [objc_getAssociatedObject(self, &acceptEventTimeKey) doubleValue];
}

- (void)setAcceptEventTime:(NSTimeInterval)acceptEventTime {
    objc_setAssociatedObject(self, &acceptEventTimeKey, @(acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)__yh_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([[NSDate date] timeIntervalSince1970] - self.acceptEventTime < self.acceptEventInterval) {
        return;
    }
    if (self.acceptEventInterval > 0) {
        self.acceptEventTime = [[NSDate date] timeIntervalSince1970];
    }
    [self __yh_sendAction:action to:target forEvent:event];
}

@end
