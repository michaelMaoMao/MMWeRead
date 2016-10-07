//
//  BookshelfViewController.m
//  微信读书
//
//  Created by MichaelMao on 16/10/1.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "BookshelfViewController.h"
#import "BookShelfCollectionViewCell.h"

@interface BookshelfViewController () <UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {

    UICollectionView *mCollection;
    UICollectionViewFlowLayout *flowLayout;
}

@property (nonatomic, strong) UIImageView *naviLineView;

@end

@implementation BookshelfViewController

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    mCollection.frame = self.view.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI{
    self.title = @"书架";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *naviBackView = self.navigationController.navigationBar.subviews.firstObject;
    for (UIImageView *view in naviBackView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            if (!_naviLineView) {
                _naviLineView = view;
            }
        }
    }
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] init];
    editItem.title = @"编辑";
    UIBarButtonItem *bookShopItem = [[UIBarButtonItem alloc] init];
    bookShopItem.title = @"书城";
    self.navigationItem.leftBarButtonItem = editItem;
    self.navigationItem.rightBarButtonItem = bookShopItem;
    
    flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 15;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
    flowLayout.itemSize = CGSizeMake(180/2, 310/2);
    
    mCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - NAVBAR_HEIGHT - self.tabBarController.tabBar.height) collectionViewLayout:flowLayout];
    mCollection.contentInset = UIEdgeInsetsMake(flowLayout.minimumLineSpacing, 0, 0, 0);
    mCollection.delegate = self;
    mCollection.dataSource = self;
    mCollection.backgroundColor = [UIColor clearColor];
    [mCollection registerClass:[BookShelfCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([BookShelfCollectionViewCell class])];
    [mCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
    [self.view addSubview:mCollection];
}



#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BookShelfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BookShelfCollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat contentOffSetY = mCollection.contentOffset.y;
    CGFloat startAlphaOffset = - mCollection.contentInset.top;
    CGFloat AlphaRange = flowLayout.minimumLineSpacing;
    CGFloat alpha =  (contentOffSetY - startAlphaOffset)/ AlphaRange;
    
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    _naviLineView.alpha = (contentOffSetY - startAlphaOffset)/ AlphaRange;
}

// 设定页脚的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(mCollection.width, 40);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqual:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *sectionFooterView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([UICollectionReusableView class]) forIndexPath:indexPath];
        sectionFooterView.backgroundColor = [UIColor whiteColor];
        
        UILabel *footerLabel = [[UILabel alloc] init];
        footerLabel.frame = CGRectMake(0, 10, 340/2, 20);
        footerLabel.centerX = sectionFooterView.centerX;
        footerLabel.textColor = HEXCOLOR(0x858585);
        footerLabel.font = [UIFont systemFontOfSize:12.0];
        footerLabel.text = @"4本公开阅读·1本私密阅读";
        footerLabel.backgroundColor = [UIColor whiteColor];
        footerLabel.textAlignment = NSTextAlignmentCenter;
        [sectionFooterView addSubview:footerLabel];

        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(25, footerLabel.centerY - 0.5/2, sectionFooterView.width - 50, 0.5);
        line.backgroundColor = HEXCOLOR(0x858585);
        [sectionFooterView insertSubview:line atIndex:0];
        return sectionFooterView;
    }
    return nil;
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
