//
//  XHTabbarController.h
//  TabbarDemo
//
//  Created by souche on 16/2/22.
//  Copyright © 2016年 wxhui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHTabBarView;
@interface XHTabbarController : UIViewController

- (void)setTabBarHidden:(BOOL)hidden;
@property (nonatomic, strong) XHTabBarView *myTabBar;
@property (nonatomic, strong) NSMutableArray *controllerArray;
@property (nonatomic, strong) NSArray *tabbarItems;

@end
