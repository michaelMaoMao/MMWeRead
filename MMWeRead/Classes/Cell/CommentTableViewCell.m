//
//  CommentTableViewCell.m
//  MMWeRead
//
//  Created by MichaelMao on 16/10/7.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "Comment.h"

@interface CommentTableViewCell (){
    UILabel *commentTextLabel;
}

@end

@implementation CommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        commentTextLabel = [[UILabel alloc] init];
        commentTextLabel.backgroundColor = [UIColor clearColor];
        commentTextLabel.font = WR_CommentTextLabel_Font;
        commentTextLabel.textColor = [UIColor darkGrayColor];
        commentTextLabel.numberOfLines = 0;
        commentTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:commentTextLabel];
    }
    return self;
}

-(void)setComment:(Comment *)comment{

    if (_comment != comment) {
        _comment = comment;
        [self updateCell];
    }
}

- (void)updateCell{
    commentTextLabel.text = _comment.commentsText;
    [self setNeedsLayout];
}

- (void)layoutSubviews{

    [super layoutSubviews];
    commentTextLabel.frame = CGRectMake(10, 5, self.width - 20, 15);
    [commentTextLabel sizeToFit];
}

@end
