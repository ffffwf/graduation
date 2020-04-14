//
//  WFSettingViewController.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/15.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFSettingViewController.h"
#import "WFExternVar.h"
#import "WFSettingTableViewCell.h"
#import "Masonry.h"

static const CGFloat kNumberOfRows = 2;
static NSString * const kCellIdentifier = @"WFSettingTableViewCell";

@interface WFSettingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation WFSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_configUI];
}

- (void)p_configUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title;
    if (indexPath.row == 0) {
        title = @"修改信息";
    } else {
        title = @"修改密码";
    }
    WFSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell configWithTitle:title];
    return cell;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[WFSettingTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    return _tableView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"设置";
    }
    return _titleLabel;
}

@end
