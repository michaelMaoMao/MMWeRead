//
//  IdeaViewController.m
//  微信读书
//
//  Created by MichaelMao on 16/10/1.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "ReviewViewController.h"
#import "ReviewListViewController.h"

@interface ReviewViewController () <UIScrollViewDelegate>{
    UIButton *followBtn;
    UIButton *ideaBtn;
}

@property (nonatomic, strong) UIScrollView *mScrollView;
@property (nonatomic, strong) ReviewListViewController *ideaListVC;

@end

@implementation ReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.automaticallyAdjustsScrollViewInsets = false;
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat naviHeight = self.navigationController.navigationBar.height;
    CGFloat scrollViewHeight = self.view.height - NAVBAR_HEIGHT - self.tabBarController.tabBar.height;
    UIColor *highLightColor = RGB(27, 136, 238);
    
    UIBarButtonItem *writeItem = [[UIBarButtonItem alloc] init];
    writeItem.image = [UIImage imageNamed:@"icon_profile_review"];
    self.navigationItem.rightBarButtonItem = writeItem;
    
    
    UIView *tabbar = [[UIView alloc] init];
    tabbar.frame = CGRectMake(0, 0, 360/2, naviHeight);
    tabbar.centerY = naviHeight/2;
    tabbar.centerX = self.navigationController.navigationBar.centerX;
    tabbar.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar addSubview:tabbar];
    
    followBtn = [[UIButton alloc] init];
    followBtn.frame = CGRectMake(0, 0, tabbar.width/2, tabbar.height);
    [followBtn setBackgroundColor:[UIColor clearColor]];
    [followBtn setTitle:@"关注的人" forState:UIControlStateNormal];
    [followBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [followBtn setTitleColor:highLightColor forState:UIControlStateHighlighted];
    [followBtn setTitleColor:highLightColor forState:UIControlStateSelected];
    [followBtn addTarget:self action:@selector(didSelelectTabBarItem:) forControlEvents:(UIControlEventTouchUpInside)];
    [tabbar addSubview:followBtn];
    
    ideaBtn = [[UIButton alloc] init];
    ideaBtn.frame = CGRectMake(followBtn.right, 0, tabbar.width/2, tabbar.height);
    [ideaBtn setBackgroundColor:[UIColor clearColor]];
    [ideaBtn setTitle:@"精选想法" forState:UIControlStateNormal];
    [ideaBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [ideaBtn setTitleColor:highLightColor forState:UIControlStateHighlighted];
    [ideaBtn setTitleColor:highLightColor forState:UIControlStateSelected];
    [ideaBtn addTarget:self action:@selector(didSelelectTabBarItem:) forControlEvents:(UIControlEventTouchUpInside)];
    [tabbar addSubview:ideaBtn];
    
    _mScrollView = [[UIScrollView alloc] init];
    _mScrollView.frame = CGRectMake(0, NAVBAR_HEIGHT, self.view.width, scrollViewHeight);
    _mScrollView.delegate = self;
    _mScrollView.pagingEnabled = true;
    _mScrollView.backgroundColor = RGB(244, 246, 248);
    _mScrollView.showsHorizontalScrollIndicator = false;
    _mScrollView.showsVerticalScrollIndicator = true;
    _mScrollView.contentSize = CGSizeMake(self.view.width * 2, 0);
    
    [self.view addSubview:_mScrollView];
    
    [followBtn setSelected:true];
    followBtn.titleLabel.font = [UIFont boldSystemFontOfSize:followBtn.titleLabel.font.pointSize];
    
    _ideaListVC = [[ReviewListViewController alloc] init];
    _ideaListVC.view.frame = CGRectMake(self.view.width, 0, self.view.width, _mScrollView.height);
    [_mScrollView addSubview:_ideaListVC.view];
    [self addChildViewController:_ideaListVC];
}



- (void)didSelelectTabBarItem:(UIButton *)button{
    followBtn.selected = false;
    ideaBtn.selected = false;
    button.selected = true;
    followBtn.titleLabel.font = [UIFont systemFontOfSize:followBtn.titleLabel.font.pointSize];
    ideaBtn.titleLabel.font = [UIFont systemFontOfSize:ideaBtn.titleLabel.font.pointSize];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:button.titleLabel.font.pointSize];
    CGFloat contentOffsetWidth = (ideaBtn.isSelected?1:0) * self.view.width;
    CGPoint offset = CGPointMake(contentOffsetWidth, 0);
    [self.mScrollView setContentOffset:offset animated:true];
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat contentOffsetX = _mScrollView.contentOffset.x;
    if (contentOffsetX >= self.view.width) {
        followBtn.selected = false;
        ideaBtn.selected = true;
        followBtn.titleLabel.font = [UIFont systemFontOfSize:followBtn.titleLabel.font.pointSize];
        ideaBtn.titleLabel.font = [UIFont boldSystemFontOfSize:ideaBtn.titleLabel.font.pointSize];
    }else{
        followBtn.selected = true;
        ideaBtn.selected = false;
        followBtn.titleLabel.font = [UIFont boldSystemFontOfSize:followBtn.titleLabel.font.pointSize];
        ideaBtn.titleLabel.font = [UIFont systemFontOfSize:ideaBtn.titleLabel.font.pointSize];
    }
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
