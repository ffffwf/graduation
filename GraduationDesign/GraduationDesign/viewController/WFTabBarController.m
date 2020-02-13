//
//  WFTabBarController.m
//  GraduationDesign
//
//  Created by wufeng on 2020/1/30.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFTabBarController.h"
#import "WFHomeViewController.h"
#import "WFShopViewController.h"
#import "WFMessageViewController.h"
#import "WFMyViewController.h"

typedef NS_ENUM(NSUInteger, WFTabBarControllerTag)
{
    WFTabBarControllerHome,
    WFTabBarControllerShop,
    WFTabBarControllerMessage,
    WFTabBarControllerMy,
};

@interface WFTabBarController ()

@end

@implementation WFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.backgroundImage = [UIImage new];
    [self p_addChildVC:[WFHomeViewController new] title:@"首页" tag:WFTabBarControllerHome];
    [self p_addChildVC:[WFShopViewController new] title:@"购物" tag:WFTabBarControllerShop];
    [self p_addChildVC:[WFMessageViewController new] title:@"消息" tag:WFTabBarControllerMessage];
    [self p_addChildVC:[WFMyViewController new] title:@"我" tag:WFTabBarControllerMy];
}

- (void)p_addChildVC:(UIViewController *)childVC title:(NSString *)title tag:(WFTabBarControllerTag)tag
{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:childVC];
    navigationController.tabBarItem.title = title;
    navigationController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -14);
    navigationController.tabBarItem.tag = tag;
    [navigationController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.0f], NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
    [navigationController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.0f], NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    [self addChildViewController:navigationController];
}

@end
