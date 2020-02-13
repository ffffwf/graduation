//
//  WFWaterFallCollectionViewLayout.h
//  GraduationDesign
//
//  Created by wufeng on 2020/2/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WFWaterFallCollectionViewLayout;

@protocol WFWaterFallCollectionViewLayoutDelegate <NSObject>
@required
- (CGFloat)waterFallLayout:(WFWaterFallCollectionViewLayout *)waterFallLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
- (NSUInteger)columnCountInWaterFallLayout:(WFWaterFallCollectionViewLayout *)waterFallLayout;

- (CGFloat)columnMarginInWaterFallLayout:(WFWaterFallCollectionViewLayout *)waterFallLayout;

- (CGFloat)rowMarginInWaterFallLayout:(WFWaterFallCollectionViewLayout *)waterFallLayout;

- (UIEdgeInsets)edgeInsetdInWaterFallLayout:(WFWaterFallCollectionViewLayout *)waterFallLayout;

@end

@interface WFWaterFallCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, weak) id<WFWaterFallCollectionViewLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
