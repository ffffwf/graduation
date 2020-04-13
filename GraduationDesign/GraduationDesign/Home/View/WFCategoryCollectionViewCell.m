//
//  WFCategoryCollectionViewCell.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/7.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFCategoryCollectionViewCell.h"
#import "Masonry.h"

@interface WFCategoryCollectionViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation WFCategoryCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.contentView.backgroundColor = [UIColor greenColor];
        [self p_configUI];
    }
    return self;
}

- (void)p_configUI
{
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-15);
        make.size.equalTo(@(CGSizeMake(20, 20)));
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-2);
    }];
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
//        _iconImageView.layer.cornerRadius = 15;
//        _iconImageView.layer.masksToBounds = YES;
        [_iconImageView setImage:[UIImage imageNamed:@"goods_icon"]];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"衣服";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:6];
    }
    return _titleLabel;
}

@end
