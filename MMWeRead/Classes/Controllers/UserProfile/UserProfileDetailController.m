//
//  UserProfileDetailController.m
//  MMWeRead
//
//  Created by MichaelMao on 16/10/8.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "UserProfileDetailController.h"
#import "UserProfileHeaderView.h"
#import "YHRollTabBar.h"
#import "UserProfileBookCollectionCell.h"
#import "ReviewTableViewCell.h"
#import "CommentTableViewCell.h"
#import "Review.h"

static const CGFloat tableHeaderViewHeight = 555.0/2;

@interface UserProfileDetailController () <UITableViewDelegate, UITableViewDataSource, YHRollTabBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate>{
    UserProfileHeaderView *userProfileHeaderView;
    YHRollTabBar *tabBar;
    UICollectionView *bookCollection;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *naviLineView;
@property (nonatomic, copy) NSArray *titles;
@property (nonatomic, copy) NSArray *sectionTitles;
@property (nonatomic, copy) NSArray *books;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) NSMutableArray *reviewList;

@end

@implementation UserProfileDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titles = @[@"最近阅读", @"读完1本"];
    _sectionTitles = @[@"书评", @"想法"];
    _books = @[@[@1, @2, @3, @4, @5], @[@1]];
    [self setupUI];
    [self createDataSource];
}

- (void)setupUI{
    self.title = @"MichaelMao";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor whiteColor]};
    self.automaticallyAdjustsScrollViewInsets = false;
    UIImageView *naviBackView = self.navigationController.navigationBar.subviews.firstObject;
    
//    self.navigationController.navigationBar.translucent = false;
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    for (UIImageView *view in naviBackView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            if (!_naviLineView) {
                _naviLineView = view;
            }
        }
    }

    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
    _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height - self.tabBarController.tabBar.height);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[ReviewTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ReviewTableViewCell class])];
    [self.view addSubview: _tableView];
    
    userProfileHeaderView = [[UserProfileHeaderView alloc] init];
    userProfileHeaderView.frame = CGRectMake(0, -kTopImageViewHeight, _tableView.width, kTopImageViewHeight);
    userProfileHeaderView.backgroundColor = [UIColor brownColor];

    [_tableView addSubview:userProfileHeaderView];
    _tableView.contentInset = UIEdgeInsetsMake(kTopImageViewHeight, 0, 0, 0);
    [_tableView setTableHeaderView:[self tableHeaderView]];
}

