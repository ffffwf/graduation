//
//  WFClothesModel.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFClothesModel.h"

@implementation WFClothesModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"clothesId" : @"id",
        @"price" : @"price",
        @"color" : @"color",
        @"clothesDescription" : @"description",
        @"category" : @"category",
        @"sales" : @"sales",
        @"stock" : @"stock",
        @"imageUrls" : @"imageUrls",
        @"remarkModels" : @"remarkModels"
    };
}

+ (NSValueTransformer *)remarkModelsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[WFRemarkModel class]];
}


@end
