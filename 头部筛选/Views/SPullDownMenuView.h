//
//  SPullDownMenuView.h
//  头部筛选
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPullDownMenuView;

@protocol SPullDownMenuViewDelegate <NSObject>

- (void)pullDownMenuView:(SPullDownMenuView *)menu didSelectedIndex:(NSIndexPath *)indexPath;

@end

@interface SPullDownMenuView : UIView

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSArray *)titleArray withSelectColor:(UIColor *)color;

@property (nonatomic, weak) id<SPullDownMenuViewDelegate> delegate;

@end
