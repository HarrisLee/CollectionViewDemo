//
//  DemoCollectionViewCell.m
//  CollectionViewDemo
//
//  Created by JianRongCao on 15/11/27.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "DemoCollectionViewCell.h"

@interface DemoCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation DemoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        self.collection.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
        [self.collection reloadData];
    }
    return self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70, 70);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,10,0,10);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifiers" forIndexPath:indexPath];
    cell.conView.backgroundColor = indexPath.row % 2 ? [UIColor redColor] : [UIColor blueColor];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    collectionClick click = self.block;
    if (click) {
        click([NSNumber numberWithInteger:row]);
    }
}

- (void)clickAtIndex:(collectionClick)item
{
    self.block = [item copy];
}

- (UICollectionView *)collection
{
    if (!_collection) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_collection registerClass:[ItemCell class] forCellWithReuseIdentifier:@"identifiers"];
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.delegate = self;
        _collection.dataSource = self;
        [self addSubview:_collection];
    }
    return _collection;
}

@end

@implementation ItemCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.conView.frame = CGRectMake(10, 10, 50, 50);
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self addSubview:self.conView];
    }
    return self;
}

- (UIView *)conView
{
    if(!_conView){
        _conView = [[UIView alloc] init];
        _conView.backgroundColor = [UIColor redColor];
    }
    return _conView;
}

@end