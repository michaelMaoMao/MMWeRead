//
//  IdeaListViewController.m
//  微信读书
//
//  Created by MichaelMao on 16/10/4.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "ReviewListViewController.h"
#import "ReviewTableViewCell.h"

@interface ReviewListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ReviewListViewController

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
}

- (void)setupUI{

    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = RGB(244, 246, 248);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[ReviewTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ReviewTableViewCell class])];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 420;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ReviewTableViewCell class])];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
