//
//  IdeasTableViewCell.m
//  微信读书
//
//  Created by MichaelMao on 16/10/4.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "ReviewTableViewCell.h"
#define contentLeftInset (115.0/2)
@interface ReviewTableViewCell (){
    
    UIView *contentView;
    UIView *userView;
    UIView *textView;
    UIView *bookView;
    UIView *footerView;
    UIView *praiseView;
    UIView *topLine;
    UIView *bottomLine;

    UILabel *textLabel;
    UIButton *checkDetailBtn;
}

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
        
        praiseView = [[UIView alloc] init];
        praiseView.backgroundColor = [UIColor clearColor];
        [contentView addSubview:praiseView];
        
        [self setupUserView];
        [self setupTextView];
        [self setupBookView];
        [self setupFooterView];
        [self setupPraiseView];
    }
    return self;
}

- (void)setupUserView{
    UIImageView *avatar = [[UIImageView alloc] init];
    avatar.frame = CGRectMake(10, 5, 35, 35);
    avatar.backgroundColor = [UIColor grayColor];
    avatar.image = [UIImage imageNamed:@"avatar_default"];
    avatar.layer.cornerRadius = avatar.height/2;
    avatar.layer.masksToBounds = true;
    [userView addSubview:avatar];
    
    UILabel *nickNameLabel = [[UILabel alloc] init];
    nickNameLabel.frame = CGRectMake(avatar.right + 5, 5, self.width - avatar.right - 5 - 10, 25);
    nickNameLabel.left = avatar.right + 5;
    nickNameLabel.backgroundColor = [UIColor clearColor];
    nickNameLabel.font = [UIFont systemFontOfSize:14.0];
    nickNameLabel.textColor = [UIColor darkTextColor];
    nickNameLabel.text = @"双优生鲜刘琼希 点评此书";
    [userView addSubview:nickNameLabel];
    
    for (int i = 0; i < 5; i ++) {
        UIImageView *star = [[UIImageView alloc] init];
        star.frame = CGRectMake(nickNameLabel.left + 15*i, nickNameLabel.bottom, 11, 11);
        star.backgroundColor = [UIColor clearColor];
        star.image = [UIImage imageNamed:@"icon_nav_favorited"];
        [userView addSubview:star];
    }
}

- (void)setupTextView{
    textLabel = [[UILabel alloc] init];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.numberOfLines = 0;
    [textView addSubview:textLabel];
    
    checkDetailBtn = [[UIButton alloc] init];
    checkDetailBtn.backgroundColor = [UIColor clearColor];
    [checkDetailBtn setTitle:@"查看" forState:(UIControlStateNormal)];
    [checkDetailBtn setTitleColor:RGB(27, 136, 238) forState:(UIControlStateNormal)];
    [textView addSubview:checkDetailBtn];
}

- (void)setupBookView{
    UIButton *bookBannerBtn = [[UIButton alloc] init];
    bookBannerBtn.frame = CGRectMake(contentLeftInset, 0, self.width - contentLeftInset - 10, 130/2);
    bookBannerBtn.backgroundColor = [UIColor clearColor];
    bookBannerBtn.layer.borderColor = [[UIColor colorWithHex:0x858585] CGColor];
    bookBannerBtn.layer.borderWidth = 0.5;
    bookBannerBtn.layer.shadowOpacity = 0.1;
    bookBannerBtn.layer.shadowOffset = CGSizeMake(1, 1);
    bookBannerBtn.layer.shadowRadius = 1;
    bookBannerBtn.layer.cornerRadius = 10;
    bookBannerBtn.layer.masksToBounds = true;
    [bookBannerBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:(UIControlStateNormal)];
    [bookBannerBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xE0E0E0]] forState:(UIControlStateHighlighted)];
    [bookView addSubview:bookBannerBtn];
    
    UIImageView *bookCover = [[UIImageView alloc] init];
    bookCover.frame = CGRectMake(10, 10, 33, bookBannerBtn.height - 10*2);
    bookCover.image = [UIImage imageNamed:@"sample_book"];
    bookCover.backgroundColor = [UIColor clearColor];
    [bookBannerBtn addSubview: bookCover];
    
    UILabel *bookNameLabel = [[UILabel alloc] init];
    bookNameLabel.frame = CGRectMake(bookCover.right + 5, bookCover.top + 4, bookBannerBtn.width - bookCover.right - 5, 15);
    bookNameLabel.backgroundColor = [UIColor clearColor];
    bookNameLabel.font = [UIFont systemFontOfSize:14.0];
    bookNameLabel.textColor = [UIColor darkGrayColor];
    bookNameLabel.text = @"我敢在你怀里孤独";
    [bookBannerBtn addSubview:bookNameLabel];
    
    UILabel *bookAuthorLabel = [[UILabel alloc] init];
    bookAuthorLabel.frame = CGRectMake(bookCover.right + 5, bookNameLabel.bottom + 5, bookBannerBtn.width - bookCover.right - 5, 15);
    bookAuthorLabel.backgroundColor = [UIColor clearColor];
    bookAuthorLabel.font = [UIFont systemFontOfSize:14.0];
    bookAuthorLabel.textColor = [UIColor grayColor];
    bookAuthorLabel.text = @"刘若英";
    [bookBannerBtn addSubview:bookAuthorLabel];
    
    bookNameLabel.centerY = bookCover.top + bookCover.height/4;
    bookAuthorLabel.centerY = bookCover.top + bookCover.height*3/4;
}

