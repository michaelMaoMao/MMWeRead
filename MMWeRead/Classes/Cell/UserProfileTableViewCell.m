//
//  UserCenterTableViewCell.m
//  微信读书
//
//  Created by MichaelMao on 16/10/3.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "UserProfileTableViewCell.h"

@interface UserProfileTableViewCell (){

    UIImageView *iconView;
    UILabel *titleLabel;
    UILabel *detailTitleLabel;
    UILabel *subDetailTitleLabel;
}

@end

@implementation UserProfileTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        iconView = [[UIImageView alloc] init];
        iconView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:iconView];
        
        titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor darkTextColor];
        titleLabel.font = [UIFont systemFontOfSize:16.0];
        [self.contentView addSubview:titleLabel];
        
        detailTitleLabel = [[UILabel alloc] init];
        detailTitleLabel.textColor = [UIColor darkGrayColor];
        detailTitleLabel.font = [UIFont systemFontOfSize:14.0];
        detailTitleLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:detailTitleLabel];
        
        subDetailTitleLabel = [[UILabel alloc] init];
        subDetailTitleLabel.textColor = color_grayline;
        subDetailTitleLabel.font = [UIFont systemFontOfSize:12.0];
        subDetailTitleLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:subDetailTitleLabel];
    }
    return self;
}

- (void)setModel:(NSDictionary *)model{
    if (_model != model) {
        _model = model;
        [self updateCell];
    }
}

- (void)updateCell{
    iconView.image = [UIImage imageNamed:_model[@"icon"]];
    titleLabel.text = _model[@"title"];
    detailTitleLabel.text = _model[@"detailText"];
    subDetailTitleLabel.text = _model[@"subDetailText"];
    [self setNeedsLayout];
}


- (void)layoutSubviews{

    [super layoutSubviews];
    iconView.frame = CGRectMake(20, 20, 25, 25);
    titleLabel.frame = CGRectMake(iconView.right + 10, 20, self.width/2 - iconView.right - 10, 25);
    detailTitleLabel.frame = CGRectMake(self.width/2, 10, self.width/2 - 15, 25);
    subDetailTitleLabel.frame = CGRectMake(self.width/2, detailTitleLabel.bottom + 5, detailTitleLabel.width, 15);
}

@end
