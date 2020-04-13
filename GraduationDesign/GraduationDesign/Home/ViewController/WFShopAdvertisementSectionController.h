//
//  WFShopAdvertisementSectionController.h
//  GraduationDesign
//
//  Created by wufeng on 2020/2/28.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFShopAdvertisementSectionController : UIViewController

@property (nonatomic, strong) NSTimer *timer;

- (void)startScroll;

@end

NS_ASSUME_NONNULL_END
