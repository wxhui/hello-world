//
//  TestPushController.m
//  TabbarDemo
//
//  Created by souche on 16/2/23.
//  Copyright © 2016年 wxhui. All rights reserved.
//

#import "TestPushController.h"
#import "XHTabbarController.h"

@interface TestPushController()

@property (nonatomic, strong) UIButton *button;

@end

@implementation TestPushController

- (instancetype)init {
    self= [super init];
    return self;
}

- (void)viewDidLoad {
    [self.view addSubview:self.button];
    [self.button setFrame:CGRectMake(200, 300, 100, 100)];
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setBackgroundColor:[UIColor lightGrayColor]];
        [_button setTitle:@"xxx" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickToNext) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)clickToNext {
    TestPushController *vc = [[TestPushController alloc] init];
    [vc.view setBackgroundColor:[UIColor yellowColor]];
    [(XHTabbarController *)self.tabBarController setTabBarHidden:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
