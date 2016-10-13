//
//  FollowedPersonViewController.m
//  MMWeRead
//
//  Created by MichaelMao on 16/10/7.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "FollowedPersonController.h"
#import "ReviewTableViewCell.h"
#import "Review.h"
#import "Comment.h"
#import "CommentTableViewCell.h"

@interface FollowedPersonController ()  <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *followedList;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FollowedPersonController


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


- (void)createDataSource{
    if (!_followedList) {
        _followedList = [NSMutableArray array];
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
    
    Comment *comment1 = [[Comment alloc] init];
    comment1.userName = @"周小燕";
    comment1.commentsText = @"只有我自己常常在人群里，深感孤独，常在人堆里，赫然一笑。。。却，原来，大家都有这样的如此的人生";
    Comment *comment2 = [[Comment alloc] init];
    comment2.userName = @"【瑾】";
    comment2.commentsText = @"我们都一样，在不同的地方，却有同样的心情,我们都一样，在不同的心情";
    NSArray *reviewComments = @[comment1, comment2];
    NSArray *comments = @[reviewComments, @[], @[], @[]];
    
    for (int i = 0; i < [userNames count]; i++) {
        Review *review = [[Review alloc] init];
        review.userName = userNames[i];
        review.userAvatar = userAvatars[i];
        review.userRate = userRates[i];
        review.userReview = userReviews[i];
        review.isUserComment = false;
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
        [_followedList addObject:review];
    }
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_followedList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat userProfileHeight = 55;
    CGFloat bookContentHeight = 130/2;
    CGFloat footerHeight = 25;
    Review *review = _followedList[indexPath.row];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ReviewTableViewCell class])];
    cell.backgroundColor = [UIColor clearColor];
    cell.review = _followedList[indexPath.row];
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
