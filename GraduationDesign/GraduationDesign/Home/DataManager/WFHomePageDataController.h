//
//  WFHomePageDataController.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFHomePageResponseModel.h"
#import "WFDataController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFHomePageDataController : WFDataController

@property (nonatomic, strong) WFHomePageResponseModel *model;

@end

NS_ASSUME_NONNULL_END
