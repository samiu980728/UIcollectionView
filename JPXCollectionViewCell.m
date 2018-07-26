//
//  JPXCollectionViewCell.m
//  试炼：UICollectionCell
//
//  Created by 萨缪 on 2018/7/26.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "JPXCollectionViewCell.h"

@implementation JPXCollectionViewCell

//collectionView和tableView最大的不同之处 就是需要自定义cell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self ){
        _topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 150)];
        _topImage.backgroundColor = [UIColor redColor];
        _arrayData = [NSArray arrayWithObjects:@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30", nil];
        
        
        
        //加入到视图中
        [self.contentView addSubview:_topImage];
        
        _botlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 70, 30)];
        
        _botlabel.textAlignment = NSTextAlignmentCenter;
        
        _botlabel.font = [UIFont systemFontOfSize:15];
        
        _botlabel.textColor = [UIColor blueColor];
        
        [self.contentView addSubview:_botlabel];
    }
    return self;
}


@end
