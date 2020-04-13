//
//  WFShopCategorySectionController.m
//  GraduationDesign
//
//  Created by wufeng on 2020/2/28.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFShopCategorySectionController.h"
#import "WFCategoryCollectionViewCell.h"
#import "Masonry.h"
#import "WFExternVar.h"

static NSString * kCellIdentifier = @"WFCategoryCollectionViewCell";

@interface WFShopCategorySectionController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation WFShopCategorySectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        make.leading.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 100));
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 18;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WFCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(50, 50);
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.collectionViewFlowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[WFCategoryCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    if (!_collectionViewFlowLayout) {
        _collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionViewFlowLayout.minimumInteritemSpacing = 0;
        _collectionViewFlowLayout.minimumLineSpacing = 0;
        //_collectionViewFlowLayout.itemSize = CGSizeMake(50, 50);
    }
    return _collectionViewFlowLayout;
}

@end
