
//
//  FourthViewController.m
//  NSOperationQueueDemo
//
//  Created by chenyufeng on 16/5/4.
//  Copyright © 2016年 chenyufengweb. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

/**
 *  这里要实现NSBlockOperation,NSBlockOperation也是NSOperation的子类。
 *
 可以添加多个block进行操作。官方文档中说明，对于多个block，我么不需要去创建不同的operation对象，而可以直接使用NSBlockOperation
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"blockOperationWithBlock");
    }];

    //添加多个block执行
    [operation addExecutionBlock:^{
        NSLog(@"1");
    }];
    [operation addExecutionBlock:^{
        NSLog(@"2");
    }];

    [operation start];

    //NSOperationQueue中获取主线程
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSLog(@"这里是主线程");
    }];
}

@end
