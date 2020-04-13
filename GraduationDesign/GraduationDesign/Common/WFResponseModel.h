//
//  WFResponseModel.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *status;

@end

NS_ASSUME_NONNULL_END
