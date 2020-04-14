//
//  WFShoppingCartDataController.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFShoppingCartDataController.h"


@implementation WFShoppingCartDataController

- (void)fetchData:(Completion)completion
{
    NSDictionary *params = @{@"customer_id" : @1};
    [self.manager GET:@"http://192.168.8.221:8088/customer/getshoppingcart" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
       
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        self.model = [MTLJSONAdapter modelOfClass:[WFShoppingCartResponseModel class] fromJSONDictionary:responseObject error:nil];
        completion();
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

@end
