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

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

//  self.queue = [[NSOperationQueue alloc] init];
//
//  //给队列起一个名字；
//  self.queue.name = @"还可以给队列起一个名字";
//  //设置队列的最大并发数；
//  [self.queue setMaxConcurrentOperationCount:5];
//
//  MyTask *task = [[MyTask alloc] init];
//  MyTask *task02 = [[MyTask alloc] init];
//
//  task.operationID = 1;
//  [task setQueuePriority:NSOperationQueuePriorityVeryLow];
//
//  task02.operationID = 2;
//  //设置优先级；
//  [task02 setQueuePriority:NSOperationQueuePriorityVeryHigh];
//
//
//  //设置任务间的从属关系；task02会在task执行完之后才开始执行；当然也可以移除从属关系；
//  [task02 addDependency:task];
//
//  [self.queue addOperation:task];
//  [self.queue addOperation:task02];
//
//  //查看当前队列中的所有任务；
//  NSArray *operationArr = [self.queue operations];
//  NSLog(@"队列中的任务：%@",operationArr);
//
//
//  //任务1执行完的回调；
//  [task setCompletionBlock:^{
//    NSLog(@"task结束了");
//  }];
//
//  //任务2执行完的回调；
//  [task02 setCompletionBlock:^{
//    NSLog(@"task02结束了");
//  }];
//
//
//  //取消队列中的suoyou任务；
//  [self.queue cancelAllOperations];




  /**
   *  下面定义一个下载队列；
   */

  NSOperationQueue *downloadQueue = [[NSOperationQueue alloc] init];
  downloadQueue.name = @"下载图片队列";

  [downloadQueue addOperationWithBlock:^{

    NSURL *url = [[NSURL alloc] initWithString:@"http://gb.cri.cn/mmsource/images/2007/12/13/sw071213011.jpg"];
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];

    //在主界面更新UI；
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{

      self.imageView.image = [UIImage imageWithData:data];
    }];

  }];

  

}

@end












