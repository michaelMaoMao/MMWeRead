//
//  TabBarController.m
//  微信读书
//
//  Created by MichaelMao on 16/10/1.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "TabBarController.h"
#import "DiscoverViewController.h"
#import "BookShelfViewController.h"
#import "ReviewViewController.h"
#import "UserProfileViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TabBarController ()

@property (nonatomic, strong) DiscoverViewController *discoverVC;
@property (nonatomic, strong) BookShelfViewController *bookShelfVC;
@property (nonatomic, strong) ReviewViewController *ideaVC;
@property (nonatomic, strong) UserProfileViewController *userProfileVC;

@end

@implementation TabBarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}

/**
 activeDisplayMode有以下两种
 NCWidgetDisplayModeCompact, // 收起模式
 NCWidgetDisplayModeExpanded, // 展开模式
 */
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    
    if(activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake(0, 110);
    } else {
        NSUserDefaults *sharedDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.wpf"];
        BOOL isHandleUnreadMessage = [sharedDefault boolForKey:@"kHandleUnreadMessage"];
        CGFloat height = isHandleUnreadMessage ? 200 : 310;
        self.preferredContentSize = CGSizeMake(0, height);
    }
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNewData);
}

// 取消widget默认的inset，让应用靠左
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}


//#pragma mark - Private Method
//- (void)setupUI {
//    // 未读消息
//    [self setupMessageContainer];
//    // 待办事件
//    [self setupTipsContainer];
//    // 按钮
//    [self setupButtonContainer];
//}

