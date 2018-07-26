//
//  JPXCollectionViewCell.h
//  试炼：UICollectionCell
//
//  Created by 萨缪 on 2018/7/26.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPXCollectionViewCell : UICollectionViewCell

<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property (nonatomic, strong)UIImageView * topImage;

@property (nonatomic, strong)UILabel * botlabel;

@property (nonatomic, copy)NSArray * arrayData;

@end
