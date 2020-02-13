//
//  WFContentCollectionViewController.h
//  GraduationDesign
//
//  Created by wufeng on 2020/1/31.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WFContentCollectionViewDelegate <NSObject>

- (void)didScrollToContentPageAtIndex:(NSIndexPath *)indexPath;

@end

@interface WFContentCollectionViewController : UIViewController

@property (nonatomic, strong) UICollectionView *contentCollectionView;
@property (nonatomic, strong) id<WFContentCollectionViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
