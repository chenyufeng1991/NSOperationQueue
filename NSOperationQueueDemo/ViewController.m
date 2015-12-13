//
//  ViewController.m
//  NSOperationQueueDemo
//
//  Created by chenyufeng on 15/12/13.
//  Copyright © 2015年 chenyufengweb. All rights reserved.
//

#import "ViewController.h"
#import "MyTask.h"

@interface ViewController ()

//声明一个NSOperationQueue队列；
@property(nonatomic,strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.queue = [[NSOperationQueue alloc] init];

  MyTask *task = [[MyTask alloc] init];
  //设置任务ID为1，区别其他的操作；
  task.operationID = 1;
  //加入到队列中；
  [self.queue addOperation:task];

  //创建一个NSOperation对象（任务），放到NSOperationQueue中，也就是放到一个队列中；
  MyTask *task02 = [[MyTask alloc] init];
  task02.operationID = 2;
  [self.queue addOperation:task02];

}

@end
