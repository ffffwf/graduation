//
//  WFSettingTableViewCell.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/15.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFSettingTableViewCell.h"
#import "Masonry.h"

@interface WFSettingTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation WFSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self p_configUI];
    }
    return self;
}

- (void)p_configUI
{
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(20);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)configWithTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"订单";
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

@end
