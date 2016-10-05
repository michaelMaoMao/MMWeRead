//
//  NSString+Ext.h
//  GlobalScanner
//
//  Created by kiefer on 15/11/20.
//  Copyright © 2015年 Neo Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Ext)

// 过滤表情符号
- (BOOL)containsEmoji;
// 根据最大长度截断字符串 在行尾加上...
- (NSString *)lineBreakByTruncatingTail:(CGFloat)maxWidth font:(UIFont *)font;

@end
