//
//  WFTitleCollectionViewController.h
//  GraduationDesign
//
//  Created by wufeng on 2020/1/31.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WFTitleCollectionViewDelegate <NSObject>

- (void)titleAtIndexDidSelected:(NSIndexPath *)indexPath;

@end

@interface WFTitleCollectionViewController : UIViewController

@property (nonatomic, strong) id<WFTitleCollectionViewDelegate> delegate;
@property (nonatomic, strong) UICollectionView *titleCollectionView;

@end

NS_ASSUME_NONNULL_END
