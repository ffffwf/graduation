//
//  WFShoppingCartDataController.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFDataController.h"
#import "WFShoppingCartResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFShoppingCartDataController : WFDataController

@property (nonatomic, strong) WFShoppingCartResponseModel *model;

@end

NS_ASSUME_NONNULL_END
