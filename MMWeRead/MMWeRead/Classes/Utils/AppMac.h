//
//  AppMac.h
//  GlobalScanner
//
//  Created by wangjie on 15/5/29.
//  Copyright (c) 2015年 Neo Yang. All rights reserved.
//

#define HEXCOLOR(c)                         [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0];
#define F(string, args...)                  [NSString stringWithFormat:string, args]
#define Font(CGFloat)                       [UIFont systemFontOfSize:(CGFloat)]
#define NSNumberWithBool(b)                 [NSNumber numberWithBool:b]
//#define ALERT(title, msg)                   [[[UIAlertView alloc]     initWithTitle:title\
//message:msg\
//delegate:nil\
//cancelButtonTitle:@"OK"\
//otherButtonTitles:nil] show]

#define DocumentsPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0]
#define CachesPath    [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0]


//#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define AppName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]
#define AppIdentifier [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define DeviceMode [[UIDevice currentDevice] model]


// DEVICE DETECTION
#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)
#define IS_IPHONE (!IS_IPAD)
#define IS_IPHONE_5 ( IS_IPHONE && IS_WIDESCREEN )

// DEVICE VERSION
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define iOS7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define iOS8 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

#define CLIENT_TYPE @"1"
#define GGJCacheDirectory [CachesPath stringByAppendingPathComponent:@"GGJCacheDirectory"]

//通知
#define CarryMoneyLoadData @"CarryMoneyLoadData"
#define CarryMoneySelectLoadData @"CarryMoneySelectLoadData"
#define SetTakeDeliveryOfGoodsAddressNo @"SetTakeDeliveryOfGoodsAddressNo"
#define SubmitOrderWithChangeAddress @"SubmitOrderWithChangeAddress"
