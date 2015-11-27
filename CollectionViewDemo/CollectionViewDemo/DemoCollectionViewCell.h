//
//  DemoCollectionViewCell.h
//  CollectionViewDemo
//
//  Created by JianRongCao on 15/11/27.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UICollectionView *collection;

@end


@interface ItemCell : UICollectionViewCell

@property (nonatomic, strong) UIView *conView;

@end