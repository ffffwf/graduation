//
//  WFContentCollectionViewCell.m
//  GraduationDesign
//
//  Created by wufeng on 2020/1/31.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFContentCollectionViewCell.h"
#import "WFLiveViewController.h"
#import "WFVideoViewController.h"
#import "Masonry.h"

@interface WFContentCollectionViewCell ()

@property (nonatomic, strong) WFLiveViewController *liveViewController;
@property (nonatomic, strong) WFVideoViewController *videoViewController;

@end

@implementation WFContentCollectionViewCell

- (void)configWithIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0) {
        [self.contentView addSubview:self.videoViewController.view];
        [self.videoViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
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

- (WFVideoViewController *)videoViewController
{
    if (!_videoViewController) {
        _videoViewController = [WFVideoViewController new];
    }
    return _videoViewController;
}

@end
