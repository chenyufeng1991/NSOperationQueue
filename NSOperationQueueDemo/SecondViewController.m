//
//  SecondViewController.m
//  NSOperationQueueDemo
//
//  Created by chenyufeng on 16/5/3.
//  Copyright © 2016年 chenyufengweb. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%s",__func__);
    [super viewWillAppear:animated];

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
