//
//  WFSearchHistoryTableViewCell.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/3/28.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFSearchHistoryTableViewCell.h"
#import "Masonry.h"

@interface WFSearchHistoryTableViewCell ()

@property (nonatomic, strong) UILabel *historyLabel;
@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation WFSearchHistoryTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_configUI];
    }
    return self;
}

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
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.historyLabel];
    [self.historyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(30);
    }];
    
    [self.contentView addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-15);
        make.centerY.equalTo(self.historyLabel);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
}

- (void)p_deleteBtnTapped
{
    if (self.deleteBtnBlock) {
        self.deleteBtnBlock(self.historyLabel.text);
    }
}

- (UILabel *)historyLabel
{
    if (!_historyLabel) {
        _historyLabel = [[UILabel alloc] init];
        _historyLabel.text = @"历史";
        _historyLabel.textColor = [UIColor blackColor];
    }
    return _historyLabel;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] init];
        [_deleteButton setImage:[UIImage imageNamed:@"delete_icon"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(p_deleteBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

@end
