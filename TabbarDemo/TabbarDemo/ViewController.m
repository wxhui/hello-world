//
//  ViewController.m
//  TabbarDemo
//
//  Created by souche on 16/2/22.
//  Copyright © 2016年 wxhui. All rights reserved.
//

#import "ViewController.h"
#import "XHTabbarController.h"
#import "TestPushController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickToNext:(id)sender {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    TestPushController *vc = [[TestPushController alloc] init];
    [vc.view setBackgroundColor:[UIColor redColor]];
    vc.title = @"vc1";
    [array addObject:vc];
    UIViewController *vc2 = [[UIViewController alloc] init];
    [vc2.view setBackgroundColor:[UIColor lightGrayColor]];
    vc2.title = @"vc2";
    [array addObject:vc2];
    
    NSArray *arrayItem = @[@{
                           @"title":@"vc1",
                           @"image":@"tabbar_discover",
                           @"hightlightImage":@"tabbar_discover_selected",
                           },
                       @{
                           @"title":@"vc2",
                           @"image":@"tabbar_home",
                           @"hightlightImage":@"tabbar_home_selected",
                           },
                       
                       ];
    
    XHTabbarController *vc_tab = [[XHTabbarController alloc] init];
    vc_tab.controllerArray = array;
    vc_tab.tabbarItems = arrayItem;
    [self.navigationController pushViewController:vc_tab animated:YES];
}
@end
