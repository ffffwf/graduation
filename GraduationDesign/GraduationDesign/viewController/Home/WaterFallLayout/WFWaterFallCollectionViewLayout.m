//
//  WFWaterFallCollectionViewLayout.m
//  GraduationDesign
//
//  Created by wufeng on 2020/2/13.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFWaterFallCollectionViewLayout.h"
#import "WFExternVar.h"

@interface WFWaterFallCollectionViewLayout ()

@property (nonatomic, strong) NSMutableArray * attributeArray;
@property (nonatomic, strong) NSMutableArray *columnHeights;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat numberOfColumn;
@property (nonatomic, assign) CGFloat columnMargin;
@property (nonatomic, assign) CGFloat rowMargin;

@end

@implementation WFWaterFallCollectionViewLayout

- (void)prepareLayout
{
    [super prepareLayout];
    self.contentHeight = 0;
    [self.attributeArray removeAllObjects];
    [self.columnHeights removeAllObjects];
    for (NSInteger i = 0; i < self.numberOfColumn; i++) {
        [self.columnHeights addObject:@(0)];
    }
    for (NSInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributeArray addObject:attribute];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    NSInteger targetColumn = 0;
    for (NSInteger i = 1; i < [self numberOfColumn]; i++) {
        if ([self.columnHeights[i] doubleValue] < minColumnHeight) {
            minColumnHeight = [self.columnHeights[i] doubleValue];
            targetColumn = i;
        }
    }
    CGFloat cellW = (SCREEN_WIDTH - self.edgeInsets.left - self.edgeInsets.right - (self.numberOfColumn - 1) * self.columnMargin) / self.numberOfColumn;
    CGFloat cellH = [self.delegate waterFallLayout:self heightForItemAtIndexPath:indexPath];
    CGFloat cellX = self.edgeInsets.left + targetColumn * (cellW + self.columnMargin);
    CGFloat cellY = minColumnHeight;
    if (cellY != self.edgeInsets.top) {
        cellY += self.rowMargin;
    }
    attribute.frame = CGRectMake(cellX, cellY, cellW, cellH);
    self.columnHeights[targetColumn] = @(CGRectGetMaxY(attribute.frame));
    CGFloat maxColumnHeight = [self.columnHeights[targetColumn] doubleValue];
    if (self.contentHeight < maxColumnHeight) {
        self.contentHeight = maxColumnHeight;
    }
    return attribute;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributeArray;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(SCREEN_WIDTH, self.contentHeight + self.edgeInsets.bottom);
}

- (CGFloat)numberOfColumn
{
    if ([self.delegate respondsToSelector:@selector(columnCountInWaterFallLayout:)]) {
        return [self.delegate columnCountInWaterFallLayout:self];
    }
    return 2;
}

- (CGFloat)columnMargin
{
    if ([self.delegate respondsToSelector:@selector(columnMarginInWaterFallLayout:)]) {
        return [self.delegate columnMarginInWaterFallLayout:self];
    }
    return 2;
}

- (CGFloat)rowMargin
{
    if ([self.delegate respondsToSelector:@selector(rowMarginInWaterFallLayout:)]) {
        return [self.delegate rowMarginInWaterFallLayout:self];
    }
    return 2;
}

- (UIEdgeInsets)edgeInsets
{
    if ([self.delegate respondsToSelector:@selector(edgeInsetdInWaterFallLayout:)]) {
        return [self.delegate edgeInsetdInWaterFallLayout:self];
    }
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

- (NSMutableArray *)attributeArray
{
    if (!_attributeArray) {
        _attributeArray = [NSMutableArray new];
    }
    return _attributeArray;
}

- (NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray new];
    }
    return _columnHeights;
}

@end
