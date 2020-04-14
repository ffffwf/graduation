//
//  WFClothesAndNumModel.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFResponseModel.h"
#import "WFClothesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFClothesAndNumModel : WFResponseModel

@property (nonatomic, strong) WFClothesModel *clothesModel;
@property (nonatomic, assign) NSInteger number;

@end

NS_ASSUME_NONNULL_END
