//
//  Utilities.m
//  GlobalScanner
//
//  Created by kiefer on 15/8/27.
//  Copyright (c) 2015年 Neo Yang. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+ (NSString *)systemTime {
    NSDate *date = [NSDate date];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSString *dateString = [formatter stringFromDate:date];
    [formatter setDateFormat:@"EEEE"];

    NSString *weekday = [formatter stringFromDate:date];
    DBLOG(@"%f", [[NSDate date] timeIntervalSince1970]);
    DBLOG(@"%@ %@", dateString, weekday);
    return [NSString stringWithFormat:@"%@%@", dateString, weekday];
}

+ (NSAttributedString *)priceFormat:(NSString *)price RMBSymbolOffset:(CGFloat)offset {
    return [self priceFormat:price RMBSymbolOffset:offset decimalFont:nil];
}

+ (NSAttributedString *)priceFormat:(NSString *)price RMBSymbolOffset:(CGFloat)offset decimalFont:(UIFont *)decimalFont {
    if (!price || price.length == 0) return nil;

    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange range = [price rangeOfString:@"￥"];
    if (range.location != NSNotFound && [[UIDevice currentDevice].systemVersion floatValue] < 9.0) {
        [attributedText addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:range]; //字符偏移量
        [attributedText addAttribute:NSKernAttributeName value:@(-1.5) range:range]; //字符间距
    }
    range = [price rangeOfString:@"."];
    if (range.location != NSNotFound && decimalFont) {
        range.length = price.length - range.location;
        [attributedText addAttribute:NSFontAttributeName value:decimalFont range:range];
    }
    return attributedText;
}

+ (NSAttributedString *)priceFormat:(NSString *)price
                            rmbFont:(UIFont *)rmbFont rmbOffset:(CGFloat)offset
                        decimalFont:(UIFont *)decimalFont {
    if (!price || price.length == 0) return nil;

    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange range = [price rangeOfString:@"￥"];
    if (range.location != NSNotFound) {
        [attributedText addAttribute:NSFontAttributeName value:rmbFont range:range];
        if ([[UIDevice currentDevice].systemVersion floatValue] < 9.0) {
            [attributedText addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:range]; //字符偏移量
            [attributedText addAttribute:NSKernAttributeName value:@(-1.5) range:range]; //字符间距
        }
    }
    range = [price rangeOfString:@"."];
    if (range.location != NSNotFound && decimalFont) {
        range.length = price.length - range.location;
        [attributedText addAttribute:NSFontAttributeName value:decimalFont range:range];
    }
    return attributedText;
}

+ (NSString *)timeFromSeconds:(double)seconds {
    int rsecs = round(seconds);
    int day = rsecs / 3600 / 24;
    int hour = rsecs % (3600 * 24) / 3600;
    int min = rsecs % (3600) / 60;
    int sec = rsecs % 60;

    NSString *res = [NSString stringWithFormat:@"%d天%02d:%02d:%02d", day, hour, min, sec];
    if (day == 0) {
        res = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, min, sec];
        if (hour == 0) {
            res = [NSString stringWithFormat:@"%02d:%02d", min, sec];
        }
    }
    return res;
}

+ (NSString *)collectTimeFromSeconds:(double)seconds {
    int rsecs = round(seconds);
    int day = rsecs / 3600 / 24;
    int hour = rsecs % (3600 * 24) / 3600;
    int min = rsecs % (3600) / 60;
    int sec = rsecs % 60;

    NSString *res = [NSString stringWithFormat:@"%d天%02d:%02d:%02d", day, hour, min, sec];
    if (day == 0) {
        res = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, min, sec];
    }
    return res;
}

+ (NSString *)cartTimeFromSeconds:(NSTimeInterval)seconds {
    int rsecs = round(seconds);
    int day = rsecs / 3600 / 24 / 1000;
    int hour = rsecs / 1000 % (3600 * 24) / 3600;
    int min = rsecs / 1000 % (3600) / 60;
    int sec = rsecs / 1000 % 60;
    int msec = rsecs % 1000 / 100;

    NSString *res = [NSString stringWithFormat:@"%d天%02d:%02d:%02d", day, hour, min, sec];
    if (day == 0) {
        res = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, min, sec];
        if (hour == 0) {
            res = [NSString stringWithFormat:@"%02d:%02d.%d", min, sec, msec];
        }
    }
    return res;
}

+ (NSString *)liveTimeFromSeconds:(NSTimeInterval)seconds {
    int rsecs = round(seconds);
    int day = rsecs / 3600 / 24;
    int hour = rsecs % (3600 * 24) / 3600;
    int min = rsecs % (3600) / 60;
    int sec = rsecs % 60;

    NSString *res = [NSString stringWithFormat:@"%02d:%02d:%02d", (day*24 + hour), min, sec];
    if ((day*24 + hour) > 99) {
        res = [NSString stringWithFormat:@"%02d:%02d:%02d", 99, min, sec];
    }
    return res;
}

