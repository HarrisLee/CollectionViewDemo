//
//  DemoCollectionViewCell.h
//  CollectionViewDemo
//
//  Created by JianRongCao on 15/11/27.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^collectionClick)(id obj);

@interface DemoCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) collectionClick block;

@property (nonatomic, strong) UICollectionView *collection;

- (void)clickAtIndex:(collectionClick)item;

@end


@interface ItemCell : UICollectionViewCell

@property (nonatomic, strong) UIView *conView;

@end