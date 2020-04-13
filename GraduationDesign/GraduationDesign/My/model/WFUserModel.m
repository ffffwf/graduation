//
//  WFUserModel.m
//  GraduationDesign
//
//  Created by wufeng on 2020/1/29.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFUserModel.h"

@implementation WFUserModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"userId" : @"id",
        @"name" : @"name",
        @"sex" : @"sex"
    };
}

@end

@implementation WFUserResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"status" : @"status",
        @"data" : @"data"
    };
}

+ (NSValueTransformer *)dataJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[WFUserModel class]];
}

@end
