//
//  WFShoppingCartTableViewCell.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/14.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFClothesAndNumModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^CallBackBlock)(void);

@interface WFShoppingCartTableViewCell : UITableViewCell

@property (nonatomic, copy) CallBackBlock addButtonClickedBlock;
@property (nonatomic, copy) CallBackBlock deleteButtonClickedBlock;
@property (nonatomic, copy) CallBackBlock selectButtonClickedBlock;

- (void)configWithModel:(WFClothesAndNumModel *)model;

@end

NS_ASSUME_NONNULL_END
