//
//  BookShopViewController.m
//  MMWeRead
//
//  Created by MichaelMao on 16/10/13.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "BookMarketViewController.h"
#import "UserProfileBookCollectionCell.h"

static const CGFloat sectionHeaderHeight = 20;
@interface BookMarketViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *mCollection;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UIImageView *naviLineView;

@end

@implementation BookMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI{
    
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] init];
    closeItem.title = @"关闭";
    closeItem.target = self;
    closeItem.action = @selector(closeBookMarket);
    self.navigationItem.rightBarButtonItem = closeItem;
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame = CGRectMake(15, 0, self.view.width - 44 - 15*2, self.navigationController.navigationBar.height);
    searchBar.backgroundColor = [UIColor clearColor];
    searchBar.placeholder = @"搜索书城";
    UITextField *searchField=[searchBar valueForKey:@"_searchField"];
    searchField.borderStyle = UITextBorderStyleNone;
    searchField.layer.borderWidth = 1;
    searchField.layer.borderColor = [color_line CGColor];
    searchField.layer.cornerRadius = 4.0;
    //改变placeholder的颜色
    [searchField setValue:color_grayline forKeyPath:@"_placeholderLabel.textColor"];
    [self.navigationController.navigationBar addSubview:searchBar];
    
    UIImageView *naviBackView = self.navigationController.navigationBar.subviews.firstObject;
    for (UIImageView *view in naviBackView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            if (!_naviLineView) {
                _naviLineView = view;
            }
        }
    }

    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _flowLayout.minimumLineSpacing = 10;
    _flowLayout.minimumInteritemSpacing = 15;
    CGFloat itemWith = (self.view.width - 15*5)/4;
    _flowLayout.itemSize = CGSizeMake(itemWith, UserProfileBookRankItemHeight);
    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
    _mCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
    _mCollection.frame = CGRectMake(0, 0, self.view.width, self.view.height - NAVBAR_HEIGHT);
    _mCollection.delegate = self;
    _mCollection.dataSource = self;
    _mCollection.backgroundColor = [UIColor whiteColor];
    [_mCollection registerClass:[UserProfileBookCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([UserProfileBookCollectionCell class])];
    [_mCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
    [_mCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
    [self.view addSubview:_mCollection];
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UserProfileBookCollectionCell *cell = [_mCollection dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UserProfileBookCollectionCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *sectionHeader = [_mCollection dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionReusableView class]) forIndexPath:indexPath];
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(_flowLayout.sectionInset.left, 0, sectionHeader.width - _flowLayout.sectionInset.left - _flowLayout.sectionInset.right, 20);
        titleLabel.backgroundColor = [UIColor clearColor];
        CGSize headerSize = [self collectionView:collectionView layout:_flowLayout referenceSizeForHeaderInSection:indexPath.section];
        titleLabel.centerY = headerSize.height/2;
        titleLabel.font = [UIFont systemFontOfSize:16.0];
        titleLabel.textColor = [UIColor darkTextColor];
        titleLabel.text = @"推荐专题";
        [sectionHeader addSubview:titleLabel];
        return sectionHeader;
    }else if (UICollectionElementKindSectionFooter){
        UICollectionReusableView *sectionFooter = [_mCollection dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionReusableView class]) forIndexPath:indexPath];
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(_flowLayout.sectionInset.left, 0, sectionFooter.width - _flowLayout.sectionInset.left - _flowLayout.sectionInset.right, 20);
        titleLabel.backgroundColor = [UIColor clearColor];
        CGSize footerSize = [self collectionView:collectionView layout:_flowLayout referenceSizeForHeaderInSection:indexPath.section];
        titleLabel.centerY = footerSize.height/2;
        titleLabel.font = [UIFont systemFontOfSize:14.0];
        titleLabel.textColor = color_gray;
        titleLabel.text = @"查看以往104期专题 >";
        [sectionFooter addSubview:titleLabel];
        UIView *footerLine = [[UIView alloc] init];
        footerLine.frame = titleLabel.frame;
        footerLine.height = 0.5;
        footerLine.top = sectionFooter.height - footerLine.height;
        footerLine.backgroundColor = color_line;
        [sectionFooter addSubview:footerLine];
        return sectionFooter;
    }else{
        return nil;
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(_mCollection.width, 85/2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(_mCollection.width, 90/2);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat contentOffsetY = _mCollection.contentOffset.y;
    CGFloat startAlphaOffset = - _mCollection.contentInset.top;
    CGFloat AlphaRange = sectionHeaderHeight;
    CGFloat alpha =  (contentOffsetY - startAlphaOffset)/ AlphaRange;
    
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    _naviLineView.alpha = (contentOffsetY - startAlphaOffset)/ AlphaRange;
}


#pragma mark - Action

- (void)closeBookMarket{
    [self dismissViewControllerAnimated:true completion:nil];
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
