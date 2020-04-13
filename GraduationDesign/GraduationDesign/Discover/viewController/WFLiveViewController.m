//
//  WFLiveViewController.m
//  GraduationDesign
//
//  Created by wufeng on 2020/2/3.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFLiveViewController.h"
#import "WFLiveCollectionViewCell.h"
#import "Masonry.h"
#import "WFExternVar.h"
#import "WFWaterFallCollectionViewLayout.h"

static NSString * const cellReuseIdentifier = @"WFLiveCollectionViewCell";

@interface WFLiveViewController () <UICollectionViewDataSource, UICollectionViewDelegate, WFWaterFallCollectionViewLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) WFWaterFallCollectionViewLayout *collectionViewFlowLayout;
//@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (nonatomic, copy) NSArray *heightArray;

@end

@implementation WFLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.heightArray = @[@100,@200,@300,@500,@300,@400,@500,@400,@100,@300];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WFLiveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor greenColor];
    return cell;
}

- (CGFloat)waterFallLayout:(nonnull WFWaterFallCollectionViewLayout *)waterFallLayout heightForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.heightArray[indexPath.row] doubleValue];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.collectionViewFlowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[WFLiveCollectionViewCell class] forCellWithReuseIdentifier:cellReuseIdentifier];
    }
    return _collectionView;
}

- (UICollectionViewLayout *)collectionViewFlowLayout
{
    if (!_collectionViewFlowLayout) {
        _collectionViewFlowLayout = [WFWaterFallCollectionViewLayout new];
        _collectionViewFlowLayout.delegate = self;
    }
    return _collectionViewFlowLayout;
}

//- (UICollectionViewFlowLayout *)collectionViewFlowLayout
//{
//    if (!_collectionViewFlowLayout) {
//        _collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
//        _collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        _collectionViewFlowLayout.minimumInteritemSpacing = 5;
//      //  _collectionViewFlowLayout.minimumLineSpacing = 3;
//        _collectionViewFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 2 - 10, 200);
//        _collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
//    }
//    return _collectionViewFlowLayout;
//}

@end
