//
//  UIControl+Event.h
//  GlobalScanner
//
//  Created by kiefer on 16/3/7.
//  Copyright (c) 2016年 xiaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Event)

@property(nonatomic, assign) NSTimeInterval acceptEventInterval; //给重复点击加间隔
@property(nonatomic, assign) NSTimeInterval acceptEventTime;

@end
