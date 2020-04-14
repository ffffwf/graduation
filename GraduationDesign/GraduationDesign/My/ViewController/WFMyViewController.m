//
//  WFMyViewController.m
//  GraduationDesign
//
//  Created by wufeng on 2020/1/30.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFMyViewController.h"
#import "WFOrderCollectionViewCell.h"
#import "WFMyHeaderCollectionReusableView.h"
#import "Masonry.h"
#import "WFExternVar.h"
#import "WFSettingViewController.h"

const static CGFloat kCellNum = 5;
static NSString * const kCellIdentifier = @"WFOrderCollectionViewCell";
static NSString * const kHeaderIdentifier = @"WFMyHeaderCollectionReusableView";

@interface WFMyViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (nonatomic, strong) UIButton *settingButton;

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
        make.top.equalTo(self.view).offset(50);
        make.leading.equalTo(self.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarImageView.mas_bottom).offset(25);
        make.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
    [self.view addSubview:self.settingButton];
    [self.settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view).offset(-20);
        make.centerY.equalTo(self.avatarImageView);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
}

- (void)p_settingButtonClicked
{
    self.hidesBottomBarWhenPushed=YES;
   [self.navigationController pushViewController:[WFSettingViewController new] animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return kCellNum;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WFOrderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    [cell configWithOrderType:indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    WFMyHeaderCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier forIndexPath:indexPath];
    [reusableView configWithTitle:@"我的订单"];
    return reusableView;
}

- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.image = [UIImage imageNamed:@"avatar"];
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
        [_collectionView registerClass:[WFMyHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    if (!_collectionViewFlowLayout) {
        _collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
//        _collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionViewFlowLayout.minimumInteritemSpacing = 0;
        _collectionViewFlowLayout.minimumLineSpacing = 0;
        _collectionViewFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 5, 60);
        _collectionViewFlowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 30);
    }
    return _collectionViewFlowLayout;
}

- (UIButton *)settingButton
{
    if (!_settingButton) {
        _settingButton = [[UIButton alloc] init];
        [_settingButton setImage:[UIImage imageNamed:@"setting_icon"] forState:UIControlStateNormal];
        [_settingButton addTarget:self action:@selector(p_settingButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingButton;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"我的";
    }
    return _titleLabel;
}

@end
