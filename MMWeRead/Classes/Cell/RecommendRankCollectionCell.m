//
//  RecommendRankCollectionCell.m
//  微信读书
//
//  Created by MichaelMao on 16/10/2.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "RecommendRankCollectionCell.h"

@interface RecommendRankCollectionCell (){
    UIImageView *bookCover;
    UILabel *bookTitle;
}
@end

@implementation RecommendRankCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        bookCover = [[UIImageView alloc] init];
        bookCover.image = [UIImage imageNamed:@"sample_book"];
        bookCover.backgroundColor = [UIColor redColor];
        bookCover.layer.shadowOpacity = 0.1;
        bookCover.layer.shadowOffset = CGSizeMake(1, 1);
        bookCover.layer.shadowRadius = 1;
        [self.contentView addSubview:bookCover];
        
        bookTitle = [[UILabel alloc] init];
        bookTitle.text = @"鲁滨孙漂流记";
        bookTitle.textColor = RGB(59, 66, 76);
        bookTitle.textAlignment = NSTextAlignmentCenter;
        bookTitle.numberOfLines = 2;
        bookTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        bookTitle.font = [UIFont systemFontOfSize:12.0];
        bookTitle.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:bookTitle];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    bookCover.frame = CGRectMake(0, 0, self.width, 190/2);
    bookTitle.frame = CGRectMake(0, bookCover.bottom, self.width, 50);
}


@end
