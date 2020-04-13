//
//  WFContentCollectionViewController.m
//  GraduationDesign
//
//  Created by wufeng on 2020/1/31.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFContentCollectionViewController.h"
#import "Masonry.h"
#import "WFExternVar.h"
#import "WFContentCollectionViewCell.h"

static NSString * const cellReuseIdentifier = @"WFContentCollectionViewCell";

@interface WFContentCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation WFContentCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.contentCollectionView];
    [self.contentCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WFContentCollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    [cell configWithIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.bounds.size;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self p_onScrollDidEnd];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(!decelerate){
       [self p_onScrollDidEnd];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self p_onScrollDidEnd];
}

- (void)p_onScrollDidEnd
{
    if ([self.delegate respondsToSelector:@selector(didScrollToContentPageAtIndex:)]) {
        [self.contentCollectionView layoutIfNeeded];
        [self.delegate didScrollToContentPageAtIndex:[self.contentCollectionView indexPathForCell:self.contentCollectionView.visibleCells[0]]];
    }
}

- (UICollectionView *)contentCollectionView
{
    if (!_contentCollectionView) {
        
        _contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.collectionViewFlowLayout];
        _contentCollectionView.dataSource = self;
        _contentCollectionView.delegate = self;
        _contentCollectionView.backgroundColor = [UIColor clearColor];
        _contentCollectionView.pagingEnabled = YES;
        _contentCollectionView.bounces = NO;
        _contentCollectionView.showsHorizontalScrollIndicator = NO;
        [_contentCollectionView registerClass:[WFContentCollectionViewCell class] forCellWithReuseIdentifier:cellReuseIdentifier];
    }
    return _contentCollectionView;
}

- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    if (!_collectionViewFlowLayout) {
        _collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionViewFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 80);
        _collectionViewFlowLayout.minimumLineSpacing = 0;
    }
    return _collectionViewFlowLayout;
}

@end
