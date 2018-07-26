//
//  ViewController.m
//  试炼：UICollectionCell
//
//  Created by 萨缪 on 2018/7/26.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "ViewController.h"
#import "JPXCollectionViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //1.初始化layout 注意FlowLayout!!!
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置collectionView的滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //设置headerView的尺寸大小
    //注意是CGSizeMake
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 100);
    
    //设置每一个组中的各个单元格的大小
    layout.itemSize = CGSizeMake(110, 150);
    
    //2.初始化collectionView
    mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    
    [self.view addSubview:mainCollectionView];
    
    //Clear Color就是backgroundColor的alpha为1.0。
    mainCollectionView.backgroundColor = [UIColor clearColor];
    
    //3.注册collectionViewCell
    //此处ReuseIdentifier 和cellForItemAtIndexPath 方法中一致 均为cellId
    [mainCollectionView registerClass:[JPXCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    //注册headerView
    //同样需要一致
    [mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    //设置代理
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
    //设置照片数组
    arrayImage = [NSArray arrayWithObjects:@"22.jpg",@"23.jpg",@"24.jpg",@"25.jpg",@"26.jpg",@"27.jpg",@"28.jpg",@"29.jpg",@"30.jpg", nil];
    
}

#pragma mark collectionView的代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

//自定义重用

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JPXCollectionViewCell * cell = (JPXCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
    
    cell.backgroundColor = [UIColor yellowColor];
    
    //cell.topImage = [UIImage imageNamed:[arrayImage objectAtIndex:indexPath.row]];
    //cell.imageView.image =
    cell.topImage.image = [UIImage imageNamed:[arrayImage objectAtIndex:indexPath.row]];
    
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(90, 130);
}

//设置每个item的边界 边缘值
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//设置每个item的水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

//通过设置SupplementaryViewOfkind 设置头部或底部的View
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    
    headerView.backgroundColor = [UIColor grayColor];
    
    //创建一个标签 该标签的位置比较特别 把整个头标题覆盖
    UILabel * label = [[UILabel alloc] initWithFrame:headerView.bounds];
    
    
    label.text = @"这是头部";
    label.font = [UIFont systemFontOfSize:20];
    
    //把label加入头部视图
    [headerView addSubview:label];
    
    return headerView;
    
}

//点击item的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    JPXCollectionViewCell * cell = (JPXCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString * msg = cell.botlabel.text;
    NSLog(@"%@",msg);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
