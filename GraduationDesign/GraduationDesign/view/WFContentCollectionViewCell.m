//
//  WFContentCollectionViewCell.m
//  GraduationDesign
//
//  Created by wufeng on 2020/1/31.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFContentCollectionViewCell.h"
#import "WFLiveViewController.h"
#import "WFDiscoverViewController.h"
#import "Masonry.h"

@interface WFContentCollectionViewCell ()

@property (nonatomic, strong) WFLiveViewController *liveViewController;
@property (nonatomic, strong) WFDiscoverViewController *discoverViewController;

@end

@implementation WFContentCollectionViewCell

- (void)configWithIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0) {
        [self.contentView addSubview:self.discoverViewController.view];
        [self.discoverViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    } else {
        [self.contentView addSubview:self.liveViewController.view];
        [self.liveViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
}

- (WFLiveViewController *)liveViewController
{
    if (!_liveViewController) {
        _liveViewController = [WFLiveViewController new];
    }
    return _liveViewController;
}

- (WFDiscoverViewController *)discoverViewController
{
    if (!_discoverViewController) {
        _discoverViewController = [WFDiscoverViewController new];
    }
    return _discoverViewController;
}

@end
