//
//  XHTabbarController.m
//  TabbarDemo
//
//  Created by souche on 16/2/22.
//  Copyright © 2016年 wxhui. All rights reserved.
//

#import "XHTabbarController.h"
#import "XHTabBarView.h"
#import "TestPushController.h"
#import "Masonry.h"

@interface XHTabbarController()<XHTabBarViewDelegate>

@property (nonatomic, strong) UIViewController *selectedController;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation XHTabbarController


- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.myTabBar];
    [self initConstraint];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)setControllerArray:(NSMutableArray *)controllerArray {
    _controllerArray = controllerArray;
    for (UIViewController *vc in controllerArray) {
        [vc didMoveToParentViewController:nil];
        [vc willMoveToParentViewController:nil];
        [vc removeFromParentViewController];
    }
    _selectedController = [controllerArray objectAtIndex:0];
    [self addChildViewController:_selectedController];
    [self.contentView addSubview:_selectedController.view];
    [_selectedController.view setFrame:self.contentView.bounds];
    [_selectedController.view setBackgroundColor:[UIColor whiteColor]];
    self.title = _selectedController.title;
}

- (void)setTabbarItems:(NSArray *)tabbarItems {
    self.myTabBar.items = tabbarItems;
}

- (XHTabBarView *)myTabBar {
    if (!_myTabBar) {
        _myTabBar = [[XHTabBarView alloc] init];
        _myTabBar.delegate = self;
    }
    return _myTabBar;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

- (void)initConstraint {
    [self.myTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.height.mas_equalTo(49);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 49, 0));
    }];
}

- (void)buttonDidClick:(UIButton *)button {
    self.selectedIndex = button.tag;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    UIViewController *vc = [_controllerArray objectAtIndex:selectedIndex];
    if (!_selectedController) {
        _selectedController = [_controllerArray objectAtIndex:0];
    }
    if (_selectedController == vc) {
        return;
    }
    [self addChildViewController:vc];
    [self transitionFromViewController:_selectedController toViewController:vc duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        
        if (finished) {
            
            [vc didMoveToParentViewController:self];
            [_selectedController willMoveToParentViewController:nil];
            [_selectedController removeFromParentViewController];
            _selectedController = vc;
            
        }
    }];
}

@end
