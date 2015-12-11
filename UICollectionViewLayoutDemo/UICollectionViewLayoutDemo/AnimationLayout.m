//
//  AnimationLayout.m
//  CollectionViewDemo
//
//  Created by JianRongCao on 15/12/11.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "AnimationLayout.h"

@implementation AnimationLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (CGSize)collectionViewContentSize
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat iconWidth = (size.width - 50)/4.0;
    CGFloat iconHeight = ceilf(iconWidth / 3 * 4);
    CGSize contentSize = CGSizeMake(size.width, (iconHeight + 10)*[[self collectionView] numberOfItemsInSection:0]/4);
    return contentSize;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat iconWidth = (size.width - 50)/4.0;
    CGFloat iconHeight = iconWidth / 3 * 4;
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.alpha = 0.02*indexPath.row > 1 ?  -0.02*indexPath.row + 2 : 0.02*indexPath.row;
    attributes.size = CGSizeMake(iconWidth, iconHeight);
    attributes.center = CGPointMake((10+iconWidth/2) + (iconWidth+10)*(indexPath.row%4),(10+iconHeight/2) + (iconHeight+10)*(indexPath.row/4));
    return attributes;
}

- (nullable NSArray <UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
#if 1
    NSInteger count = [[self collectionView] numberOfItemsInSection:0];
    NSMutableArray* attributes = [NSMutableArray array];
    
    for (NSInteger i = 0 ; i < count; i++) {
        
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
#else
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray* attributes = [NSMutableArray array];
    
    for (NSInteger i = 0 ; i < [array count]; i++) {
        
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
#endif
    return attributes;
}

@end
