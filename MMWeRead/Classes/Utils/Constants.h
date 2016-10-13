//
//  Constants.h
//  GlobalScanner
//
//  Created by kiefer on 13-11-6.
//  Copyright (c) 2013年 windo-soft. All rights reserved.
//

#ifndef ___Constants_h
#define ___Constants_h

static const CGFloat SDWebImageFadeDuration = 0.6;

////////////////////////////////////////////////////////////////////////////////////////////////////

#define ALERT_TAG_ADDRESS    3010

////////////////////////////////////////////////////////////////////////////////////////////////////

#define RSP_CODE_SUCCESS 200
#define RSP_CODE_ERROR   201

////////////////////////////////////////////////////////////////////////////////////////////////////

#define color_navibar            [UIColor colorWithHex:0x000000] //导航背景色
#define color_back               [UIColor colorWithHex:0xf2f3f4] //背景色
#define color_line               [UIColor colorWithHex:0xE0E0E0] //分隔线
#define color_black              [UIColor colorWithHex:0x2c3038] //字体颜色
#define color_red                [UIColor colorWithHex:0xf11b1d] //现价字体颜色
#define color_gray               [UIColor colorWithHex:0x63666b] //原价字体颜色
#define color_lightGray          [UIColor colorWithHex:0x92969c] //字体颜色
#define color_barline            [UIColor colorWithHex:0xd2d2d2] //线条颜色
#define color_header             [UIColor colorWithHex:0xE8E8E8] //标题颜色
#define color_address            [UIColor colorWithHex:0x5e6b85] //地址颜色
#define color_banner             [UIColor colorWithHex:0xf5f5f5] //默认图片背景色
#define color_indicator          [UIColor colorWithHex:0x92969c] //菊花颜色
#define color_grayline           [UIColor colorWithHex:0x858585] //灰线颜色
#define color_naviTitle          [UIColor colorWithRed:27/255.f green:136/255.f blue:238/255.f alpha:1.f]
#define color_naviTitle_alpha(alpha)     [UIColor colorWithRed:27/255.f green:136/255.f blue:238/255.f alpha:alpha]

////////////////////////////////////////////////////////////////////////////////////////////////////

#define FONT_HWXH(fontSize) [UIFont fontWithName:@"STHeitiTC-Medium" size:(fontSize)]
#define FONT_TIME(fontSize) [UIFont fontWithName:@"HelveticaNeue-Medium" size:(fontSize)]
#define FONT_V(fontSize)    [UIFont fontWithName:@"BodebeckLTStd-BoldItalic" size:(fontSize)]

#endif
