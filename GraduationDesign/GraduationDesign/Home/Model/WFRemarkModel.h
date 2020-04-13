//
//  WFRemarkModel.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFRemarkModel : WFResponseModel

@property (nonatomic, assign) NSInteger remarkId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) NSInteger clothesId;
@property (nonatomic, copy) NSString *remarkDescription;
@property (nonatomic, assign) NSInteger date;

@end

NS_ASSUME_NONNULL_END
