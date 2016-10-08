//
//  IdeasTableViewCell.m
//  微信读书
//
//  Created by MichaelMao on 16/10/4.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "ReviewTableViewCell.h"
#import "Review.h"
#import "CommentTableViewCell.h"

@interface ReviewTableViewCell () <UITableViewDelegate, UITableViewDataSource> {
    
    UIView *contentView;
    UIView *userView;
    UIView *textView;
    UIView *bookView;
    UIView *footerView;
    UIView *replyView;
    UIView *topLine;
    UIView *bottomLine;
}

@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) NSMutableArray *stars;
@property (nonatomic, strong) UIButton *checkDetailBtn;

@property (nonatomic, strong) UILabel *reViewLabel;
@property (nonatomic, strong) UIButton *bookBannerBtn;
@property (nonatomic, strong) UIImageView *bookCover;
@property (nonatomic, strong) UILabel *bookTitleLabel;
@property (nonatomic, strong) UILabel *bookAuthorLabel;
@property (nonatomic, strong) UIButton *forwardBtn;
@property (nonatomic, strong) UIButton *praiseBtn;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIView *replyContentView;
@property (nonatomic, strong) UIView *praiseView;
@property (nonatomic, strong) UIImageView *praiseImageView;
@property (nonatomic, strong) UILabel *praiseLabel;
@property (nonatomic, strong) UIView *separatorLine;//分割线
@property (nonatomic, strong) UITableView *commentTable;
@property (nonatomic, strong) UILabel *checkDetailLabel;

@end

@implementation ReviewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        contentView = [[UIView alloc] init];
        contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:contentView];
        
        topLine = [[UIView alloc] init];
        topLine.backgroundColor = [UIColor lightGrayColor];
        [contentView addSubview:topLine];
        
        bottomLine = [[UIView alloc] init];
        bottomLine.backgroundColor = [UIColor lightGrayColor];
        [contentView addSubview:bottomLine];
        
        userView = [[UIView alloc] init];
        userView.backgroundColor = [UIColor clearColor];
        [contentView addSubview:userView];
        
        textView = [[UIView alloc] init];
        textView.backgroundColor = [UIColor clearColor];
        [contentView addSubview:textView];
        
        bookView = [[UIView alloc] init];
        bookView.backgroundColor = [UIColor clearColor];
        [contentView addSubview:bookView];
        
        footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor clearColor];
        [contentView addSubview:footerView];
        
        replyView = [[UIView alloc] init];
        replyView.backgroundColor = [UIColor clearColor];
        [contentView addSubview:replyView];
        
        [self setupUserView];
        [self setupTextView];
        [self setupBookView];
        [self setupFooterView];
        [self setupReplyView];
    }
    return self;
}

- (void)setupUserView{
    _avatar = [[UIImageView alloc] init];
    _avatar.backgroundColor = [UIColor clearColor];
    _avatar.image = [UIImage imageNamed:@"avatar_default"];
    _avatar.layer.cornerRadius = _avatar.height/2;
    _avatar.layer.masksToBounds = true;
    [userView addSubview:_avatar];
    
    _userNameLabel = [[UILabel alloc] init];
    _userNameLabel.left = _avatar.right + 5;
    _userNameLabel.backgroundColor = [UIColor clearColor];
    _userNameLabel.font = [UIFont systemFontOfSize:14.0];
    _userNameLabel.textColor = [UIColor darkTextColor];
    [userView addSubview:_userNameLabel];
    
    if (!_stars) {
        _stars = [NSMutableArray array];
    }
    
    for (int i = 0; i < 5; i ++) {
        UIImageView *star = [[UIImageView alloc] init];
        star.backgroundColor = [UIColor clearColor];
        star.image = [UIImage imageNamed:@"icon_nav_favorite"];
        star.tag = i;
        [_stars addObject:star];
        [userView addSubview:star];
    }
}

- (void)setupTextView{
    _reViewLabel = [[UILabel alloc] init];
    _reViewLabel.backgroundColor = [UIColor clearColor];
    _reViewLabel.numberOfLines = 0;
    _reViewLabel.font = WR_ReviewTextLabel_Font;
    _reViewLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _reViewLabel.textColor = [UIColor darkTextColor];
    [textView addSubview:_reViewLabel];
    
    _checkDetailBtn = [[UIButton alloc] init];
    _checkDetailBtn.backgroundColor = [UIColor clearColor];
    [_checkDetailBtn setTitle:@"查看" forState:(UIControlStateNormal)];
    [_checkDetailBtn setTitleColor:RGB(27, 136, 238) forState:(UIControlStateNormal)];
    [textView addSubview:_checkDetailBtn];
}