- (UIView *)tableHeaderView{
    UIView *tableHeaderView = [[UIView alloc] init];
    tableHeaderView.frame = CGRectMake(0, 0, _tableView.width, tableHeaderViewHeight);
    tableHeaderView.backgroundColor = [UIColor clearColor];
    
    UIView *barHeaderLine = [[UIView alloc] init];
    barHeaderLine.frame = CGRectMake(0, 10, tableHeaderView.width, 0.5);
    barHeaderLine.backgroundColor = color_line;
    [tableHeaderView addSubview:barHeaderLine];
    
    UIView *barFooterLine = [[UIView alloc] init];
    barFooterLine.frame = CGRectMake(0, 95/2, tableHeaderView.width, 0.5);
    barFooterLine.backgroundColor = color_line;
    [tableHeaderView addSubview:barFooterLine];
    
    tabBar = [[YHRollTabBar alloc] init];
    tabBar.frame = CGRectMake(0, barHeaderLine.bottom, barHeaderLine.width, barFooterLine.top -  barHeaderLine.bottom);
    tabBar.delegate = self;
    tabBar.backgroundColor = [UIColor whiteColor];
    [tableHeaderView addSubview:tabBar];
    _selectIndex = 0;
    [tabBar reloadDataToRow:_selectIndex];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 15;
    flowLayout.minimumInteritemSpacing = 0;
    CGFloat itemWith = (tableHeaderView.width - 15*5)/4;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 0);
    flowLayout.itemSize = CGSizeMake(itemWith, UserProfileBookRankItemHeight);

    bookCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    bookCollection.delegate = self;
    bookCollection.dataSource = self;
    bookCollection.frame = CGRectMake(0, barFooterLine.bottom, tableHeaderView.width, 315/2);
    bookCollection.backgroundColor = [UIColor whiteColor];
    bookCollection.showsVerticalScrollIndicator = false;
    bookCollection.showsHorizontalScrollIndicator = false;
    [bookCollection registerClass:[UserProfileBookCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([UserProfileBookCollectionCell class])];
    [tableHeaderView addSubview:bookCollection];

    UIView *footerHeaderLine = [[UIView alloc] init];
    footerHeaderLine.frame = CGRectMake(0, bookCollection.bottom, tableHeaderView.width, 0.5);
    footerHeaderLine.backgroundColor = color_line;
    [tableHeaderView addSubview:footerHeaderLine];

    UIButton *checkShelfBtn = [[UIButton alloc] init];
    checkShelfBtn.frame = CGRectMake(0, footerHeaderLine.bottom, tableHeaderView.width, 50);
    [checkShelfBtn setTitle:@"查看书架" forState:UIControlStateNormal];
    [checkShelfBtn setTitleColor:color_grayline forState:UIControlStateNormal];
    checkShelfBtn.backgroundColor = [UIColor whiteColor];
    [tableHeaderView addSubview:checkShelfBtn];
    
    UIView *footerFooterLine = [[UIView alloc] init];
    footerFooterLine.frame = CGRectMake(0, checkShelfBtn.bottom, tableHeaderView.width, 0.5);
    footerFooterLine.backgroundColor = color_line;
    [tableHeaderView addSubview:footerFooterLine];

    return tableHeaderView;
}

