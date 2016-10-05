//
//  AboutMeViewController.m
//  微信读书
//
//  Created by MichaelMao on 16/10/1.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "UserProfileViewController.h"
#import "UserProfileTableViewCell.h"

@interface UserProfileViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *naviLineView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerbackView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation UserProfileViewController


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _tableView.frame = self.view.bounds;
    
    for (UIView *subView in _tableView.subviews) {
        if ([NSStringFromClass([subView class]) isEqualToString:@"UITableViewWrapperView"]) {
            subView.frame = self.view.bounds;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self createDataSource];
    [self createDataSource];
    [self.tableView reloadData];
    CGFloat contentHeight = self.tableView.contentSize.height;
    _tableView.scrollEnabled = (contentHeight > self.tableView.height);
}

- (void)setupUI{
    self.title = @"我";
    UIImageView *naviBackView = self.navigationController.navigationBar.subviews.firstObject;
    for (UIImageView *view in naviBackView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            if (!_naviLineView) {
                _naviLineView = view;
            }
        }
    }
    
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc] init];
    messageItem.image = [UIImage imageNamed:@"icon_profile_message"];
    self.navigationItem.leftBarButtonItem = messageItem;
    
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] init];
    settingItem.image = [UIImage imageNamed:@"icon_profile_setting"];
    self.navigationItem.rightBarButtonItem = settingItem;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
    _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height - self.tabBarController.tabBar.height);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.contentInset = UIEdgeInsetsMake(NAVBAR_HEIGHT, 0, 0, 0);
    [_tableView registerClass:[UserProfileTableViewCell class] forCellReuseIdentifier:NSStringFromClass([UserProfileTableViewCell class])];
    [self.view addSubview:_tableView];
    [self.tableView setTableHeaderView:[self tableHeaderView]];
    
    
    CGFloat headerBackHeight = _tableView.tableHeaderView.height + self.navigationController.navigationBar.bottom;
    if (!_headerbackView) {
        _headerbackView = [[UIView alloc] init];
        _headerbackView.frame = CGRectMake(0, 0, self.tableView.width, headerBackHeight);
        _headerbackView.backgroundColor = [UIColor whiteColor];
        [self.view insertSubview:_headerbackView atIndex:0];
    }
}

- (UIView *)tableHeaderView{

    UIView *tableHeaderView = [[UIView alloc] init];
    tableHeaderView.frame = CGRectMake(0, 0, _tableView.width, 150);
    tableHeaderView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *avatarImageView = [[UIImageView alloc] init];
    avatarImageView.frame = CGRectMake(_tableView.width/2 - 80/2, 15, 80, 80);
    avatarImageView.image = [UIImage imageNamed:@"avatar_default"];
    avatarImageView.backgroundColor = [UIColor clearColor];
    avatarImageView.layer.masksToBounds = true;
    avatarImageView.layer.cornerRadius = avatarImageView.height/2;
    [tableHeaderView addSubview:avatarImageView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, avatarImageView.bottom + 15, _tableView.width, 15);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = HEXCOLOR(0x858585);
    titleLabel.font = [UIFont systemFontOfSize:14.0];
    titleLabel.text = @"编辑个人资料";
    [tableHeaderView addSubview:titleLabel];
    
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, tableHeaderView.height - 0.5, tableHeaderView.width, 0.5);
    line.backgroundColor = [UIColor lightGrayColor];
    [tableHeaderView addSubview:line];
    
    return tableHeaderView;
}

- (void)createDataSource{

    if (_dataSource) {
        _dataSource = [NSArray array];
    }
    
    _dataSource = @[
                    @[@{@"icon" : @"icon_profile_account", @"title" : @"账户", @"detailText" : @"11.43", @"subDetailText" : @"已购1本书"},
                      @{@"icon" : @"icon_profile_friends", @"title" : @"好友排名", @"detailText" : @"第1名", @"subDetailText" : @"2小时21分钟"}],
                    @[@{@"icon" : @"icon_profile_review", @"title" : @"笔记", @"detailText" : @"1本", @"subDetailText" : @"0个赞0个评论"},
                      @{@"icon" : @"icon_profile_favorite", @"title" : @"收藏", @"detailText" : @"0本", @"subDetailText" : @""},
                      @{@"icon" : @"icon_profile_recommend", @"title" : @"关注", @"detailText" : @"2人关注我", @"subDetailText" : @"已关注0人",}],
                    ];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSource[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserProfileTableViewCell class])];
    cell.backgroundColor = [UIColor whiteColor];
    cell.model = _dataSource[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135.0/2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  15.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == [_dataSource count] - 1) {
        return 15.0;
    }
    return  CGFLOAT_MIN;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat contentOffSetY = self.tableView.contentOffset.y;
    CGFloat startAlphaOffset = - NAVBAR_HEIGHT;
    CGFloat AlphaRange = NAVBAR_HEIGHT;
    CGFloat alpha =  (contentOffSetY - startAlphaOffset)/ AlphaRange;
    if (alpha < 0) {
        alpha = 0;
    }
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    _naviLineView.alpha = alpha;

    CGFloat headerBackHeight = _tableView.tableHeaderView.height + self.navigationController.navigationBar.bottom;
    _headerbackView.height = headerBackHeight - contentOffSetY - NAVBAR_HEIGHT;
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
