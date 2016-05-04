
//
//  FirstViewController.m
//  NSOperationQueueDemo
//
//  Created by chenyufeng on 16/5/3.
//  Copyright © 2016年 chenyufengweb. All rights reserved.
//

#import "FirstViewController.h"
#import "MyTask.h"

@interface FirstViewController ()

//声明一个NSOperationQueue队列；
@property(nonatomic,strong) NSOperationQueue *queue;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%s",__func__);
    [super viewWillAppear:animated];

    //初始化队列
    self.queue = [[NSOperationQueue alloc] init];

    //给队列起一个名字；
    self.queue.name = @"还可以给队列起一个名字";
    //设置队列的最大并发数，默认是-1，-1表示没有限制
    [self.queue setMaxConcurrentOperationCount:5];

    MyTask *task01 = [[MyTask alloc] init];
    MyTask *task02 = [[MyTask alloc] init];

    task01.operationID = 1;
    [task01 setQueuePriority:NSOperationQueuePriorityVeryLow];

    task02.operationID = 2;
    //设置优先级；
    [task02 setQueuePriority:NSOperationQueuePriorityVeryHigh];

    //设置任务间的从属关系；task02会在task01执行完之后才开始执行；当然也可以移除从属关系；
    //使用removeDependency解除依赖。
    //不能添加相互依赖，比如A依赖B，B依赖A，会造成死锁。
    [task02 addDependency:task01];

    [self.queue addOperation:task01];
    [self.queue addOperation:task02];

    //查看当前队列中的所有任务；
    NSArray *operationArr = [self.queue operations];
    NSLog(@"队列中的任务：%@",operationArr);


    //任务1执行完的回调；
    [task01 setCompletionBlock:^{
        NSLog(@"task01结束了");
    }];

    //任务2执行完的回调；
    [task02 setCompletionBlock:^{
        NSLog(@"task02结束了");
    }];

    //取消队列中的所有任务，这个命令比较危险，要慎用
    //[self.queue cancelAllOperations];
}

@end
