//
//  WFMyViewController.m
//  GraduationDesign
//
//  Created by wufeng on 2020/1/30.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFMyViewController.h"
#import "WFOrderCollectionViewCell.h"
#import "Masonry.h"
#import "WFExternVar.h"

const static CGFloat kCellNum = 5;
static NSString * const kCellIdentifier = @"WFOrderCollectionViewCell";

@interface WFMyViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation WFMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_configUI];
}

- (void)p_configUI
{
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.avatarImageView];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.leading.equalTo(self.view).offset(20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarImageView).offset(20);
        make.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return kCellNum;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
    } else {
        
    }
    //return reusableView;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    view.backgroundColor = [UIColor redColor];
    return view;
}

- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.image = [UIImage imageNamed:@"AppIcon"];
        _avatarImageView.layer.cornerRadius = 30;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.collectionViewFlowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[WFOrderCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
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
        _collectionViewFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 5, 100);
    }
    return _collectionViewFlowLayout;
}

@end
