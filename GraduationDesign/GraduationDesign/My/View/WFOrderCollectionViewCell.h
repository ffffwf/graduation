//
//  WFOrderCollectionViewCell.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/4/8.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFMyViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFOrderCollectionViewCell : UICollectionViewCell

- (void)configWithOrderType:(WFOrderType)orderType;

@end

NS_ASSUME_NONNULL_END
