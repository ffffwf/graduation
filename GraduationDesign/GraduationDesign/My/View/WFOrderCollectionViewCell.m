//
//  WFOrderCollectionViewCell.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/8.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFOrderCollectionViewCell.h"
#import "Masonry.h"

@interface WFOrderCollectionViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation WFOrderCollectionViewCell

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
        make.size.equalTo(@(CGSizeMake(40, 40)));
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-2);
    }];
}

- (void)configWithOrderType:(WFOrderType)orderType
{
    switch (orderType) {
        case WFOrderTypeWaitToPay:
            self.titleLabel.text = @"待支付";
            break;
        case WFOrderTypeWaitToReceive:
            self.titleLabel.text = @"待收货";
            break;
        case WFOrderTypeWaitToRemark:
            self.titleLabel.text = @"待评价";
            break;
        case WFOrderTypeFinished:
            self.titleLabel.text = @"已完成";
            break;
        case WFOrderTypeCanceled:
            self.titleLabel.text = @"已取消";
            break;
        default:
            break;
    }
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
        _titleLabel.text = @"订单";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

@end
