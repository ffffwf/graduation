//
//  WFGoodsTableViewCell.m
//  GraduationDesign
//
//  Created by wufeng on 2020/2/28.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFGoodsTableViewCell.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface WFGoodsTableViewCell ()

@property (nonatomic, strong) UIImageView *picImageView;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *salesLabel;
@property (nonatomic ,strong) UILabel *priceLabel;
 
@end

@implementation WFGoodsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self p_configUI];
    }
    return self;
}

- (void)p_configUI
{
    [self.contentView addSubview:self.picImageView];
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).offset(25);
        make.size.mas_equalTo(CGSizeMake(130, 130));
    }];
    
    [self.contentView addSubview:self.descriptionLabel];
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.picImageView.mas_trailing).offset(10);
        make.top.equalTo(self.picImageView).offset(10);
    }];
    
    [self.contentView addSubview:self.salesLabel];
    [self.salesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.descriptionLabel);
        make.top.equalTo(self.descriptionLabel.mas_bottom).offset(10);
    }];
    
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.descriptionLabel);
        make.bottom.equalTo(self.picImageView);
    }];
}

- (void)configWithModel:(WFClothesModel *)model
{
    [self.picImageView sd_setImageWithURL:model.imageUrls[0]];
    self.descriptionLabel.text = model.clothesDescription;
    self.salesLabel.text = [NSString stringWithFormat:@"已售%ld件", (long)model.sales];
    self.priceLabel.text = [NSString stringWithFormat:@"%.0f¥", model.price];
}

- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.image = [UIImage imageNamed:@"clothes_icon"];
    }
    return _picImageView;
}

- (UILabel *)descriptionLabel
{
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.text = @"最新衣服特价超低大甩卖";
        _descriptionLabel.textColor = [UIColor blackColor];
    }
    return _descriptionLabel;
}

- (UILabel *)salesLabel
{
    if (!_salesLabel) {
        _salesLabel = [[UILabel alloc] init];
        _salesLabel.text = @"已售3289件";
        _salesLabel.textColor = [UIColor blackColor];
    }
    return _salesLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.text = @"¥45";
        _priceLabel.textColor = [UIColor blackColor];
    }
    return _priceLabel;
}

@end
