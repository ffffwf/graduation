//
//  WFHomeViewController.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFHomeViewController.h"
#import "WFExternVar.h"
#import "Masonry.h"
#import "WFGoodsTableViewCell.h"
#import "WFShopCommonTableViewCell.h"
#import "WFShopAdvertisementSectionController.h"
#import "WFShopCategorySectionController.h"
#import "WFHotSearchSectionController.h"
#import "WFHomePageDataController.h"

typedef NS_ENUM(NSUInteger, WFShopSectionType)
{
    WFShopSectionTypeAdvertisement,
    WFShopSectionTypeCategory,
    WFShopSectionTypeGoods
};

static const NSInteger kSectionNum = 3;
static const CGFloat kSectionHeight = 100;
static const CGFloat kGoodsCellHeight = 140;
static NSString * const kGoodsCellIdentifier = @"WFGoodsTableViewCell";
static NSString * const kCommonCellIdentifier = @"WFShopCommonTableViewCell";

@interface WFHomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) WFShopAdvertisementSectionController *advertisementSectionVC;
@property (nonatomic, strong) WFShopCategorySectionController *categorySectionVC;
@property (nonatomic, strong) WFHotSearchSectionController *hotSearchSectionVC;
@property (nonatomic, strong) WFHomePageDataController *homePageDataController;

@end

@implementation WFHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self p_configUI];
    [self p_fetchData];
}

- (void)p_fetchData
{
    [self.homePageDataController fetchData:^(WFHomePageResponseModel *responseModel){
        [self.tableview reloadData];
    }];
}

- (void)p_configUI
{
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(STATUS_BAR_HEIGHT));
        make.leading.trailing.bottom.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kSectionNum;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case WFShopSectionTypeAdvertisement:
        case WFShopSectionTypeCategory:
            return 1;
            break;
        case WFShopSectionTypeGoods:
            return [self.homePageDataController.model.data count];
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WFShopCommonTableViewCell *cell;
    switch (indexPath.section) {
        case WFShopSectionTypeAdvertisement:
            cell = [tableView dequeueReusableCellWithIdentifier:kCommonCellIdentifier];
            cell.controller = self.advertisementSectionVC;
            break;
        case WFShopSectionTypeCategory:
            cell = [tableView dequeueReusableCellWithIdentifier:kCommonCellIdentifier];
            cell.controller = self.categorySectionVC;
            break;
        case WFShopSectionTypeGoods:
            cell = [tableView dequeueReusableCellWithIdentifier:kGoodsCellIdentifier];
            if (indexPath.row < [self.homePageDataController.model.data count]) {
                [((WFGoodsTableViewCell *)cell) configWithModel:self.homePageDataController.model.data[indexPath.row]];
            }
            break;
        default:
            return cell;
            break;
            
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case WFShopSectionTypeAdvertisement:
        case WFShopSectionTypeCategory:
            return kSectionHeight;
            break;
        case WFShopSectionTypeGoods:
            return kGoodsCellHeight;
            break;
        default:
            return 0;
            break;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == WFShopSectionTypeAdvertisement && !self.advertisementSectionVC.timer) {
        [self.advertisementSectionVC startScroll];
    }
}

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = [UIColor clearColor];
        [_tableview registerClass:[WFGoodsTableViewCell class] forCellReuseIdentifier:kGoodsCellIdentifier];
        [_tableview registerClass:[WFShopCommonTableViewCell class] forCellReuseIdentifier:kCommonCellIdentifier];
    }
    return _tableview;
}

- (WFShopAdvertisementSectionController *)advertisementSectionVC
{
    if (!_advertisementSectionVC) {
        _advertisementSectionVC = [[WFShopAdvertisementSectionController alloc] init];
    }
    return _advertisementSectionVC;
}

- (WFShopCategorySectionController *)categorySectionVC
{
    if (!_categorySectionVC) {
        _categorySectionVC = [WFShopCategorySectionController new];
    }
    return _categorySectionVC;
}

- (WFHotSearchSectionController *)hotSearchSectionVC
{
    if (!_hotSearchSectionVC) {
        _hotSearchSectionVC = [WFHotSearchSectionController new];
    }
    return _hotSearchSectionVC;
}

- (WFHomePageDataController *)homePageDataController
{
    if (!_homePageDataController) {
        _homePageDataController = [WFHomePageDataController new];
    }
    return _homePageDataController;
}

@end
