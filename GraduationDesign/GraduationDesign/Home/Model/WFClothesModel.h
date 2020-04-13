//
//  WFClothesModel.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFResponseModel.h"
#import <UIKit/UIKit.h>
#import "WFRemarkModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFClothesModel : WFResponseModel

@property (nonatomic, assign) NSInteger clothesId;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) NSInteger color;
@property (nonatomic, copy) NSString *clothesDescription;
@property (nonatomic, assign) NSInteger category;
@property (nonatomic, assign) NSInteger sales;
@property (nonatomic, assign) NSInteger stock;
@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, strong) NSArray<WFRemarkModel *> *remarkModels;

@end

NS_ASSUME_NONNULL_END