//- (void)setupMessageContainer {
//    UIView *messageContainer = [[UIView alloc] init];
//    [self.view addSubview:messageContainer];
//
//    // 跟本体进行信息交互
//    NSUserDefaults *sharedDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.wpf"];
//    BOOL isHandleUnreadMessage = [sharedDefault boolForKey:@"kHandleUnreadMessage"];
//    //    [sharedDefault setBool:YES forKey:@"kHandleUnreadMessage"];
//    if (isHandleUnreadMessage) {
//        return;
//    }
//
//    [messageContainer mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.top.equalTo(self.view);
//        make.height.mas_equalTo(110);
//    }];
//    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.text = @"未读消息";
//    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:13];
//    titleLabel.textColor = [UIColor colorWithWhite:20/255.0 alpha:1.0];
//    [messageContainer addSubview:titleLabel];
//    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.top.mas_equalTo(5);
//        make.height.mas_equalTo(30);
//        make.width.mas_equalTo(150);
//    }];
//
//    UIView *bgCover = [[UIView alloc] init];
//    bgCover.backgroundColor = [UIColor colorWithWhite:190/255.0 alpha:0.9];
//    [messageContainer addSubview:bgCover];
//    [bgCover mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(titleLabel);
//        make.top.mas_equalTo(35);
//        make.right.mas_equalTo(-10);
//        make.height.mas_equalTo(60);
//    }];
//
//    UIImageView *iconImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lyf.png"]];
//
//    [bgCover addSubview:iconImgView];
//    [iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.top.bottom.equalTo(bgCover);
//        make.width.height.equalTo(bgCover.mas_height);
//    }];
//
//    UILabel *messgeLabel = [[UILabel alloc] init];
//    messgeLabel.text = @"PM:在么？这里有个需求要改一下。";
//    messgeLabel.font = [UIFont fontWithName:@"PingFangSC-Normal" size:16];
//    [bgCover addSubview:messgeLabel];
//    [messgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(iconImgView.mas_trailing).offset(10);
//        make.trailing.equalTo(messageContainer);
//        make.centerY.equalTo(iconImgView);
//        make.height.mas_equalTo(30);
//    }];
//    UIView *separator1 = [[UIView alloc] init];
//    separator1.backgroundColor = [UIColor grayColor];
//    [messageContainer addSubview:separator1];
//    [separator1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.bottom.equalTo(messageContainer);
//        make.height.mas_equalTo(1);
//    }];
//
//    UITapGestureRecognizer *messageGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(messageGestureAction:)];
//    [messageContainer addGestureRecognizer:messageGesture];
//
//    self.messageContainer = messageContainer;
//}
//
//- (void)setupTipsContainer {
//    NSUserDefaults *sharedDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.wpf"];
//    BOOL isHandleUnreadMessage = [sharedDefault boolForKey:@"kHandleUnreadMessage"];
//    CGFloat containerH = isHandleUnreadMessage ? 0 : 110;
//    UIView *tipsContainer = [[UIView alloc] init];
//    [self.view addSubview:tipsContainer];
//    [tipsContainer mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(containerH);
//        make.leading.trailing.equalTo(self.view);
//        make.height.mas_equalTo(110);
//    }];
//
//    UILabel *titleLabel =[[UILabel alloc] init];
//    titleLabel.text = @"TO DO LIST:";
//    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:13];
//    titleLabel.textColor = [UIColor colorWithWhite:20/255.0 alpha:1.0];
//    [tipsContainer addSubview:titleLabel];
//    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.top.mas_equalTo(10);
//        make.height.mas_equalTo(20);
//        make.width.mas_equalTo(150);
//    }];
//
//    WPFAnimateView *tipsView = [[WPFAnimateView alloc] init];
//    [tipsContainer addSubview:tipsView];
//    [tipsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(titleLabel.mas_bottom);
//        make.leading.trailing.equalTo(self.view);
//        make.bottom.equalTo(tipsContainer);
//    }];
//    self.tipsView = tipsView;
//    UITapGestureRecognizer *tipsGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tipsGestureAction:)];
//    [tipsView addGestureRecognizer:tipsGesture];
//
//    UIView *separator2 = [[UIView alloc] init];
//    separator2.backgroundColor = [UIColor grayColor];
//    [tipsContainer addSubview:separator2];
//    [separator2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.bottom.equalTo(tipsContainer);
//        make.height.mas_equalTo(1);
//    }];
//
//    self.tipsContainer = tipsContainer;
//    self.isTipsContainerSelected = NO;
//}
//
//- (void)setupButtonContainer {
//    UIStackView *buttonContainer = [[UIStackView alloc] init];
//    buttonContainer.distribution = UIStackViewDistributionFillEqually;
//    [self.view addSubview:buttonContainer];
//    [buttonContainer mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.tipsContainer.mas_bottom).offset(10);
//        make.leading.trailing.equalTo(self.tipsContainer);
//        make.height.mas_equalTo(90);
//    }];
//    NSLog(@"%f", buttonContainer.frame.size.width);
//
//    UIButton *scanBtn = [self createButtonWithTitle:@"扫一扫" imageName:@"saoyisao"];
//    [scanBtn addTarget:self action:@selector(scanBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
//    [buttonContainer addArrangedSubview:scanBtn];
//
//    UIButton *punchCardBtn = [self createButtonWithTitle:@"打卡" imageName:@"zhangdan"];
//    [punchCardBtn addTarget:self action:@selector(punchCardBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
//    [buttonContainer addArrangedSubview:punchCardBtn];
//
//    UIButton *activityBtn = [self createButtonWithTitle:@"活动" imageName:@"chongzhi"];
//    [activityBtn addTarget:self action:@selector(activityBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
//    [buttonContainer addArrangedSubview:activityBtn];
//
//    UIButton *pindaoBtn = [self createButtonWithTitle:@"频道" imageName:@"fukuan"];
//    [pindaoBtn addTarget:self action:@selector(pindaoBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
//    [buttonContainer addArrangedSubview:pindaoBtn];
//}
//
//- (UIButton *)createButtonWithTitle:(NSString *)title imageName:(NSString *)imgName {
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setTitle:title forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:12];
//    CGFloat space = 45;
//    CGSize titleSize = button.titleLabel.intrinsicContentSize;
//    CGSize imgViewSize = button.imageView.frame.size;
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, -imgViewSize.width-33, -imgViewSize.height-space/2.0, 0);
//    button.imageEdgeInsets = UIEdgeInsetsMake(-titleSize.height-space/2.0, 0, 0, -titleSize.width);
//    return button;
//}
//
//
//
//#pragma mark - 跳转事件
//
//- (void)scanBtnTapped:(UIButton *)sender {
//    [self.extensionContext openURL:[NSURL URLWithString:@"wpfWidgetTest://action=richScan"] completionHandler:^(BOOL success) {
//        NSLog(@"scanBtnTapped   open url result:%d",success);
//    }];
//}
//
//- (void)punchCardBtnTapped:(UIButton *)sender {
//    [self.extensionContext openURL:[NSURL URLWithString:@"wpfWidgetTest://action=daka"] completionHandler:^(BOOL success) {
//        NSLog(@"punchCardBtnTapped    open url result:%d",success);
//    }];
//}
//
//- (void)activityBtnTapped:(UIButton *)sender {
//    [self.extensionContext openURL:[NSURL URLWithString:@"wpfWidgetTest://action=web"] completionHandler:^(BOOL success) {
//        NSLog(@"activityBtnTapped    open url result:%d",success);
//    }];
//}
//
//- (void)pindaoBtnTapped:(UIButton *)sender {
//    NSUserDefaults *sharedDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.wpf"];
//    [sharedDefault setBool:NO forKey:@"kHandleUnreadMessage"];
//
//    [self.extensionContext openURL:[NSURL URLWithString:@"wpfWidgetTest://action=pindao"] completionHandler:^(BOOL success) {
//        NSLog(@"pindaoBtnTapped   open url result:%d",success);
//    }];
//}
//
//// 跳转到未读消息页
//- (void)messageGestureAction:(UITapGestureRecognizer *)gesture {
//    [self.extensionContext openURL:[NSURL URLWithString:@"wpfWidgetTest://action=message"] completionHandler:^(BOOL success) {
//        NSLog(@"101   open url result:%d",success);
//    }];
//}
//
//- (void)tipsGestureAction:(UITapGestureRecognizer *)gesture {
//    [self.tipsView showSelectedAnimation];
//    if (self.isTipsContainerSelected) {
//        [self.tipsView hideIconAnimated:YES];
//        self.isTipsContainerSelected = NO;
//    } else {
//        [self.tipsView showIconAnimated:YES];
//        self.isTipsContainerSelected = YES;
//    }
//
//}
//
//
//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.translucent = false;
    [self createDataSource];
}

