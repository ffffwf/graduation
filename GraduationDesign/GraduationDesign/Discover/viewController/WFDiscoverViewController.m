//
//  WFDiscoverViewController.m
//  GraduationDesign
//
//  Created by wufeng on 2020/2/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFDiscoverViewController.h"
#import "Masonry.h"
#import "AFNetworking.h"
#import "WFUserModel.h"
#import "WFExternVar.h"
#import "WFTitleCollectionViewController.h"
#import "WFContentCollectionViewController.h"
#import "WFSearchViewController.h"

@interface WFDiscoverViewController () <WFTitleCollectionViewDelegate, WFContentCollectionViewDelegate>

@property (nonatomic, strong) WFTitleCollectionViewController *titleCollectionViewController;
@property (nonatomic, strong) WFContentCollectionViewController *contentCollectionViewController;
@property (nonatomic, strong) UIView *slidingIndicator;
@property (nonatomic, strong) UIButton *searchIcon;

@end

@implementation WFDiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.contentCollectionViewController.contentCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.navigationController.navigationBar.hidden = YES;
    [self addChildViewController:self.titleCollectionViewController];
    [self addChildViewController:self.contentCollectionViewController];
    [self.view addSubview:self.titleCollectionViewController.view];
    [self.view addSubview:self.contentCollectionViewController.view];
    [self.view addSubview:self.slidingIndicator];
    [self.view addSubview:self.searchIcon];
    
    [self.titleCollectionViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(40);
        make.size.equalTo(@(CGSizeMake(100, 30)));
    }];
    [self.slidingIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.titleCollectionViewController.titleCollectionView);
        make.leading.equalTo(self.titleCollectionViewController.titleCollectionView).offset(8);
        make.size.equalTo(@(CGSizeMake(30, 3)));
    }];
    [self.contentCollectionViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.top.equalTo(self.titleCollectionViewController.view.mas_bottom);
        make.bottom.equalTo(self.view).offset(-self.tabBarController.tabBar.bounds.size.height);
    }];
    [self.searchIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleCollectionViewController.view);
        make.trailing.equalTo(self.view).offset(-16);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
}
- (void)titleAtIndexDidSelected:(NSIndexPath *)indexPath
{
    [self.contentCollectionViewController.contentCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (void)didScrollToContentPageAtIndex:(NSIndexPath *)indexPath

{
    if (indexPath.row == 0) {
        [UIView animateWithDuration:1 animations:^{
            [self.slidingIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(self.titleCollectionViewController.titleCollectionView).offset(8);
            }];
        }];
    } else {
        [UIView animateWithDuration:1 animations:^{
            [self.slidingIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(self.titleCollectionViewController.titleCollectionView).offset(58);
            }];
        }];
    }
}

- (void)p_searchIconTapped
{
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:[WFSearchViewController new] animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

- (WFTitleCollectionViewController *)titleCollectionViewController
{
    if (!_titleCollectionViewController) {
        _titleCollectionViewController = [WFTitleCollectionViewController new];
        _titleCollectionViewController.delegate = self;
    }
    return _titleCollectionViewController;
}

- (WFContentCollectionViewController *)contentCollectionViewController
{
    if (!_contentCollectionViewController) {
        _contentCollectionViewController = [WFContentCollectionViewController new];
        _contentCollectionViewController.delegate = self;
    }
    return _contentCollectionViewController;
}

- (UIView *)slidingIndicator
{
    if (!_slidingIndicator) {
        _slidingIndicator = [UIView new];
        _slidingIndicator.backgroundColor = RGB_COLOR(255, 51, 153);
        _slidingIndicator.layer.cornerRadius = 2;
        _slidingIndicator.layer.masksToBounds = YES;
    }
    return _slidingIndicator;
}

- (UIButton *)searchIcon
{
    if (!_searchIcon) {
        _searchIcon = [[UIButton alloc] init];
        [_searchIcon setImage:[UIImage imageNamed:@"search_icon"] forState:UIControlStateNormal];
        [_searchIcon addTarget:self action:@selector(p_searchIconTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchIcon;
}

@end
