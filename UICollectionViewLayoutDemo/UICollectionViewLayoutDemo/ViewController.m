//
//  ViewController.m
//  UICollectionViewLayoutDemo
//
//  Created by JianRongCao on 15/12/11.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import "AnimationLayout.h"


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    CGFloat width;
    CGFloat height;
    NSMutableDictionary *testdic;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    width = [UIScreen mainScreen].bounds.size.width;
    height = [UIScreen mainScreen].bounds.size.height;
    self.view.backgroundColor = [UIColor brownColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    AnimationLayout *flowLayout = [[AnimationLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, width, height - 64)
                                                      collectionViewLayout:flowLayout];
    [collection registerClass:[RMCollectionViewCell class] forCellWithReuseIdentifier:@"identifier"];
    collection.backgroundColor = [UIColor whiteColor];
    collection.showsHorizontalScrollIndicator = NO;
    collection.delegate = self;
    collection.dataSource = self;
    collection.pagingEnabled = NO;
    [self.view addSubview:collection];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(0, 0);
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(width, height - 64);
//}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *color = [NSArray arrayWithObjects:[UIColor colorWithRed:0.18 green:0.71 blue:0.92 alpha:1],
                      [UIColor colorWithRed:1 green:0.69 blue:0.06 alpha:1],
                      [UIColor colorWithRed:0.99 green:0.27 blue:0.22 alpha:1],
                      [UIColor colorWithRed:0.56 green:0.57 blue:0.57 alpha:1],nil];
    RMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    cell.backgroundColor = [color objectAtIndex:indexPath.row%4];
    cell.number.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    [cell.number sizeToFit];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 0;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 0;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation RMCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        CGFloat random = rand()%100/100.0f;
        self.backgroundColor = [UIColor colorWithWhite:random alpha:random];
    }
    return self;
}

- (UILabel *)number
{
    if (!_number) {
        _number = [[UILabel alloc] init];
        _number.textColor = [UIColor blackColor];
        _number.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_number];
    }
    return _number;
}

@end
