//
//  ViewController.m
//  Aspect
//
//  Created by zhangchao on 16/3/15.
//  Copyright © 2016年 slark. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import <Aspects.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btnBack = [[UIButton alloc]
                         initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, 100, 100,
                                                  100)];
    [btnBack setBackgroundColor:[UIColor redColor]];
    [btnBack addTarget:self
                action:@selector(btnNextAction)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
}

- (void)btnNextAction {
    SecondViewController *sec = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:sec animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
