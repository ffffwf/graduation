//
//  WFHomePageResponseModel.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFHomePageResponseModel.h"

@implementation WFHomePageResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"data" : @"data",
        @"status" : @"status",
    };
}

+ (NSValueTransformer *)dataJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[WFClothesModel class]];
}

@end
