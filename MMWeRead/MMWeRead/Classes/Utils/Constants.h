//
//  Constants.h
//  GlobalScanner
//
//  Created by kiefer on 13-11-6.
//  Copyright (c) 2013年 windo-soft. All rights reserved.
//

#ifndef ___Constants_h
#define ___Constants_h

//////////////////////////////////////////////////////////////////////////////////////////////////////

static NSString *const kOrderStatusDidChangeNotification = @"kOrderStatusDidChangeNotification";

static NSString *const kCartGoodsCountDidChangeNotification = @"kCartGoodsCountDidChangeNotification";

static NSString *const kGoodsStatusDidChangeNotification = @"kGoodsStatusDidChangeNotification";
static NSString *const kCollectStatusOnChangedNotification = @"kCollectStatusOnChangedNotification";
static NSString *const kGoodsCollectStatusOnChangedNotification = @"kGoodsCollectStatusOnChangedNotification";

static NSString *const kHomeRefreshTopbarNotification = @"kHomeRefreshTopbarNotification";
static NSString *const kHomeRefreshNotification = @"kHomeRefreshNotification";
static NSString *const kShoppingCartRefreshNotification = @"kShoppingCartRefreshNotification";

static NSString *const kSettingNotifyStatusRefreshNotification = @"kSettingNotifyStatusRefreshNotification";

static NSString *const kLivePlayerLoadData = @"kLivePlayerLoadData";

static NSString *const kCollectLaterSaleMessage = @"收藏成功，开抢前5分钟将会有推送提醒~";
static NSString *const kGoodsHaveChanceMessage = @"该商品有人未付款，你还有机会！试着下拉刷新看看吧~";

static const CGFloat SDWebImageFadeDuration = 0.6;
static const int maxMemberLevel = 7; //最高的会员等级
static const int kMemberLevelFreePost = 4; //会员等级大于等于4免邮费
static const int vipServiceLevel = 3; //vip客服会员等级
static const int E_PAGE_SIZE = 20; //每页条数
static const CGFloat kBottomBarHeight = 47.0; //底部工具栏高度

////////////////////////////////////////////////////////////////////////////////////////////////////

#define ALERT_TAG_ADDRESS    3010
#define ALERT_TAG_CONFIRM    3011
#define ALERT_TAG_COPY       3012
#define ALERT_TAG_APPSTORE   3021
#define ALERT_TAG_APPSTORE1  3022
#define ALERT_TAG_APPSTORE2  3023

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

////////////////////////////////////////////////////////////////////////////////////////////////////

#define FONT_HWXH(fontSize) [UIFont fontWithName:@"STHeitiTC-Medium" size:(fontSize)]
#define FONT_TIME(fontSize) [UIFont fontWithName:@"HelveticaNeue-Medium" size:(fontSize)]
#define FONT_V(fontSize)    [UIFont fontWithName:@"BodebeckLTStd-BoldItalic" size:(fontSize)]

#endif