- (void)createDataSource{
    if (!_reviewList) {
        _reviewList = [NSMutableArray array];
    }
    NSArray *userNames = @[@"Gup Lei", @"我是渣渣", @"Miao🐱", @"花开半夏🌹清水如月"];
    NSArray *userRates = @[@"4", @"5", @"3", @"5"];
    NSArray *userReviews = @[@"学会独处的人才会很好的跟别人相处， 孤独是一个人的狂欢，想搜一个片刻的安宁。然而生活在群居的社  会，不得不学会和人相处，独处和相处可以相互交错，非凡的人都会有自己的个性。学会独处的人才会很好的跟别人相处， 孤独是一个人的狂欢，想搜一个片刻的安宁。然而生活在群居的社会，不得不学会和人相处，独处和相处可以相互交错，非凡的人都会有自己的个性。",
                             @"非凡的人都会有自己的个性，教练眼中不好管理，不听话的问题球员，最终成为世界上最优秀的羽毛球选手，让我在以后教育孩子，职场管理方面得到了一些启示，多去发现优点，发掘潜力。",
                             @"",
                             @"非凡的人都会有自己的个性，教练眼中不好管理，不听话的问题球员，最终成为世界上最优秀的羽毛球选手，让我在以后教育孩子，职场管理方面得到了一些启示，多去发现优点，发掘潜力。"];
    NSArray *userAvatars = @[@"http://img1.imgtn.bdimg.com/it/u=4207964535,4228294490&fm=21&gp=0.jpg",
                             @"http://img3.imgtn.bdimg.com/it/u=3346705747,2650414494&fm=11&gp=0.jpg",
                             @"http://img0.imgtn.bdimg.com/it/u=735430636,511468286&fm=21&gp=0.jpg",
                             @"http://img2.imgtn.bdimg.com/it/u=271357168,2262373438&fm=21&gp=0.jpg"];
    NSArray *bookCovers = @[@"https://img3.doubanio.com/lpic/s29021863.jpg",
                            @"https://img3.doubanio.com/lpic/s28970403.jpg",
                            @"https://img3.doubanio.com/lpic/s29041086.jpg",
                            @"https://img1.doubanio.com/lpic/s29003768.jpg"];
    NSArray *bookTitleNames = @[@"教授与疯子", @"愿上帝包邮法国", @"大宋革新", @"诗人和鲸鱼"];
    NSArray *bookAuthorNames = @[@"西蒙·温切斯特", @"彼得·梅尔", @"易中天", @"甄妮"];
    NSArray *dates = @[@"9月27日 18:25", @"9月25日 01:22", @"9月17日 20:11", @"9月01日 20:46"];
    NSArray *praiseNumbers = @[@"5", @"1", @"0", @"12"];
    
    NSArray *comments = @[@[], @[], @[], @[]];
    
    NSMutableArray *reviews = [NSMutableArray array];
    for (int i = 0; i < [userNames count]; i++) {
        Review *review = [[Review alloc] init];
        review.userName = userNames[i];
        review.userAvatar = userAvatars[i];
        review.userRate = userRates[i];
        review.userReview = userReviews[i];
        review.isUserComment = true;
        review.bookCover = bookCovers[i];
        review.bookTitleName = bookTitleNames[i];
        review.bookAuthorName = bookAuthorNames[i];
        review.date = dates[i];
        review.praiseNumber = praiseNumbers[i];
        review.hasPraise = ([praiseNumbers[i] integerValue] > 0);
        review.comments = comments[i];
        review.hasComments = ([comments[i] count] > 0);
        review.hideForward = true;
        review.showCommentFooter = ([review.comments count] >= 2);
        [reviews addObject:review];
    }
    
    Review *review = [[Review alloc] init];
    review.userName = @"MichealMao";
    review.userAvatar = nil;
    review.userRate = @"3";
    review.isUserComment = false;
    review.bookCover = @"https://img3.doubanio.com/lpic/s29021863.jpg";
    review.bookTitleName = @"林丹自传：直到世界尽头";
    review.bookAuthorName = @"林丹";
    review.date = @"10月1日 09：59";
    review.praiseNumber = @"666";
    review.hasPraise = ([review.praiseNumber integerValue] > 0);
    review.comments = nil;
    review.hasComments = ([review.comments count] > 0);
    review.hideForward = true;
    review.showCommentFooter = ([review.comments count] >= 2);
    NSArray *bookReviews = @[review];
    [_reviewList setArray:@[bookReviews, reviews]];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_reviewList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_reviewList[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ReviewTableViewCell class])];
    cell.review = _reviewList[indexPath.section][indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat userProfileHeight = 55;
    CGFloat bookContentHeight = 130/2;
    CGFloat footerHeight = 25;
    Review *review = _reviewList[indexPath.section][indexPath.row];
    CGFloat praiseHeight = (review.hasPraise?(85/2):0);
    CGFloat commentsHeight = 0;
    for (Comment *comment in review.comments) {
        CGRect commentRect = [comment.commentsText boundingRectWithSize:CGSizeMake(tableView.width - contentLeftInset - contentRightInset, CGFLOAT_MAX)
                                                                options:(NSStringDrawingUsesLineFragmentOrigin)
                                                             attributes:@{NSFontAttributeName:WR_CommentTextLabel_Font}
                                                                context:nil];
        commentsHeight += commentRect.size.height + 10;
    }
    commentsHeight += review.hasComments?commentTableInsetTop:0;
    commentsHeight += review.showCommentFooter?commentTableFooterHeight:0;
    
    CGFloat replyFooterHeight = ((review.hasPraise || review.hasComments)?20:0);
    
    NSString *reviewText = review.userReview;
    CGRect contentRect = [reviewText boundingRectWithSize:CGSizeMake(tableView.width - contentLeftInset - contentRightInset, CGFLOAT_MAX)
                                                  options:(NSStringDrawingUsesLineFragmentOrigin)
                                               attributes:@{NSFontAttributeName:WR_ReviewTextLabel_Font}
                                                  context:nil];
    CGFloat textHeight = contentRect.size.height;
    CGFloat textHeaderHeight = 20;
    if (textHeight >= MaxTextHeight) {
        textHeight = MaxTextHeight + 40;
        textHeaderHeight = 20;
    }else if (reviewText.length == 0){
        textHeight = 0;
        textHeaderHeight = 0;
    }
    CGFloat replyHeight = praiseHeight + commentsHeight;
    CGFloat cellHeight = userProfileHeight + textHeaderHeight + textHeight + 15 + bookContentHeight + 10 + footerHeight + 10 + replyHeight + replyFooterHeight + 10;
    return cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 94/2;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat headerHeight = [self tableView:tableView heightForHeaderInSection:section];
    UIView *sectionHeaderView = [[UIView alloc] init];
    sectionHeaderView.frame = CGRectMake(0, 0, _tableView.width, headerHeight);
    sectionHeaderView.backgroundColor = [UIColor whiteColor];
    
    UIView *headerLine = [[UIView alloc] init];
    headerLine.frame = CGRectMake(0, 0, sectionHeaderView.width, 0.5);
    headerLine.backgroundColor = color_line;
    [sectionHeaderView addSubview:headerLine];
    
//    UIView *footerLine = [[UIView alloc] init];
//    footerLine.frame = CGRectMake(0, sectionHeaderView.height - 0.5, sectionHeaderView.width, 0.5);
//    footerLine.backgroundColor = color_line;
//    [sectionHeaderView addSubview:footerLine];
    
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.frame = CGRectMake(20, 0, sectionHeaderView.width - 20*2, 30);
    headerLabel.centerY = sectionHeaderView.height/2;
    headerLabel.text = _sectionTitles[section];
    headerLabel.textColor = [UIColor darkGrayColor];
    headerLabel.font = [UIFont systemFontOfSize:14.0];
    [sectionHeaderView addSubview:headerLabel];
    return sectionHeaderView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CGFloat footerHeight = [self tableView:tableView heightForFooterInSection:section];
    UIView *sectionFooterView = [[UIView alloc] init];
    sectionFooterView.frame = CGRectMake(0, 0, _tableView.width, footerHeight);
    sectionFooterView.backgroundColor = [UIColor clearColor];
    return sectionFooterView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    if (contentOffsetY < -kTopImageViewHeight) {
        userProfileHeaderView.top = contentOffsetY;
        userProfileHeaderView.height = -contentOffsetY;
    }else{
        userProfileHeaderView.top = -kTopImageViewHeight;
        userProfileHeaderView.height = kTopImageViewHeight;
    }
    CGFloat startAlphaOffset = - kTopImageViewHeight;
    CGFloat AlphaRange = NAVBAR_HEIGHT;
    CGFloat alpha =  (contentOffsetY - startAlphaOffset)/ AlphaRange;
    if (alpha < 0) {
        alpha = 0;
    }
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    _naviLineView.alpha = alpha;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    UIColor *naviTintcolor;
    if (alpha > 0.5) {
         naviTintcolor = color_naviTitle_alpha(alpha);
        if (alpha >= 1) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        }
    }else{
        naviTintcolor = [UIColor colorWithWhite:1-alpha alpha:1];
    }
//    [self setNeedsStatusBarAppearanceUpdate];//刷新statusBar
    self.navigationController.navigationBar.tintColor = naviTintcolor;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithWhite:1-alpha alpha:1]};
}

#pragma mark - YHRollTabBarDelegate

- (NSString *)rollTabBarView:(YHRollTabBar *)rollTabBarView titleForRow:(NSInteger)row{
    return _titles[row];
}

- (NSInteger)numberOfRowsInView:(YHRollTabBar *)rollTabBar{
    return [_titles count];
}

- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _selectIndex = indexPath.row;
    [bookCollection reloadData];
}


#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UserProfileBookCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UserProfileBookCollectionCell class]) forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_books[_selectIndex] count];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

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
