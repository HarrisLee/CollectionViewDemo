//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by JianRongCao on 15/11/27.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import "DemoCollectionViewCell.h"

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
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, width, height - 64) collectionViewLayout:flowLayout];
    [collection registerClass:[DemoCollectionViewCell class] forCellWithReuseIdentifier:@"identifier"];
    collection.backgroundColor = [UIColor whiteColor];
    collection.showsHorizontalScrollIndicator = NO;
    collection.delegate = self;
    collection.dataSource = self;
    collection.pagingEnabled = YES;
    [self.view addSubview:collection];
    
    testdic = [[NSMutableDictionary alloc] init];
    for(int idx = 0; idx < 10000; idx ++){
        [testdic setObject:[NSNumber numberWithInt:idx] forKey:[NSString stringWithFormat:@"%d",idx]];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(width, height - 64);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    [cell clickAtIndex:^(id obj) {
        NSLog(@"init %d",[obj intValue]);
        ViewController *controller = [[ViewController alloc] init];
        controller.title = [NSString stringWithFormat:@"详情-%d", [obj intValue]];
        [self.navigationController pushViewController:controller animated:YES];
        NSLog(@"all keys count %ld",[[[self getDic] allKeys] count]);
    }];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (NSDictionary *)getDic
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [testdic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [dic setObject:obj forKey:key];
    }];
    return dic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