- (void)setupBookView{
    _bookBannerBtn = [[UIButton alloc] init];
    _bookBannerBtn.backgroundColor = [UIColor clearColor];
    _bookBannerBtn.layer.borderColor = [RGB(221, 223, 225) CGColor];
    _bookBannerBtn.layer.borderWidth = 0.5;
    _bookBannerBtn.layer.shadowOpacity = 0.5;
    _bookBannerBtn.layer.shadowOffset = CGSizeMake(1, 1);
    _bookBannerBtn.layer.shadowRadius = 2;
    _bookBannerBtn.layer.cornerRadius = 10;
    _bookBannerBtn.layer.masksToBounds = true;
    [_bookBannerBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:(UIControlStateNormal)];
    [_bookBannerBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xE0E0E0]] forState:(UIControlStateHighlighted)];
    [bookView addSubview:_bookBannerBtn];
    
    _bookCover = [[UIImageView alloc] init];
    _bookCover.image = [UIImage imageNamed:@"sample_book"];
    _bookCover.backgroundColor = [UIColor clearColor];
    [_bookBannerBtn addSubview: _bookCover];
    
    _bookTitleLabel = [[UILabel alloc] init];
    _bookTitleLabel.backgroundColor = [UIColor clearColor];
    _bookTitleLabel.font = [UIFont systemFontOfSize:16.0];
    _bookTitleLabel.textColor = [UIColor darkGrayColor];
    [_bookBannerBtn addSubview:_bookTitleLabel];
    
    _bookAuthorLabel = [[UILabel alloc] init];
    _bookAuthorLabel.backgroundColor = [UIColor clearColor];
    _bookAuthorLabel.font = [UIFont systemFontOfSize:14.0];
    _bookAuthorLabel.textColor = [UIColor grayColor];
    [_bookBannerBtn addSubview:_bookAuthorLabel];
}

- (void)setupFooterView{
    _forwardBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _forwardBtn.backgroundColor = [UIColor clearColor];
    [_forwardBtn setImage:[UIImage imageNamed:@"icon_review_at"] forState:(UIControlStateNormal)];
    [footerView addSubview:_forwardBtn];

    _praiseBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _praiseBtn.backgroundColor = [UIColor clearColor];
    [_praiseBtn setImage:[UIImage imageNamed:@"icon_review_praise"] forState:(UIControlStateNormal)];
    [footerView addSubview:_praiseBtn];

    _commentBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _commentBtn.backgroundColor = [UIColor clearColor];
    [_commentBtn setImage:[UIImage imageNamed:@"icon_review_comment"] forState:(UIControlStateNormal)];
    [footerView addSubview:_commentBtn];
    
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.backgroundColor = [UIColor clearColor];
    _dateLabel.font = [UIFont systemFontOfSize:14.0];
    _dateLabel.textColor = [UIColor grayColor];
    [footerView addSubview:_dateLabel];
}

- (void)setupReplyView{
    _replyContentView = [[UIView alloc] init];
    _replyContentView.layer.cornerRadius = 5;
    _replyContentView.layer.masksToBounds = true;
    _replyContentView.backgroundColor = RGB(245, 246, 248);
    [replyView addSubview:_replyContentView];
    
    _praiseView = [[UIView alloc] init];
    _praiseView.backgroundColor = [UIColor clearColor];
    [_replyContentView addSubview:_praiseView];
    
    _praiseImageView = [[UIImageView alloc] init];
    _praiseImageView.backgroundColor = [UIColor clearColor];
    _praiseImageView.image = [UIImage imageNamed:@"icon_review_praise_checked_small"];
    [_praiseView addSubview:_praiseImageView];
    
    _praiseLabel = [[UILabel alloc] init];
    _praiseLabel.backgroundColor = [UIColor clearColor];
    _praiseLabel.font = [UIFont systemFontOfSize:14.0];
    _praiseLabel.textColor = [UIColor grayColor];
    [_praiseView addSubview:_praiseLabel];
    
    _separatorLine = [[UIView alloc] init];
    _separatorLine.backgroundColor = RGB(221, 223, 225);
    [_replyContentView addSubview:_separatorLine];
    
    _commentTable = [[UITableView alloc] init];
    _commentTable.delegate = self;
    _commentTable.dataSource = self;
    _commentTable.scrollEnabled = false;
    _commentTable.backgroundColor = [UIColor clearColor];
    _commentTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _commentTable.contentInset = UIEdgeInsetsMake(commentTableInsetTop, 0, 0, 0);
    [_commentTable registerClass:[CommentTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CommentTableViewCell class])];
    [_replyContentView addSubview:_commentTable];
}

