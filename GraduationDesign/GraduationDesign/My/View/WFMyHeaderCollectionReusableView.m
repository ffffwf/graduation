//
//  WFMyHeaderCollectionReusableView.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/15.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFMyHeaderCollectionReusableView.h"
#import <Masonry/Masonry.h>

@interface WFMyHeaderCollectionReusableView ()

@property (nonatomic, strong) UILabel *titleLabel;
 
@end


@implementation WFMyHeaderCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_configUI];
    }
    return self;
}

- (void)configWithTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (void)p_configUI
{
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.leading.equalTo(self).offset(20);
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

@end