+ (NSString *)spaceStringWithWidth:(CGFloat)width {
    NSMutableString *mString = [NSMutableString stringWithString:@""];
    CGFloat textWidth = 0.0;
    while (textWidth < width) {
        textWidth = [mString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]}].width;
        [mString appendString:@" "];
    }
    return mString;
}

+ (void)addZoomAnimationToView:(UIView *)view {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    anim.values = @[@(0.1), @(1.0), @(1.5)];
    anim.keyTimes = @[@(0.2), @(0.5), @(0.8), @(1.0)];
    anim.calculationMode = kCAAnimationLinear;
    [view.layer addAnimation:anim forKey:@"Zoom"];
}

+ (CAAnimationGroup *)cartAnimation:(UIBezierPath *)movePath animationDelegate:(id)delegate {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = movePath.CGPath;

    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expandAnimation.duration = 0.15;
    expandAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    expandAnimation.toValue = [NSNumber numberWithFloat:2.0];
    expandAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

    CABasicAnimation *narrowAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    narrowAnimation.beginTime = expandAnimation.duration;
    narrowAnimation.duration = 0.65;
    narrowAnimation.fromValue = [NSNumber numberWithFloat:2.0];
    narrowAnimation.toValue = [NSNumber numberWithFloat:0.5];
    narrowAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animation, expandAnimation, narrowAnimation];
    animationGroup.duration = expandAnimation.duration + narrowAnimation.duration;
    animationGroup.removedOnCompletion = false;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.delegate = delegate;

    return animationGroup;
}

+ (NSString *)lineBreakByTruncatingTail:(NSString *)string maxWidth:(CGFloat)maxWidth font:(UIFont *)font {
    if (!string || string.length == 0) return string;

    CGFloat width = [string sizeWithAttributes:@{NSFontAttributeName:font}].width;
    if (width <= maxWidth) return string;

    NSString *substring = @"";
    for (int i = 1; i <= string.length; i++) {
        substring = [string substringToIndex:i];
        CGFloat subwidth = [substring sizeWithAttributes:@{NSFontAttributeName:font}].width;
        if (subwidth > maxWidth) {
            substring = [NSString stringWithFormat:@"%@...", [string substringToIndex:i - 1]];
            return substring;
        }
    }
    return string;
}

+ (NSMutableAttributedString *)vTextFormat:(NSString *)text vFontSize:(CGFloat)fontSize {
    return [self vTextFormat:text vFontSize:fontSize vOffset:0];
}

+ (NSMutableAttributedString *)vTextFormat:(NSString *)text vFontSize:(CGFloat)fontSize vOffset:(CGFloat)offset {
    if (!text || ![text length]) return nil;

    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange range = [attributedText.string rangeOfString:@"V"];
    NSUInteger pos = 0;
    while ((range.location != NSNotFound)) {
        pos = pos + range.location;
        [attributedText addAttribute:NSFontAttributeName value:FONT_V(fontSize) range:NSMakeRange(pos, range.length)];
        [attributedText addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:NSMakeRange(pos, range.length)];
        if (pos + 1 < attributedText.string.length) {
            CGFloat numberSize = (fontSize > 20) ?  fontSize - 9 : fontSize - 5;
            [attributedText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:numberSize] range:NSMakeRange(pos + 1, 1)];
        }
        pos = pos + range.length;
        range = [[attributedText.string substringFromIndex:(pos)] rangeOfString:@"V"];
    }
    return attributedText;
}

// 将订单id列表从小到大排序
+ (NSArray *)sortedOrderIdList:(NSArray *)orderIdList ascending:(BOOL)ascending {
    NSArray *result = [orderIdList sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        if (obj1.doubleValue < obj2.doubleValue) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        if (obj1.doubleValue > obj2.doubleValue) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    return result;
}

+ (NSDictionary *)jsonStringToJsonObject:(NSString *)jsonString {
    NSError *error = nil;
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:(0) error:&error];
    if (error) return nil;
    return jsonObject;
}

+ (NSString *)jsonObjectToJsonString:(NSDictionary *)jsonObject {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonObject options:0 error:nil];
    if (error) return nil;
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:(NSUTF8StringEncoding)];
    return jsonString;
}

+ (NSDateFormatter *)dateFormatter:(NSString *)dateFormat {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
    });
    [formatter setDateFormat:dateFormat];
    return formatter;
}

+ (NSTimeInterval)timeIntervalWithDateString1:(NSString *)dateString1 dateString2:(NSString *)dateString2 {
    NSDateFormatter *formatter = [self dateFormatter:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1 = [formatter dateFromString:dateString1];
    NSDate *date2 = [formatter dateFromString:dateString2];
    NSTimeInterval timeInterval = [date1 timeIntervalSinceDate:date2];
    if (timeInterval <= 0) return 0;
    return timeInterval;
}

@end
