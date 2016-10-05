//
//  AppMacros.h
//  Framework-iOS
//
//  Created by kiefer on 14-4-3.
//  Copyright (c) 2014年 kiefer. All rights reserved.
//

///---------------------------------------------------------------------------
/// @name Memory Management
///---------------------------------------------------------------------------
#define Free(obj) {if (obj) { free(obj); obj = NULL; } }
#define Release(obj) {if (obj) { [(obj) release]; obj = nil; } }
//#define CFRelease(_obj) { if (_obj) { CFRelease(_obj); _obj = NULL; } }

///---------------------------------------------------------------------------
/// @name Math Helpers
///---------------------------------------------------------------------------
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180) /** 角度转换成弧度 */
#define RADIANS_TO_DEGREES(r) (r * 180 / M_PI) /** 弧度转换成角度 */

///---------------------------------------------------------------------------
/// @name Creating colors
///---------------------------------------------------------------------------
#define RGB(r,g,b) \
[UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.f]
#define RGBA(r,g,b,a) \
[UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]

///---------------------------------------------------------------------------
/// @name Calling Delegates
///---------------------------------------------------------------------------
#define CALL_DELEGATE(_delegate, _selector) \
do { \
id _theDelegate = _delegate; \
if(_theDelegate != nil && [_theDelegate respondsToSelector:_selector]) { \
[_theDelegate performSelector:_selector]; \
} \
} while(0);

#define CALL_DELEGATE_WITH_ARG(_delegate, _selector, _argument) \
do { \
id _theDelegate = _delegate; \
if(_theDelegate != nil && [_theDelegate respondsToSelector:_selector]) { \
[_theDelegate performSelector:_selector withObject:_argument]; \
} \
} while(0);

#define CALL_DELEGATE_WITH_ARGS(_delegate, _selector, _arg1, _arg2) \
do { \
id _theDelegate = _delegate; \
if(_theDelegate != nil && [_theDelegate respondsToSelector:_selector]) { \
[_theDelegate performSelector:_selector withObject:_arg1 withObject:_arg2]; \
} \
} while(0);

///---------------------------------------------------------------------------
/// @name UIDevice Helpers
///---------------------------------------------------------------------------
#define IOS_3_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2)
#define IOS_4_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
#define IOS_5_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IOS_6_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IOS_7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS_9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#define isIPad       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isIPhone     [[UIDevice currentDevice].model isEqualToString:@"iPhone"]
#define isIPod       [[UIDevice currentDevice].model isEqualToString:@"iPod touch"]

#if TARGET_IPHONE_SIMULATOR//模拟器
#define isSimulator  true
#elif TARGET_OS_IPHONE//真机
#define isSimulator  false
#endif

#define iPhone4  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6P  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define SCREEN_WIDTH_IPHONE6  375.0f
#define SCREEN_HEIGHT_IPHONE6 667.0f

#define SCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height
#define SCREEN_SCALE      [UIScreen mainScreen].scale
#define STATUSBAR_HEIGHT  20.0f
#define NAVBAR_HEIGHT     64.0f
#define TABBAR_HEIGHT     self.rdv_tabBarController.tabBar.bounds.size.height
#define ONE_PIXEL         1.0f / [UIScreen mainScreen].scale

#define UserDefaults            [NSUserDefaults standardUserDefaults]
#define Format(string, args...) [NSString stringWithFormat:string, args]
#define systemFontFitToSize(fontSize) (iPhone4 || iPhone5) ? [UIFont systemFontOfSize:(fontSize - 2)] : [UIFont systemFontOfSize:(fontSize)];

#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[NSBundle mainBundle] pathForResource:file ofType:ext]
#define IMAGE(A) [UIImage imageWithContentsOfFile:[NSBundle mainBundle] pathForResource:A ofType:nil]
