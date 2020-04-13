//
//  WFHomePageDataController.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFHomePageResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^Completion)(WFHomePageResponseModel *responseModel);

@interface WFHomePageDataController : NSObject

@property (nonatomic, strong) WFHomePageResponseModel *model;

- (void)fetchData:(Completion)completion;

@end

NS_ASSUME_NONNULL_END
