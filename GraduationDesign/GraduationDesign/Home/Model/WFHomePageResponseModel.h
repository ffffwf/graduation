//
//  WFHomePageResponseModel.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFResponseModel.h"
#import "WFClothesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFHomePageResponseModel : WFResponseModel

@property (nonatomic, strong) NSArray<WFClothesModel *> *data;

@end

NS_ASSUME_NONNULL_END