- (void)setReview:(Review *)review{
    if (_review != review) {
        _review = review;
        [self updateCell];
    }
}

- (void)updateCell{
    
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_review.userAvatar]];
//    _avatar.image = [UIImage imageWithData:data];
    NSString *commentTitle = @"点评此书";
    NSMutableAttributedString *userTitle = [[NSMutableAttributedString alloc] initWithString:[[NSString alloc] initWithFormat:@"%@ %@", _review.userName, commentTitle]];
    [userTitle addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(_review.userName.length + 1, commentTitle.length)];
    _userNameLabel.attributedText = userTitle;
    NSInteger number = [_review.userRate integerValue];
    [_stars enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < number) {
            obj.image = [UIImage imageNamed:@"icon_nav_favorited"];
        }else{
            obj.image = [UIImage imageNamed:@"icon_nav_favorite"];
        }
    }];
    _forwardBtn.hidden = _review.hideForward;
    _reViewLabel.text = _review.userReview;
    _bookTitleLabel.text = _review.bookTitleName;
    _bookAuthorLabel.text = _review.bookAuthorName;
    _dateLabel.text = _review.date;
    _praiseLabel.text = [NSString stringWithFormat:@"共%@人赞", _review.praiseNumber];
    _commentTable.hidden = !_review.hasComments;
    _separatorLine.hidden = !(_review.hasPraise && _review.hasComments);
    if ([_review.comments count] >= 2) {
        [_commentTable setTableFooterView:[self tableFooterView]];
    }
    [self setNeedsLayout];
}

-(void)layoutSubviews{

    [super layoutSubviews];
    //contentView
    contentView.frame = CGRectMake(0, 0, self.width, self.height - 10);
    topLine.frame = CGRectMake(0, 0, contentView.width, 0.5);
    bottomLine.frame = CGRectMake(0, contentView.height - 0.5, contentView.width, 0.5);
    //userView
    userView.frame = CGRectMake(0, 0, self.width, 55);
    _avatar.frame = CGRectMake(10, 15, 35, 35);
    _userNameLabel.frame = CGRectMake(_avatar.right + 10, 10, self.width - _avatar.right - 5 - 10, 25);
    [_stars enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(_userNameLabel.left + 15*idx, _userNameLabel.bottom, 11, 11);
    }];

    //textView
    if (_review.userReview.length > 0) {
        textView.frame = CGRectMake(0, userView.bottom + 20, self.width, 340/2);
        _reViewLabel.frame = CGRectMake(contentLeftInset, 0, self.width - contentLeftInset - 10, 45);
        [_reViewLabel sizeToFit];
        _checkDetailBtn.frame = CGRectMake(_reViewLabel.left, MaxTextHeight + 20, 40, 25);
        if (_reViewLabel.height > MaxTextHeight) {
            _reViewLabel.height = MaxTextHeight;
            _checkDetailBtn.hidden = false;
            textView.height = _checkDetailBtn.bottom;
        }else{
            _checkDetailBtn.hidden = true;
            textView.height = _reViewLabel.height;
        }
    }else{
        textView.frame = CGRectMake(0, userView.bottom, self.width, 0);
    }
    //bookView
    bookView.frame = CGRectMake(0, textView.bottom + 15, self.width, 130/2);
    _bookBannerBtn.frame = CGRectMake(contentLeftInset, 0, self.width - contentLeftInset - contentRightInset, 130/2);
    _bookCover.frame = CGRectMake(10, 10, 33, _bookBannerBtn.height - 10*2);
    _bookTitleLabel.frame = CGRectMake(_bookCover.right + 8, _bookCover.top + 4, _bookBannerBtn.width - _bookCover.right - 8, 15);
    _bookAuthorLabel.frame = CGRectMake(_bookCover.right + 8, _bookTitleLabel.bottom + 5, _bookBannerBtn.width - _bookCover.right - 8, 15);
    _bookTitleLabel.centerY = _bookCover.top + _bookCover.height/4;
    _bookAuthorLabel.centerY = _bookCover.top + _bookCover.height*3/4;
    //footerView
    footerView.frame = CGRectMake(0, bookView.bottom + 10, self.width, 25);
    _forwardBtn.frame = CGRectMake(0, 0, 25, 25);
    _praiseBtn.frame = CGRectMake(0, 0, 25, 25);
    _commentBtn.frame = CGRectMake(0, 0, 25, 25);
    _forwardBtn.centerY = 25/2;
    _praiseBtn.centerY = 25/2;
    _commentBtn.centerY = 25/2;
    _commentBtn.right = self.width - contentRightInset;
    _praiseBtn.right = _commentBtn.left - 10;
    _forwardBtn.right = _praiseBtn.left - 10;
    _dateLabel.frame = CGRectMake(contentLeftInset, 0, _forwardBtn.left - contentLeftInset, 25);
    //replyView
    CGFloat praiseHeight = (_review.hasPraise?(85/2):0);
    CGFloat commentsHeight = [self getCommentsHeight];
    replyView.frame = CGRectMake(0, footerView.bottom + 10, self.width, praiseHeight + commentsHeight);
    _replyContentView.frame = CGRectMake(contentLeftInset, 0, self.width - contentLeftInset - contentRightInset, replyView.height);
    //praise
    if (_review.hasPraise) {
        _praiseView.frame = CGRectMake(0, 0, _replyContentView.width, praiseHeight);
        _praiseImageView.frame = CGRectMake(10, 10, 35/2, 35/2);
        _praiseLabel.frame = CGRectMake(_praiseImageView.right + 10, 10, _praiseView.width - _praiseImageView.right - 10*2, 15);
        _praiseLabel.centerY = _praiseImageView.centerY = _praiseView.height/2;
    }else{
        _praiseView.frame = CGRectMake(0, 0, _replyContentView.width, 0);
    }
    _separatorLine.frame = CGRectMake(10, _praiseView.bottom - 0.5, _praiseView.width - 20, 0.5);
    _commentTable.frame = CGRectMake(0, _praiseView.bottom, _replyContentView.width, commentsHeight);
    _checkDetailLabel.width = _commentTable.tableFooterView.width - 20;
    [_commentTable reloadData];
}

