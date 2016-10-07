//
//  NSString+Crypto.m
//  Framework-iOS
//
//  Created by Teng Kiefer on 12-7-9.
//  Copyright (c) 2012年 DB-Interactive. All rights reserved.
//

#import "NSString+Crypto.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import "NSData+Crypto.h"

@implementation NSString (Crypto)

- (NSString *)MD5EncodedString
{
	return [[self dataUsingEncoding:NSUTF8StringEncoding] MD5EncodedString];
}

- (NSString *)URLEncodedUTF8String
{
    if (self && [self length]) {
        return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    return self;
}

- (NSString *)URLDecodedUTF8String
{
    if (self && [self length]) {
        return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    return self;
}

- (NSData *)HMACSHA1EncodedDataWithKey:(NSString *)key
{
	return [[self dataUsingEncoding:NSUTF8StringEncoding] HMACSHA1EncodedDataWithKey:key];
}

@end
