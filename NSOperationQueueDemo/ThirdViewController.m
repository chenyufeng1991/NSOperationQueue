


//
//  ThirdViewController.m
//  NSOperationQueueDemo
//
//  Created by chenyufeng on 16/5/4.
//  Copyright © 2016年 chenyufengweb. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

//在这里要实现NSInvocationOperation-------调度操作
/**
 *  NSInvocationOperation是NSOperation的子类。
 使用比较方便，是用一个对象和selector进行操作。
 *
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
    [operation setCompletionBlock:^{
        NSLog(@"setCompletionBlock");
    }];
    [operation start];
}

- (void)run
{
    NSLog(@"run");
}

@end
