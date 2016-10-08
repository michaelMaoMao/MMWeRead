//
//  IdeasTableViewCell.h
//  微信读书
//
//  Created by MichaelMao on 16/10/4.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define contentLeftInset (115.0/2)
#define contentRightInset (10)
#define WR_ReviewTextLabel_Font [UIFont systemFontOfSize:16.0]
#define commentTableInsetTop 5
#define commentTableFooterHeight 30

#define MaxTextHeight 250.0/2   //文字的最大高度

@class Review;

@interface ReviewTableViewCell : UITableViewCell

@property (nonatomic, strong) Review *review;

@end
