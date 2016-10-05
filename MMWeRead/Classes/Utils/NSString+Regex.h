//
//  NSString+Regex.h
//   
//
//  Created by Teng Kiefer on 12-7-12.
//  Copyright (c) 2012年 windo-soft. All rights reserved.
//
//  正则表达式

#import <Foundation/Foundation.h>

@interface NSString (Regex)

// 判断字符串全是数字
- (BOOL)isAllNumber;
// 判断是否含有符号
- (BOOL)isContainSymbol;
// 判断是否含有大写字母
- (BOOL)isContainUppercase;
// 判断密码是否符合要求
- (BOOL)isConform;
// 真实姓名
- (BOOL)isTrueName;

// 手机号码
- (BOOL)isMobileNumber;
// 邮箱
- (BOOL)isEmail;
// 身份证号码
- (BOOL)isIdentityCardNumber;
// 邮政编码
- (BOOL)isZipcode;
// QQ号码
- (BOOL)isQQNumber;

- (BOOL)isIPV4;

@end
