//
//  WFRemarkModel.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFRemarkModel.h"

@implementation WFRemarkModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"remarkId" : @"id",
        @"userName" : @"userName",
        @"clothesId" : @"clothesId",
        @"remarkDescription" : @"description",
        @"date" : @"date",
    };
}

@end
