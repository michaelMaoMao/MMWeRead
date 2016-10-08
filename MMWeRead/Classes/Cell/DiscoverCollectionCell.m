//
//  DiscoverCollectionCell.m
//  微信读书
//
//  Created by MichaelMao on 16/10/2.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "DiscoverCollectionCell.h"
#import "BookRankCollectionCell.h"
#define itemHeight (270/2 + (iPhone6||iPhone6P?40:0))
@interface DiscoverCollectionCell () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    UIView *backView;
    //发现
    UILabel *titleLabel;//标题
    UIImageView *bookCoverView;//书籍封面
    UILabel *bookNameLabel;//书籍名称
    UILabel *authorNameLabel;//作者名称
    UICollectionView *bookCollectView; //推荐书籍
    UICollectionViewFlowLayout *flowLayout;
    UILabel *recommendTitleLabel;//推荐列表
}
@end

@implementation DiscoverCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backView];
    
        titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:16.0];
        titleLabel.text = @"本 周 热 榜";
        titleLabel.textColor = RGB(111, 118, 128);
        [self.contentView addSubview:titleLabel];
        
        bookCoverView = [[UIImageView alloc] init];
        bookCoverView.backgroundColor = [UIColor clearColor];
        bookCoverView.image = [UIImage imageNamed:@"sample_book"];
        [self.contentView addSubview:bookCoverView];
        
        bookNameLabel = [[UILabel alloc] init];
        bookNameLabel.textAlignment = NSTextAlignmentCenter;
        bookNameLabel.backgroundColor = [UIColor clearColor];
        bookNameLabel.textColor = RGB(59, 66, 76);
        bookNameLabel.text = @"绝对小孩";
        bookNameLabel.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:bookNameLabel];
        
        authorNameLabel = [[UILabel alloc] init];
        authorNameLabel.backgroundColor = [UIColor clearColor];
        authorNameLabel.textAlignment = NSTextAlignmentCenter;
        authorNameLabel.textColor = RGB(59, 66, 76);
        authorNameLabel.text = @"朱德庸";
        authorNameLabel.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:authorNameLabel];

        flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 15/2;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 0);
        CGFloat itemWith = (self.width - 30*2)/3;
        flowLayout.itemSize = CGSizeMake(itemWith, itemHeight);
        
        bookCollectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        bookCollectView.delegate = self;
        bookCollectView.dataSource = self;
        [bookCollectView registerClass:[BookRankCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([BookRankCollectionCell class])];
        bookCollectView.showsHorizontalScrollIndicator = false;
        bookCollectView.showsVerticalScrollIndicator = false;
        bookCollectView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:bookCollectView];
        
        recommendTitleLabel = [[UILabel alloc] init];
        recommendTitleLabel.textAlignment = NSTextAlignmentCenter;
        recommendTitleLabel.textColor = HEXCOLOR(0x858585);
        recommendTitleLabel.font = [UIFont systemFontOfSize:12.0];
        recommendTitleLabel.text = @"查看本周热榜 >";
        recommendTitleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:recommendTitleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    backView.frame = self.bounds;
    backView.layer.cornerRadius = 10;
    backView.layer.shadowRadius = 3;
    backView.layer.shadowOpacity = 0.1;
    backView.layer.shadowOffset = CGSizeMake(0.2, 0.2);
    
    titleLabel.frame = CGRectMake(0, 15, self.width, 20);
    
    bookCoverView.frame = CGRectMake(0, titleLabel.bottom + 20, 185/2, 260/2);
    bookCoverView.centerX = titleLabel.centerX;
    bookCoverView.layer.shadowRadius = 3;
    bookCoverView.layer.shadowOpacity = 0.1;
    bookCoverView.layer.shadowOffset = CGSizeMake(1, 1);

    bookNameLabel.frame = CGRectMake(0, bookCoverView.bottom + (iPhone6||iPhone6P?20:10), self.width, 15);
    authorNameLabel.frame = CGRectMake(0, bookNameLabel.bottom + (iPhone6||iPhone6P?10:5), self.width, 15);
    bookCollectView.frame = CGRectMake(0, authorNameLabel.bottom + (iPhone6||iPhone6P?30:20), self.width, itemHeight);
    recommendTitleLabel.frame = CGRectMake(0, bookCollectView.bottom + (iPhone6||iPhone6P?25:10), self.width, 15);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BookRankCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BookRankCollectionCell class])  forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

@end
