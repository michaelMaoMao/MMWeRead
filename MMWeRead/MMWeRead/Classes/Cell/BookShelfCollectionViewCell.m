//
//  BookShelfCollectionViewCell.m
//  微信读书
//
//  Created by MichaelMao on 16/10/3.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "BookShelfCollectionViewCell.h"

@interface BookShelfCollectionViewCell ()

@property (nonatomic, strong) UIImageView *bookCover;
@property (nonatomic, strong) UILabel *bookTitle;

@end

@implementation BookShelfCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        _bookCover = [[UIImageView alloc] init];
        _bookCover.image = [UIImage imageNamed:@"sample_book"];
        _bookCover.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_bookCover];
        
        _bookTitle = [[UILabel alloc] init];
        _bookTitle.backgroundColor = [UIColor clearColor];
        _bookTitle.font = [UIFont systemFontOfSize:12.0];
        _bookTitle.textColor = [UIColor darkGrayColor];
        _bookTitle.numberOfLines = 2;
        _bookTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview: _bookTitle];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _bookTitle.text = @"丹尼尔斯经典跑步训练法";
    _bookCover.frame = CGRectMake(5, 0, self.width - 10, 230/2);
    _bookTitle.frame = CGRectMake(5, _bookCover.bottom, self.width - 10, self.height - _bookCover.bottom);
}

@end
