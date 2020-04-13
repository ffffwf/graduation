//
//  WFShopCommonTableViewCell.m
//  GraduationDesign
//
//  Created by 吴峰 on 2020/3/29.
//  Copyright © 2020 wufeng. All rights reserved.
//

#import "WFShopCommonTableViewCell.h"
#import "Masonry.h"

@implementation WFShopCommonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setController:(UIViewController *)controller
{
    _controller = controller;
    [self.contentView addSubview:_controller.view];
    [_controller.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

@end
