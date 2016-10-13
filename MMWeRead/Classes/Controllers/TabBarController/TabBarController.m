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

@interface TabBarController ()

@property (nonatomic, strong) DiscoverViewController *discoverVC;
@property (nonatomic, strong) BookShelfViewController *bookShelfVC;
@property (nonatomic, strong) ReviewViewController *ideaVC;
@property (nonatomic, strong) UserProfileViewController *userProfileVC;

@end

@implementation TabBarController

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
