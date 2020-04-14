//
//  WFShoppingCartTableViewCell.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFShoppingCartTableViewCell.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface WFShoppingCartTableViewCell ()

@property (nonatomic, strong) UIImageView *picImageView;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic ,strong) UILabel *priceLabel;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UIButton *addButton;
 
@end

@implementation WFShoppingCartTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self p_configUI];
    }
    return self;
}

- (void)configWithModel:(WFClothesAndNumModel *)model
{
    [self.picImageView sd_setImageWithURL:model.clothesModel.imageUrls[0]];
    self.descriptionLabel.text = model.clothesModel.clothesDescription;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%.0f", model.clothesModel.price];
    self.numberLabel.text = [NSString stringWithFormat:@"%ld", (long)model.number];
}

- (void)p_configUI
{
    [self.contentView addSubview:self.selectButton];
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    
    [self.contentView addSubview:self.picImageView];
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.selectButton.mas_trailing);
        make.centerY.equalTo(self.selectButton);
        make.size.mas_equalTo(CGSizeMake(84, 84));
    }];
    
    [self.contentView addSubview:self.descriptionLabel];
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.picImageView.mas_trailing).offset(10);
        make.top.equalTo(self.picImageView);
    }];
    
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.descriptionLabel);
        make.top.equalTo(self.contentView).offset(65);
    }];
    
    [self.contentView addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-76);
        make.centerY.equalTo(self.priceLabel);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [self.contentView addSubview:self.numberLabel];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-44);
        make.centerY.equalTo(self.priceLabel);
        make.size.mas_equalTo(CGSizeMake(32, 24));
    }];
    
    [self.contentView addSubview:self.addButton];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-20);
        make.centerY.equalTo(self.priceLabel);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
}

- (void)p_selectButtonClicked
{
    self.selectButton.selected = !self.selectButton.selected;
    if (self.selectButtonClickedBlock) {
        self.selectButtonClickedBlock();
    }
}

- (void)p_deleteButtonClicked
{
    if (self.deleteButtonClickedBlock) {
        self.deleteButtonClickedBlock();
    }
}

- (void)p_addButtonClicked
{
    if (self.addButtonClickedBlock) {
        self.addButtonClickedBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
    }
    return _picImageView;
}

- (UILabel *)descriptionLabel
{
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
    }
    return _descriptionLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
    }
    return _priceLabel;
}

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _numberLabel;
}

- (UIButton *)selectButton
{
    if (!_selectButton) {
        _selectButton = [[UIButton alloc] init];
        [_selectButton setImage:[UIImage imageNamed:@"unselected_radio_button"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"selected_radio_button"] forState:UIControlStateSelected];
        [_selectButton addTarget:self action:@selector(p_selectButtonClicked)  forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] init];
        [_deleteButton setImage:[UIImage imageNamed:@"delete_button"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(p_deleteButtonClicked)  forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

- (UIButton *)addButton
{
    if (!_addButton) {
        _addButton = [[UIButton alloc] init];
        [_addButton setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(p_addButtonClicked)  forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

@end
