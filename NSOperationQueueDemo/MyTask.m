

//
//  MyTask.m
//  NSOperationQueueDemo
//
//  Created by chenyufeng on 15/12/13.
//  Copyright © 2015年 chenyufengweb. All rights reserved.
//

#import "MyTask.h"

@implementation MyTask

- (void)main{

  @autoreleasepool {
    NSLog(@"task %i 开始 … ",self.operationID);
    
    [NSThread sleepForTimeInterval:3];

  }
  
}

@end
