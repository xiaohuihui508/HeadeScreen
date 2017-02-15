//
//  SMenuButton.m
//  头部筛选
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "SMenuButton.h"

@implementation SMenuButton

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageEdgeInsets = UIEdgeInsetsMake(0, CGRectGetMaxX(self.titleLabel.frame), 0, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
}

@end
