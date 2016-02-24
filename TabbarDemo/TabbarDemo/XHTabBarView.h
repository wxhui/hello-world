//
//  XHTabBarView.h
//  TabbarDemo
//
//  Created by souche on 16/2/22.
//  Copyright © 2016年 wxhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XHTabBarViewDelegate <NSObject>

- (void)buttonDidClick:(UIButton *)button;

@end

@interface XHTabBarView : UIView

@property (nonatomic, weak) id<XHTabBarViewDelegate> delegate;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSMutableArray *buttonArray;

@end
