//
//  WFHomePageDataController.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFHomePageDataController.h"
#import "AFNetworking.h"

@interface WFHomePageDataController ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation WFHomePageDataController

- (void)fetchData:(Completion)completion
{
    [self.manager GET:@"http://192.168.8.221:8088/customer/clothesinfo" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        self.model = [MTLJSONAdapter modelOfClass:[WFHomePageResponseModel class] fromJSONDictionary:responseObject error:nil];
        completion(self.model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

@end
