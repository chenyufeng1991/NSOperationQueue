//
//  AppDelegate.m
//  NSOperationQueueDemo
//
//  Created by chenyufeng on 15/12/13.
//  Copyright © 2015年 chenyufengweb. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    FirstViewController *firstVC = [[FirstViewController alloc] init];
    firstVC.title = @"第一页";
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.title = @"第二页";

    UINavigationController *firstNavi = [[UINavigationController alloc] initWithRootViewController:firstVC];
    UINavigationController *secondNavi = [[UINavigationController alloc] initWithRootViewController:secondVC];

    self.tabController = [[UITabBarController alloc] init];
    self.tabController.viewControllers = @[firstNavi,secondNavi];

    [self.window setRootViewController:self.tabController];
    [self.window makeKeyAndVisible];

    return YES;
}


@end
