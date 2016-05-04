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
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    FirstViewController *firstVC = [[FirstViewController alloc] init];
    firstVC.title = @"基本操作";
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.title = @"图片下载";
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    thirdVC.title = @"NSInvocationOperation";
    FourthViewController *fourVC = [[FourthViewController alloc] init];
    fourVC.title = @"NSBlockOperation";

    UINavigationController *firstNavi = [[UINavigationController alloc] initWithRootViewController:firstVC];
    UINavigationController *secondNavi = [[UINavigationController alloc] initWithRootViewController:secondVC];
    UINavigationController *thirdNavi = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    UINavigationController *fourNavi = [[UINavigationController alloc] initWithRootViewController:fourVC];

    self.tabController = [[UITabBarController alloc] init];
    self.tabController.viewControllers = @[firstNavi,secondNavi,thirdNavi,fourNavi];

    [self.window setRootViewController:self.tabController];
    [self.window makeKeyAndVisible];

    return YES;
}


@end
