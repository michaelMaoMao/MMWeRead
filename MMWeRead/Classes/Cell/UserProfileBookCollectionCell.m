//
//  UserProfileBookCollectionCell.m
//  MMWeRead
//
//  Created by MichaelMao on 16/10/10.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "UserProfileBookCollectionCell.h"

@implementation UserProfileBookCollectionCell

- (void)layoutSubviews{
    [super layoutSubviews];
    bookCover.frame = CGRectMake(0, 0, self.width, UserProfileBookCoverHeight);
    bookTitle.frame = CGRectMake(0, bookCover.bottom, self.width, 50);
}

@end
