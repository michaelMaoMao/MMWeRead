//
//  Utilities.h
//  GlobalScanner
//
//  Created by kiefer on 15/8/27.
//  Copyright (c) 2015年 Neo Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utilities : NSObject

/**
 *  价格字符串格式化
 *
 *  @param price  价格
 *  @param offset 人民币符号偏移量
 *  @param font   小数文字
 *
 */
+ (NSAttributedString *)priceFormat:(NSString *)price RMBSymbolOffset:(CGFloat)offset decimalFont:(UIFont *)font;
+ (NSAttributedString *)priceFormat:(NSString *)price RMBSymbolOffset:(CGFloat)offset;
+ (NSAttributedString *)priceFormat:(NSString *)price
                            rmbFont:(UIFont *)rmbFont rmbOffset:(CGFloat)offset
                        decimalFont:(UIFont *)decimalFont;

// 系统时间
+ (NSString *)systemTime;
// 时间转换（0天00:00:00）
+ (NSString *)timeFromSeconds:(double)seconds;
// 收藏倒计时
+ (NSString *)collectTimeFromSeconds:(double)seconds;
// 时间转换（00:00.0）
+ (NSString *)cartTimeFromSeconds:(NSTimeInterval)seconds;
// 直播预热倒计时
+ (NSString *)liveTimeFromSeconds:(NSTimeInterval)seconds;

// 空格字符串
+ (NSString *)spaceStringWithWidth:(CGFloat)width;

/**
 *  缩小放大动画
 *
 *  @param view
 */
+ (void)addZoomAnimationToView:(UIView *)view;
// 加入购物袋飞入动画
+ (CAAnimationGroup *)cartAnimation:(UIBezierPath *)movePath animationDelegate:(id)delegate;

/**
 *  根据最大长度截断字符串 在行尾加上...
 *
 *  @param string   字符串
 *  @param maxWidth 最大长度
 *  @param font     字体大小
 *
 *  @return string
 */
+ (NSString *)lineBreakByTruncatingTail:(NSString *)string maxWidth:(CGFloat)maxWidth font:(UIFont *)font;
//
+ (NSMutableAttributedString *)vTextFormat:(NSString *)text vFontSize:(CGFloat)fontSize;
+ (NSMutableAttributedString *)vTextFormat:(NSString *)text vFontSize:(CGFloat)fontSize vOffset:(CGFloat)vOffset;

// 将订单id列表从小到大排序
+ (NSArray *)sortedOrderIdList:(NSArray *)orderIdList ascending:(BOOL)ascending;

// jsonString转jsonObject
+ (NSDictionary *)jsonStringToJsonObject:(NSString *)jsonString;
// jsonObject转jsonString
+ (NSString *)jsonObjectToJsonString:(NSDictionary *)jsonObject;

+ (NSDateFormatter *)dateFormatter:(NSString *)dateFormat;
// 时间间隔
+ (NSTimeInterval)timeIntervalWithDateString1:(NSString *)dateString1 dateString2:(NSString *)dateString2;

@end
