//
//  NSString+Regex.m
//   
//
//  Created by Teng Kiefer on 12-7-12.
//  Copyright (c) 2012年 windo-soft. All rights reserved.
//

#import "NSString+Regex.h"

@implementation NSString (Regex)

// 判断字符串全是数字
- (BOOL)isAllNumber {
    if (!self || ![self length]) return false;
    
    NSString *regex = @"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// 判断是否含有符号
- (BOOL)isContainSymbol {
    if (!self || ![self length]) return false;

    NSString *regex = @"^[A-Za-z0-9\u4e00-\u9fa5]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self] ? false : true;
}

// 判断密码是否符合要求
- (BOOL)isConform {
    if (!self || ![self length]) return false;

    NSString *regex = @"^[a-z0-9_]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// 判断是否含有大写字母
- (BOOL)isContainUppercase {
    if (!self || ![self length]) return false;

    NSString *regex = @"^.*[A-Z].*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// 真实姓名
- (BOOL)isTrueName {
    if (!self || ![self length]) return false;

    NSString *regex = @"^[\\u4e00-\\u9fa5]{2,10}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// 手机号码
- (BOOL)isMobileNumber {
    if (!self || ![self length]) return false;

    NSString *regex = @"^[1][3,4,5,7,8][0-9]{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// 身份证号码
- (BOOL)isIdentityCardNumber {
    if (!self || ![self length]) return false;

    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// 邮箱
- (BOOL)isEmail {
    if (!self || ![self length]) return false;

    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// 邮政编码
- (BOOL)isZipcode {
    if (!self || ![self length]) return false;

    NSString *regex = @"^[1-9]\\d{5}(?!\\d)$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// QQ号码
- (BOOL)isQQNumber {
    if (!self || ![self length]) return false;

    NSString *regex = @"^[1-9][0-9]{4,}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isIPV4 {
    if (!self || ![self length]) return false;

    NSString *regex = @"((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

@end