- (UIView *)tableFooterView{
    UIView *tableFooterView = [[UIView alloc] init];
    tableFooterView.frame = CGRectMake(0, 0, self.width, commentTableFooterHeight);
    tableFooterView.backgroundColor = [UIColor clearColor];
    
    _checkDetailLabel = [[UILabel alloc] init];
    _checkDetailLabel.frame = CGRectMake(10, 5, tableFooterView.width - 20, 20);
    _checkDetailLabel.text = @"查看全部评论 · 6  >";
    _checkDetailLabel.textColor = [UIColor grayColor];
    _checkDetailLabel.font = [UIFont systemFontOfSize:14.0];
    _checkDetailLabel.backgroundColor = [UIColor clearColor];
    [tableFooterView addSubview:_checkDetailLabel];
    
    return tableFooterView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_review.comments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CommentTableViewCell class])];
    cell.backgroundColor = [UIColor clearColor];
    cell.comment = _review.comments[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Comment *comment = _review.comments[indexPath.row];
    NSString *commentText = comment.commentsText;
    CGRect contentRect = [commentText boundingRectWithSize:CGSizeMake(tableView.width - contentLeftInset - contentRightInset, CGFLOAT_MAX)
                                                  options:(NSStringDrawingUsesLineFragmentOrigin)
                                               attributes:@{NSFontAttributeName:WR_CommentTextLabel_Font}
                                                  context:nil];
    CGFloat textHeight = contentRect.size.height;
    CGFloat cellHeight = textHeight + 10;
    return cellHeight;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{}


- (CGFloat)getCommentsHeight{
    CGFloat commentsHeight = 0;
    for (Comment *comment in _review.comments) {
        CGRect commentRect = [comment.commentsText boundingRectWithSize:CGSizeMake(self.width - contentLeftInset - contentRightInset, CGFLOAT_MAX)
                                                                options:(NSStringDrawingUsesLineFragmentOrigin)
                                                             attributes:@{NSFontAttributeName:WR_CommentTextLabel_Font}
                                                                context:nil];
        commentsHeight += commentRect.size.height + 10;
    }
    commentsHeight += _review.hasComments?commentTableInsetTop:0;
    commentsHeight += _review.showCommentFooter?commentTableFooterHeight:0;
    return commentsHeight;
}

@end