- (void)createDataSource{
    
    if (!_discoverVC) {
        _discoverVC = [[DiscoverViewController alloc] init];
        _discoverVC.tabBarItem.title = @"发现";
        _discoverVC.tabBarItem.image = [UIImage imageNamed:@"icon_tabbar_discover"];
    }
    if (!_bookShelfVC) {
        _bookShelfVC = [[BookShelfViewController alloc] init];
        _bookShelfVC.tabBarItem.title = @"书架";
        _bookShelfVC.tabBarItem.image = [UIImage imageNamed:@"icon_tabbar_bookshelf"];
    }
    if (!_ideaVC) {
        _ideaVC = [[ReviewViewController alloc] init];
        _ideaVC.tabBarItem.title = @"想法";
        _ideaVC.tabBarItem.image = [UIImage imageNamed:@"icon_tabbar_review"];
    }
    if (!_userProfileVC) {
        _userProfileVC = [[UserProfileViewController alloc] init];
        _userProfileVC.tabBarItem.title = @"我";
        _userProfileVC.tabBarItem.image = [UIImage imageNamed:@"icon_tabbar_profile"];
    }
    UINavigationController *naviC1 = [[UINavigationController alloc] initWithRootViewController:_discoverVC];
    UINavigationController *naviC2 = [[UINavigationController alloc] initWithRootViewController:_bookShelfVC];
    UINavigationController *naviC3 = [[UINavigationController alloc] initWithRootViewController:_ideaVC];
    UINavigationController *naviC4 = [[UINavigationController alloc] initWithRootViewController:_userProfileVC];
    naviC1.navigationBar.translucent = true;
    naviC3.navigationBar.translucent = true;
    
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:1]];
    [naviC1.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [naviC2.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [naviC3.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    naviC1.navigationBar.shadowImage = [UIImage new];
    //    naviC3.navigationBar.shadowImage = [UIImage new];
    
    self.viewControllers = @[naviC1, naviC2, naviC3, naviC4];
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
