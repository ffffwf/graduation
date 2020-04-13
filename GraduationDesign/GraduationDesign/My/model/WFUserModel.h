//
//  WFUserModel.h
//  GraduationDesign
//
//  Created by wufeng on 2020/1/29.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFUserModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger sex;

@end

@interface WFUserResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) WFUserModel *data;

@end

NS_ASSUME_NONNULL_END
