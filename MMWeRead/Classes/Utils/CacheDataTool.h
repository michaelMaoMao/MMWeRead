//
//  DataPersistenceTool.h
//  gegejia
//
//  Created by wangjie on 15/9/7.
//  Copyright (c) 2015年 Neo Yang. All rights reserved.
//  储存到NSCachesDirectory文件下的工具

#import <Foundation/Foundation.h>

@interface CacheDataTool : NSObject

/** 是否存在缓存文件 */
+ (BOOL)isExistData:(NSString *)path;

/** 将缓存文件写入*/
+ (BOOL)writeDataToFile:(NSString *)path data:(id)data;

/** 读取缓存文件 */
+ (id)readData:(NSString *)path;
+ (void)readData:(NSString *)path success:(void(^)(id data))success;

/** 删除缓存文件 */
+ (BOOL)removeData;

@end
