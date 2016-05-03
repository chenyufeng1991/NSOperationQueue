

//
//  MyTask.m
//  NSOperationQueueDemo
//
//  Created by chenyufeng on 15/12/13.
//  Copyright © 2015年 chenyufengweb. All rights reserved.
//

#import "MyTask.h"

@implementation MyTask

//任务会自动回调main方法
- (void)main
{
  @autoreleasepool{
    NSLog(@"task %i 开始 … ",self.operationID);
    [NSThread sleepForTimeInterval:3];
  }
}

@end
