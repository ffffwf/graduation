//
//  WFSearchViewController.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/3/28.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFSearchViewController.h"
#import "WFExternVar.h"
#import "Masonry.h"
#import "WFSearchHistoryTableViewCell.h"
#import "WFSearchSuggestionViewController.h"
#import "WFSearchResultViewController.h"

static NSString * const KCellIdentifier = @"WFSearchHistoryTableViewCell";

@interface WFSearchViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) WFSearchSuggestionViewController *searchSuggestionViewController;

@end

@implementation WFSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setUI];
}

- (void)p_setUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(15);
        make.trailing.mas_offset(-60);
        make.top.mas_equalTo(40);
        make.height.mas_equalTo(30);
    }];
    
    [self.view addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(-15);
        make.centerY.equalTo(self.searchBar);
        make.size.mas_equalTo(CGSizeMake(40, 30));
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
        make.top.equalTo(self.searchBar.mas_bottom).offset(10);
    }];
    
//    [self addChildViewController:self.searchSuggestionViewController];
//    [self.view addSubview:self.searchSuggestionViewController.view];
//    [self.searchSuggestionViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.tableView);
//    }];
}

- (void)p_cancelBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WFSearchHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCellIdentifier];
    cell.deleteBtnBlock = ^(NSString *labelText){
        
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    _searchSuggestionViewController.view.hidden = NO;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[WFSearchResultViewController new] animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.searchBar resignFirstResponder];
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        [_searchBar setImage:[UIImage imageNamed:@"searchbar_icon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [_searchBar setTintColor:RGB_COLOR(255, 51, 153)];
        [_searchBar setBackgroundImage:[UIImage new]];
        _searchBar.searchTextField.layer.cornerRadius = 3;
        _searchBar.searchTextField.layer.masksToBounds = YES;
        _searchBar.delegate = self;
    }
    return _searchBar;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[WFSearchHistoryTableViewCell class] forCellReuseIdentifier:KCellIdentifier];
    }
    return _tableView;
}

- (WFSearchSuggestionViewController *)searchSuggestionViewController
{
    if (!_searchSuggestionViewController) {
        _searchSuggestionViewController = [[WFSearchSuggestionViewController alloc] init];
        _searchSuggestionViewController.view.hidden = YES;
    }
    return _searchSuggestionViewController;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(p_cancelBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

@end
