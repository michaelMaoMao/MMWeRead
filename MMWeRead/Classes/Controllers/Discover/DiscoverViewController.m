//
//  DiscoverViewController.m
//  微信读书
//
//  Created by MichaelMao on 16/10/1.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverCollectionCell.h"

@interface DiscoverViewController () <UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
 
    UICollectionView *mCollectionView;
    UICollectionViewFlowLayout *flowLayout;
}

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI{
    self.title = @"发现";
    self.automaticallyAdjustsScrollViewInsets = false;
    
    CGFloat tabBarHeight = self.tabBarController.tabBar.height;
    
    flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 15;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);

    CGRect frame = CGRectMake(0, NAVBAR_HEIGHT, self.view.width, self.view.height - NAVBAR_HEIGHT - tabBarHeight);
    mCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    mCollectionView.delegate = self;
    mCollectionView.dataSource = self;
    mCollectionView.backgroundColor = [UIColor clearColor];
    mCollectionView.showsHorizontalScrollIndicator = false;
    mCollectionView.showsVerticalScrollIndicator = false;
    [self.view addSubview:mCollectionView];
    
    [mCollectionView registerClass:[DiscoverCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([DiscoverCollectionCell class])];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DiscoverCollectionCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat cellHeight = mCollectionView.height - 10*2;
    return CGSizeMake(mCollectionView.width - (flowLayout.sectionInset.left + flowLayout.minimumLineSpacing)*2, cellHeight);
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
