//
//  SecondViewController.m
//  Aspect
//
//  Created by zhangchao on 16/3/15.
//  Copyright © 2016年 slark. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton* btnBack = [[UIButton alloc]
        initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, 100, 100,
                          100)];
    [btnBack setBackgroundColor:[UIColor greenColor]];
    [btnBack addTarget:self
                  action:@selector(btnBackAction)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
}

- (void)btnBackAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
