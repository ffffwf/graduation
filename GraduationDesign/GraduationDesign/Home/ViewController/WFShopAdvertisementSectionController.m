//
//  WFShopAdvertisementSectionController.m
//  GraduationDesign
//
//  Created by wufeng on 2020/2/28.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFShopAdvertisementSectionController.h"
#import "Masonry.h"
#import "WFExternVar.h"

static const CGFloat kSectionHeight = 100;

@interface WFShopAdvertisementSectionController ()

@property (nonatomic, strong) UIScrollView *bannerScrollView;
@property (nonatomic, strong) UIPageControl *bannerPageControl;
@property (nonatomic, strong) UIButton *leftBannerButton;
@property (nonatomic, strong) UIButton *middleBannerButton;
@property (nonatomic, strong) UIButton *rightBannerButton;
@property (nonatomic, assign) CGSize viewSize;

@property (nonatomic, strong) UIImage *leftImage;
@property (nonatomic, strong) UIImage *middleImage;
@property (nonatomic, strong) UIImage *rightImage;

@end

@implementation WFShopAdvertisementSectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
}

- (void)startScroll
{
    self.viewSize = CGSizeMake(SCREEN_WIDTH, kSectionHeight) ;
   // self.viewSize = self.view.bounds.size;
    self.leftImage = [UIImage imageNamed:@"banner_first"];
    self.middleImage = [UIImage imageNamed:@"banner_second"];
    self.rightImage = [UIImage imageNamed:@"banner_third"];
    [self p_configUI];
    [self p_reloadBanner];
    [self p_startTimer];
}

- (void)p_configUI
{
    [self.view addSubview:self.bannerScrollView];
    [self.bannerScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.bannerScrollView.contentSize = CGSizeMake(self.viewSize.width * 3, self.viewSize.height);
    
    [self.view addSubview:self.bannerPageControl];
    [self.bannerPageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(60, 15));
    }];
    self.bannerPageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    self.bannerPageControl.pageIndicatorTintColor = [UIColor redColor];
    self.bannerPageControl.numberOfPages = 3;
    self.bannerPageControl.currentPage = 2;
}

- (void)p_startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(p_scrollView) userInfo:nil repeats:YES];
}

- (void)p_scrollView
{
    [UIView animateWithDuration:0.5 animations:^{
        self.bannerScrollView.contentOffset = CGPointMake(self.viewSize.width, 0);
    } completion:^(BOOL finished) {
        [self p_reloadBanner];
    }];
}

- (void)p_reloadBanner
{
    [self.leftBannerButton removeFromSuperview];
    [self.middleBannerButton removeFromSuperview];
    [self.rightBannerButton removeFromSuperview];
    self.bannerScrollView.contentOffset = CGPointZero;
    if (self.bannerPageControl.currentPage == 2) {
        [self.leftBannerButton setBackgroundImage:self.leftImage forState:UIControlStateNormal];
        [self.middleBannerButton setBackgroundImage:self.middleImage forState:UIControlStateNormal];
        [self.rightBannerButton setBackgroundImage:self.rightImage forState:UIControlStateNormal];
        self.bannerPageControl.currentPage = 0;
    } else if (self.bannerPageControl.currentPage == 0) {
        [self.leftBannerButton setBackgroundImage:self.middleImage forState:UIControlStateNormal];
        [self.middleBannerButton setBackgroundImage:self.rightImage forState:UIControlStateNormal];
        [self.rightBannerButton setBackgroundImage:self.leftImage forState:UIControlStateNormal];
        self.bannerPageControl.currentPage = 1;
    } else {
        [self.leftBannerButton setBackgroundImage:self.rightImage forState:UIControlStateNormal];
        [self.middleBannerButton setBackgroundImage:self.leftImage forState:UIControlStateNormal];
        [self.rightBannerButton setBackgroundImage:self.middleImage forState:UIControlStateNormal];
        self.bannerPageControl.currentPage = 2;
    }
    
    [self.bannerScrollView addSubview:self.leftBannerButton];
    [self.leftBannerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(self.bannerScrollView);
        make.size.mas_equalTo(self.viewSize);
    }];

    [self.bannerScrollView addSubview:self.middleBannerButton];
    [self.middleBannerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bannerScrollView);
        make.leading.equalTo(self.bannerScrollView).offset(self.viewSize.width);
        make.size.mas_equalTo(self.viewSize);
    }];

    [self.bannerScrollView addSubview:self.rightBannerButton];
    [self.rightBannerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bannerScrollView);
        make.leading.equalTo(self.bannerScrollView).offset(self.viewSize.width * 2);
        make.size.mas_equalTo(self.viewSize);
    }];
}

- (UIScrollView *)bannerScrollView
{
    if (!_bannerScrollView) {
        _bannerScrollView = [[UIScrollView alloc] init];
        _bannerScrollView.pagingEnabled = YES;
        _bannerScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _bannerScrollView;
}

- (UIPageControl *)bannerPageControl
{
    if (!_bannerPageControl) {
        _bannerPageControl = [[UIPageControl alloc] init];
    }
    return _bannerPageControl;
}

- (UIButton *)leftBannerButton
{
    if (!_leftBannerButton) {
        _leftBannerButton = [[UIButton alloc] init];
    }
    return _leftBannerButton;
}

- (UIButton *)middleBannerButton
{
    if (!_middleBannerButton) {
        _middleBannerButton = [[UIButton alloc] init];
    }
    return _middleBannerButton;
}

- (UIButton *)rightBannerButton
{
    if (!_rightBannerButton) {
        _rightBannerButton = [[UIButton alloc] init];
    }
    return _rightBannerButton;
}

@end
