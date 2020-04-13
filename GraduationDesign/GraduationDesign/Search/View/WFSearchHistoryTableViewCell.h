//
//  WFSearchHistoryTableViewCell.h
//  GraduationDesign
//
//  Created by 吴峰 on 2020/3/28.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFSearchHistoryTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^deleteBtnBlock)(NSString *);

@end

NS_ASSUME_NONNULL_END
