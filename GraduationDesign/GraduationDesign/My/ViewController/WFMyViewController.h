//
//  WFMyViewController.h
//  GraduationDesign
//
//  Created by wufeng on 2020/1/30.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, WFOrderType)
{
    WFOrderTypeWaitToPay,
    WFOrderTypeWaitToReceive,
    WFOrderTypeWaitToRemark,
    WFOrderTypeFinished,
    WFOrderTypeCanceled,
};

@interface WFMyViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
