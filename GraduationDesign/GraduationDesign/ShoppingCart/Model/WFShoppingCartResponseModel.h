//
//  WFShoppingCartResponseModel.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFResponseModel.h"
#import "WFClothesAndNumModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFShoppingCartResponseModel : WFResponseModel

@property (nonatomic, strong) NSArray<WFClothesAndNumModel *> *data;

@end

NS_ASSUME_NONNULL_END