- (void)setupFooterView{
    UIButton *shareBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    shareBtn.frame = CGRectMake(0, 0, 25, 25);
    shareBtn.backgroundColor = [UIColor clearColor];
    [shareBtn setImage:[UIImage imageNamed:@"icon_review_at"] forState:(UIControlStateNormal)];
    [footerView addSubview:shareBtn];

    UIButton *praiseBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    praiseBtn.frame = CGRectMake(0, 0, 25, 25);
    praiseBtn.backgroundColor = [UIColor clearColor];
    [praiseBtn setImage:[UIImage imageNamed:@"icon_review_praise"] forState:(UIControlStateNormal)];
    [footerView addSubview:praiseBtn];

    UIButton *commentBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    commentBtn.frame = CGRectMake(0, 0, 25, 25);
    commentBtn.backgroundColor = [UIColor clearColor];
    [commentBtn setImage:[UIImage imageNamed:@"icon_review_comment"] forState:(UIControlStateNormal)];
    [footerView addSubview:commentBtn];
    
    shareBtn.centerY = 25/2;
    praiseBtn.centerY = 25/2;
    commentBtn.centerY = 25/2;
    
    commentBtn.right = self.width - 10;
    praiseBtn.right = commentBtn.left - 10;
    shareBtn.right = praiseBtn.left - 10;
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.frame = CGRectMake(contentLeftInset, 0, shareBtn.left - contentLeftInset, 25);
    timeLabel.backgroundColor = [UIColor clearColor];
    timeLabel.font = [UIFont systemFontOfSize:12.0];
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.text = @"9月27日 18:45";
    [footerView addSubview:timeLabel];
}

- (void)setupPraiseView{
    UIView *praiseContentView = [[UIView alloc] init];
    praiseContentView.frame = CGRectMake(contentLeftInset, 0, self.width - contentLeftInset - 15, 85/2);
    praiseContentView.layer.cornerRadius = 5;
    praiseContentView.layer.masksToBounds = true;
    praiseContentView.backgroundColor = RGB(245, 246, 248);
    [praiseView addSubview:praiseContentView];
    
    UIImageView *praiseImageView = [[UIImageView alloc] init];
    praiseImageView.frame = CGRectMake(10, 10, 35/2, 35/2);
    praiseImageView.backgroundColor = [UIColor clearColor];
    praiseImageView.image = [UIImage imageNamed:@"icon_review_praise_checked_small"];
    [praiseContentView addSubview:praiseImageView];
    
    UILabel *praiseLabel = [[UILabel alloc] init];
    praiseLabel.frame = CGRectMake(praiseImageView.right + 5, 10, praiseContentView.width - praiseImageView.right - 5*2, 15);
    praiseLabel.backgroundColor = [UIColor clearColor];
    praiseLabel.font = [UIFont systemFontOfSize:12.0];
    praiseLabel.textColor = [UIColor grayColor];
    praiseLabel.text = @"共10人赞";
    [praiseContentView addSubview:praiseLabel];
    praiseLabel.centerY = praiseImageView.centerY = praiseContentView.height/2;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    NSString *text = @"学会独处的人才会很好的更别人相处，孤独是一个人的狂欢，享受片刻的安宁。然而生活在群居的社会，不得不学会与人相处，独处与相处可以相互交错，同时也是废话一大堆，O__O";
    textLabel.text = text;
    
    contentView.frame = CGRectMake(0, 0, self.width, self.height - 10);
    topLine.frame = CGRectMake(0, 0, contentView.width, 0.5);
    bottomLine.frame = CGRectMake(0, contentView.height - 0.5, contentView.width, 0.5);
    userView.frame = CGRectMake(0, 0, self.width, 45);
    textView.frame = CGRectMake(0, userView.bottom + 20, self.width, 340/2);
    bookView.frame = CGRectMake(0, textView.bottom + 5, self.width, 130/2);
    footerView.frame = CGRectMake(0, bookView.bottom + 10, self.width, 25);
    praiseView.frame = CGRectMake(0, footerView.bottom + 5, self.width, 85/2);
    
    textLabel.frame = CGRectMake(contentLeftInset, 0, self.width - contentLeftInset - 10, 45);
    [textLabel sizeToFit];
    checkDetailBtn.frame = CGRectMake(textLabel.left, textLabel.bottom + 20, 40, 25);
}

@end
