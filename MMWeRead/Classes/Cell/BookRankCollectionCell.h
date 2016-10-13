//
//  RecommendRankCollectionCell.h
//  微信读书
//
//  Created by MichaelMao on 16/10/2.
//  Copyright © 2016年 MichaelMao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define bookRankItemHeight (270/2 + (iPhone6||iPhone6P?40:0))

@interface BookRankCollectionCell : UICollectionViewCell{
    
    UIImageView *bookCover;
    UILabel *bookTitle;
}

@end
