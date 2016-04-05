//
//  AppDelegate+Logging.m
//  Aspect
//
//  Created by zhangchao on 16/3/24.
//  Copyright © 2016年 slark. All rights reserved.
//

#import "AppDelegate+Logging.h"
#import "Logging.h"

@implementation AppDelegate (Logging)
- (void)setupLogging
{
    NSDictionary *config = @{
                             @"ViewController": @{
                                     kLoggingPageImpression: @"ViewController",
                                     kLoggingTrackedEvents: @[
                                             @{
                                                 kLoggingEventName: @"btnNextAction",
                                                 kLoggingEventSelectorName: @"btnNextAction",
                                                 kLoggingEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"btnNextAction");
                                                 },
                                                 },
                                             ],
                                     },
                             
                             @"SecondViewController": @{
                                     kLoggingPageImpression: @"SecondViewController",
                                     kLoggingTrackedEvents: @[
                                             @{
                                                 kLoggingEventName: @"btnBackAction",
                                                 kLoggingEventSelectorName: @"btnBackAction",
                                                 kLoggingEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"btnBackAction");
                                                 },
                                                 },
                                             
                                             ],
                                     }
                             };
    
    [Logging setupWithConfig:config];
}

@end
