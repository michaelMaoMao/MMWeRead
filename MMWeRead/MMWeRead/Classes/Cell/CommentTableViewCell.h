//
//  CommentTableViewCell.h
//  MMWeRead
//
//  Created by MichaelMao on 16/10/7.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WR_CommentTextLabel_Font [UIFont systemFontOfSize:14.0]

@class Comment;
@interface CommentTableViewCell : UITableViewCell

@property (nonatomic, strong) Comment *comment;

@end
