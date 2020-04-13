//
//  AppDelegate.m
//  GraduationDesign
//
//  Created by wufeng on 2020/1/2.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "AppDelegate.h"
#import "WFTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    WFTabBarController *tabBarController = [[WFTabBarController alloc] init];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
