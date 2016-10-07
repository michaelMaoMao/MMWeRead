//
//  UIImage+Ext.h
//
//
//  Created by kiefer on 13-9-26.
//  Copyright (c) 2013年 cztv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ext)

- (UIImage *)fixOrientation;
////////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
// 使用颜色创建UIImage
+ (UIImage *)imageWithColor:(UIColor *)color;
// 给UIImage加圆角
- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size withUIRectCorner:(UIRectCorner)UIRectCorner;

@end
