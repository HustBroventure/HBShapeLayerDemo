//
//  ViewController.m
//  HBShapeLayerDemo
//
//  Created by wangfeng on 16/5/9.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "ViewController.h"
#import "HBCountTimeView.h"
#import "HBProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) HBCountTimeView* countView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    HBCountTimeView* countView = [[HBCountTimeView alloc]initWithFrame:CGRectMake(300, 50, 50, 50)];
    _countView = countView;
    [self.view addSubview:countView];
    
    HBProgressView* progressView = [HBProgressView new];
    progressView.center = self.view.center;
    [self.view addSubview:progressView];
}


- (IBAction)click:(id)sender {
    [_countView startAnimation];
}

@end
