//
//  WFShoppingCartViewController.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFShoppingCartViewController.h"
#import "Masonry.h"
#import "WFExternVar.h"
#import "WFShoppingCartTableViewCell.h"
#import "WFShoppingCartDataController.h"
#import "WFExternVar.h"

static NSString * const kCellIdentifier = @"WFShoppingCartTableViewCell";

@interface WFShoppingCartViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) WFShoppingCartDataController *dataController;
@property (nonatomic, strong) UIView *totalContainerView;
@property (nonatomic, strong) UIButton *selectAllButton;
@property (nonatomic, strong) UILabel *selectAllLabel;
@property (nonatomic, strong) UILabel *totalPriceLabel;
@property (nonatomic, strong) UIButton *calculateButton;

@end

@implementation WFShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self p_configUI];
    [self p_fetchData];
}

- (void)p_fetchData
{
    [self.dataController fetchData:^{
        [self.tableView reloadData];
    }];
}

- (void)p_configUI
{
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(STATUS_BAR_HEIGHT);
        make.centerX.equalTo(self.view);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.leading.trailing.bottom.equalTo(self.view);
    }];
    
    [self.view addSubview:self.totalContainerView];
    [self.totalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-TAB_BAR_HEIGHT);
        make.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(49);
    }];
    
    [self.view addSubview:self.selectAllButton];
    [self.selectAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.totalContainerView).offset(10);
        make.centerY.equalTo(self.totalContainerView);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [self.view addSubview:self.selectAllLabel];
    [self.selectAllLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.selectAllButton.mas_trailing).offset(5);
        make.centerY.equalTo(self.totalContainerView);
    }];
    
    [self.view addSubview:self.calculateButton];
    [self.calculateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view).offset(-10);
        make.centerY.equalTo(self.totalContainerView);
        make.size.mas_equalTo(CGSizeMake(40, 24));
    }];
    
    [self.view addSubview:self.totalPriceLabel];
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.calculateButton.mas_leading).offset(-35);
        make.centerY.equalTo(self.totalContainerView);
    }];
}

- (void)p_selectAllButtonClicked
{
    self.selectAllButton.selected = !self.selectAllButton.selected;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController.model.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WFShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell configWithModel:self.dataController.model.data[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[WFShoppingCartTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    return _tableView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"购物车";
    }
    return _titleLabel;
}

- (WFShoppingCartDataController *)dataController
{
    if (!_dataController) {
        _dataController = [[WFShoppingCartDataController alloc] init];
    }
    return _dataController;
}

- (UIView *)totalContainerView
{
    if (!_totalContainerView) {
        _totalContainerView = [[UIView alloc] init];
        _totalContainerView.backgroundColor = [UIColor whiteColor];
        _totalContainerView.layer.borderWidth = 0.5;
        _totalContainerView.layer.borderColor = RGB_COLOR(243, 243, 243).CGColor;
    }
    return _totalContainerView;
}

- (UIButton *)selectAllButton
{
    if (!_selectAllButton) {
        _selectAllButton = [[UIButton alloc] init];
        [_selectAllButton setImage:[UIImage imageNamed:@"unselected_radio_button"] forState:UIControlStateNormal];
        [_selectAllButton setImage:[UIImage imageNamed:@"selected_radio_button"] forState:UIControlStateSelected];
        [_selectAllButton addTarget:self action:@selector(p_selectAllButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectAllButton;
}

- (UIButton *)calculateButton
{
    if (!_calculateButton) {
        _calculateButton = [[UIButton alloc] init];
        _calculateButton.backgroundColor = [UIColor redColor];
    }
    return _calculateButton;
}

- (UILabel *)selectAllLabel
{
    if (!_selectAllLabel) {
        _selectAllLabel = [[UILabel alloc] init];
        _selectAllLabel.text = @"全选";
    }
    return _selectAllLabel;
}

- (UILabel *)totalPriceLabel
{
    if (!_totalPriceLabel) {
        _totalPriceLabel = [[UILabel alloc] init];
        _totalPriceLabel.text = @"合计:500¥";
    }
    return _totalPriceLabel;
}

@end
