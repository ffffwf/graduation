//
//  WFTitleCollectionViewController.m
//  GraduationDesign
//
//  Created by wufeng on 2020/1/31.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFTitleCollectionViewController.h"
#import "WFTitleCollectionViewCell.h"
#import "Masonry.h"

static NSString * const cellReuseIdentifier = @"WFTitleCollectionViewCell";

@interface WFTitleCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation WFTitleCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleCollectionView];
    [self.titleCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WFTitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    NSString *title;
    if (indexPath.row == 0) {
        title = @"发现";
    } else {
        title = @"直播";
    }
    [cell configWithTitle:title];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(titleAtIndexDidSelected:)]) {
        [self.delegate titleAtIndexDidSelected:indexPath];
    }
}

- (UICollectionView *)titleCollectionView
{
    if (!_titleCollectionView) {
        
        _titleCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.collectionViewFlowLayout];
        _titleCollectionView.dataSource = self;
        _titleCollectionView.delegate = self;
        _titleCollectionView.backgroundColor = [UIColor clearColor];
        [_titleCollectionView registerClass:[WFTitleCollectionViewCell class] forCellWithReuseIdentifier:cellReuseIdentifier];
    }
    return _titleCollectionView;
}

- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    if (!_collectionViewFlowLayout) {
        _collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //_collectionViewFlowLayout.minimumInteritemSpacing = 15;
//        _collectionViewFlowLayout.minimumInteritemSpacing = 2;
        _collectionViewFlowLayout.minimumLineSpacing = 0;
        _collectionViewFlowLayout.itemSize = CGSizeMake(50, 30);
    }
    return _collectionViewFlowLayout;
}

@end
