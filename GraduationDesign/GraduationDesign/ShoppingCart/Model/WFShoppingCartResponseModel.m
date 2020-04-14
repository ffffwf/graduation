//
//  WFShoppingCartResponseModel.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFShoppingCartResponseModel.h"

@implementation WFShoppingCartResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"status" : @"status",
        @"data" : @"data",
    };
}

+ (NSValueTransformer *)dataJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[WFClothesAndNumModel class]];
}

@end
