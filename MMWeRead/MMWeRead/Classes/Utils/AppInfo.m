//
//  AppInfo.m
//  GlobalScanner
//
//  Created by kiefer on 14-9-22.
//  Copyright (c) 2014年 kiefer. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

// 应用程序版本号
+ (NSString *)version {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    if ([version length] > 0) {//由于在提交App版本1.2.1提交成1.21，版本号过大，所以版本在本地转换处理,在2.0后恢复正常
        NSMutableString *tempString = [NSMutableString string];
        NSArray *arr = [version componentsSeparatedByString:@"."];
        if ([arr count] > 0) {
            for (int i = 0; i < [arr count]; i++) {
                if (i == 0) {
                    [tempString appendString:arr[0]];
                    [tempString appendString:@"."];
                } else if(i == 1){//针对本地类似1.22版本小数点后的二位处理成1.2.2，但是不兼容类似1.10.1版本
                    NSString *subStr = arr[1];
                    if(subStr.length == 2){
                        [tempString appendString:[arr[1] substringWithRange:NSMakeRange(0, 1)]];
                        [tempString appendString:@"."];
                        [tempString appendString:[arr[1] substringWithRange:NSMakeRange(1, 1)]];
                    }else{
                        [tempString appendString:arr[1]];
                    }
                }else {
                    [tempString appendString:arr[i]];
                }
            }
            return tempString;
        }
    }
    return version;
}

// 应用程序名称
+ (NSString *)name {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

// 应用程序id
+ (NSString *)identifier {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleIdentifier"];
}

// 网络请求版本号
+ (NSString *)networkVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    if ([version length] > 0) {
        NSMutableString *tempString = [NSMutableString string];
        NSArray *arr = [version componentsSeparatedByString:@"."];
        if ([arr count] > 0) {
            for (int i = 0; i < [arr count]; i++) {
                if (i == 0) {
                    [tempString appendString:arr[0]];
                    [tempString appendString:@"."];
                } else {
                    [tempString appendString:arr[i]];
                }
            }
            return tempString;
        }
    }
    return version;
}

@end
