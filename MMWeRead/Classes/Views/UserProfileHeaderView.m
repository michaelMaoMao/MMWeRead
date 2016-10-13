//
//  UserProfileHeaderView.m
//  MMWeRead
//
//  Created by MichaelMao on 16/10/9.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import "UserProfileHeaderView.h"

@interface  UserProfileHeaderView (){
    UIImageView *userAvatar;
    UILabel *sexLabel;
    UIButton *editProfileBtn;
    UILabel *readingTimeLabel;
    UILabel *prasieNumberLabel;
    UILabel *followersNumberLabel;
}
@end

@implementation UserProfileHeaderView

- (UserProfileHeaderView *)userProfileHeaderView{
    UserProfileHeaderView *userProfileHeaderView = [[UserProfileHeaderView alloc] init];
    
    return userProfileHeaderView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        userAvatar = [[UIImageView alloc] init];
        userAvatar.image = [UIImage imageNamed:@"avatar_default"];
        userAvatar.layer.borderColor = [[UIColor whiteColor] CGColor];
        userAvatar.layer.borderWidth = 1;
        userAvatar.layer.masksToBounds = true;
        [self addSubview:userAvatar];
        
        sexLabel = [[UILabel alloc] init];
        sexLabel.text = @"男";
        sexLabel.font = [UIFont systemFontOfSize:14.0];
        sexLabel.textColor = [UIColor whiteColor];
        sexLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:sexLabel];
        
        editProfileBtn = [[UIButton alloc] init];
        [editProfileBtn setTitle:@"编辑个人资料" forState:UIControlStateNormal];
        [editProfileBtn setTitleColor:HEXCOLOR(0xE0E0E0) forState:(UIControlStateNormal)];
        editProfileBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:editProfileBtn];
        
        readingTimeLabel = [[UILabel alloc] init];
        readingTimeLabel.text = @"3时 15分\n读书时长";
        readingTimeLabel.font = [UIFont systemFontOfSize:14.0];
        readingTimeLabel.textColor = [UIColor whiteColor];
        readingTimeLabel.textAlignment = NSTextAlignmentCenter;
        readingTimeLabel.numberOfLines = 2;
        [self addSubview:readingTimeLabel];
        
        prasieNumberLabel = [[UILabel alloc] init];
        prasieNumberLabel.text = @"10个\n收到的赞";
        prasieNumberLabel.font = [UIFont systemFontOfSize:14.0];
        prasieNumberLabel.textColor = [UIColor whiteColor];
        prasieNumberLabel.textAlignment = NSTextAlignmentCenter;
        prasieNumberLabel.numberOfLines = 2;
        [self addSubview:prasieNumberLabel];
        
        followersNumberLabel = [[UILabel alloc] init];
        followersNumberLabel.text = @"3人\n关注我";
        followersNumberLabel.font = [UIFont systemFontOfSize:14.0];
        followersNumberLabel.textColor = [UIColor whiteColor];
        followersNumberLabel.textAlignment = NSTextAlignmentCenter;
        followersNumberLabel.numberOfLines = 2;
        [self addSubview:followersNumberLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat labelWidth = 70;
    CGFloat labelHorInset = 30;
    CGFloat labelInset = (self.width - labelWidth*3 - labelHorInset*2)/2;
    
    userAvatar.frame = CGRectMake(self.width/2 - 40,  self.height - kTopImageViewHeight + 70, 80, 80);
    userAvatar.layer.cornerRadius = userAvatar.height/2;
    sexLabel.frame = CGRectMake(0, userAvatar.bottom + 15, self.width, 15);
    editProfileBtn.frame = CGRectMake(0, sexLabel.bottom + 10, self.width, 20);
    
    readingTimeLabel.frame = CGRectMake(labelHorInset, editProfileBtn.bottom + 15, labelWidth, 40);prasieNumberLabel.frame = CGRectMake(readingTimeLabel.right + labelInset, editProfileBtn.bottom + 15, labelWidth, readingTimeLabel.height);
    followersNumberLabel.frame = CGRectMake(prasieNumberLabel.right + labelInset, editProfileBtn.bottom + 15, labelWidth, readingTimeLabel.height);
}

@end
