//
//  Review.h
//  MMWeRead
//
//  Created by MichaelMao on 16/10/6.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comment.h"

@interface Review : NSObject

//user
@property (nonatomic, copy) NSString *userAvatar;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userRate;
@property (nonatomic, copy) NSString *userReview;

//book
@property (nonatomic, copy) NSString *bookCover;
@property (nonatomic, copy) NSString *bookTitleName;
@property (nonatomic, copy) NSString *bookAuthorName;

//date//praise
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *praiseNumber;
@property (nonatomic, assign) BOOL hasPraise;//是否有人点赞
@property (nonatomic, assign) BOOL hasComments;//是否有人评论
@property (nonatomic, assign) BOOL hideForward;//隐藏转发按钮
@property (nonatomic, assign) BOOL showCommentFooter;//评论列表底部

//comments
@property (nonatomic, copy) NSArray *comments;//

@end
