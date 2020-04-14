//
//  WFDataController.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFResponseModel.h"
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^Completion)(void);

@interface WFDataController : WFResponseModel

@property (nonatomic, strong) AFHTTPSessionManager *manager;

- (void)fetchData:(Completion)completion;

@end

NS_ASSUME_NONNULL_END
