//
//  WFClothesAndNumModel.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFClothesAndNumModel.h"

@implementation WFClothesAndNumModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"clothesModel" : @"clothesVO",
        @"number" : @"number",
    };
}

+ (NSValueTransformer *)clothesModelJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[WFClothesModel class]];
}

@end
