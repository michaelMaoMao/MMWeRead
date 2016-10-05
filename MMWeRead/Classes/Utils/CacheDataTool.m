//
//  DataPersistenceTool.m
//  gegejia
//
//  Created by wangjie on 15/9/7.
//  Copyright (c) 2015年 Neo Yang. All rights reserved.
//

#import "CacheDataTool.h"
#import "AppMac.h"

@implementation CacheDataTool

+ (BOOL)createDirectory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:GGJCacheDirectory]) {
        return [fileManager createDirectoryAtPath:GGJCacheDirectory withIntermediateDirectories:NO attributes:nil error:NULL];
    }
    return YES;
}

+ (BOOL)writeDataToFile:(NSString *)path data:(id)data {
    if ([self createDirectory]) {
        NSString *pahtName = [GGJCacheDirectory stringByAppendingPathComponent:path];
        return [NSKeyedArchiver archiveRootObject:data toFile:pahtName];
    }
    return NO;
}

+ (id)readData:(NSString *)path {
    NSString *pahtName = [GGJCacheDirectory stringByAppendingPathComponent:path];
    id model = [NSKeyedUnarchiver unarchiveObjectWithFile:pahtName];
    return model;
}

+ (void)readData:(NSString *)path success:(void(^)(id data))success {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        id model = [self readData:path];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (model) success(model);
        });
    });
}

+ (BOOL)isExistData:(NSString *)path {
    NSString *pahtName = [GGJCacheDirectory stringByAppendingPathComponent:path];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:pahtName];
}

+ (BOOL)removeData {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:GGJCacheDirectory]) return [fileManager removeItemAtPath:GGJCacheDirectory error:nil];
    return YES;
}

@end
