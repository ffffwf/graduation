//
//  WFGoodsTableViewCell.h
//  GraduationDesign
//
//  Created by wufeng on 2020/2/28.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFShopCommonTableViewCell.h"
#import "WFClothesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFGoodsTableViewCell : WFShopCommonTableViewCell

- (void)configWithModel:(WFClothesModel *)model;

@end

NS_ASSUME_NONNULL_END
