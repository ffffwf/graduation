//
//  WFVideoViewController.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFVideoViewController.h"
#import "WFLiveCollectionViewCell.h"
#import "Masonry.h"
#import "WFExternVar.h"
#import "WFWaterFallCollectionViewLayout.h"

static NSString * const cellReuseIdentifier = @"WFLiveCollectionViewCell";

@interface WFVideoViewController () <UICollectionViewDataSource, UICollectionViewDelegate, WFWaterFallCollectionViewLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) WFWaterFallCollectionViewLayout *collectionViewFlowLayout;
//@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (nonatomic, copy) NSArray *heightArray;

@end

@implementation WFVideoViewController

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

@end
