//
//  WFDataController.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFDataController.h"

@implementation WFDataController

- (void)fetchData:(Completion)completion
{
    
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

@end
