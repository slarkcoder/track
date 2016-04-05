//
//  Logging.m
//  Aspect
//
//  Created by zhangchao on 16/3/24.
//  Copyright © 2016年 slark. All rights reserved.
//

#import "Logging.h"


@import UIKit;


@implementation Logging


typedef void (^AspectHandlerBlock)(id<AspectInfo> aspectInfo);


+ (void)setupWithConfig:(NSDictionary *)configs
{
    // Hook Page Imp
    [UIViewController aspect_hookSelector:@selector(viewDidAppear:)
                              withOptions:AspectPositionAfter
                               usingBlock:^(id<AspectInfo> aspectInfo) {
                                   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                       NSString *className = NSStringFromClass([[aspectInfo instance] class]);
                                       NSString *pageImp = configs[className][kLoggingPageImpression];
                                       if (pageImp) {
                                           NSLog(@"%@", pageImp);
                                       }
                                   });
                               } error:NULL];
    
    // Hook Events
    for (NSString *className in configs) {
        Class clazz = NSClassFromString(className);
        NSDictionary *config = configs[className];
        
        if (config[kLoggingTrackedEvents]) {
            for (NSDictionary *event in config[kLoggingTrackedEvents]) {
                SEL selekor = NSSelectorFromString(event[kLoggingEventSelectorName]);
                AspectHandlerBlock block = event[kLoggingEventHandlerBlock];
                
                [clazz aspect_hookSelector:selekor
                               withOptions:AspectPositionBefore
                                usingBlock:^(id<AspectInfo> aspectInfo) {
                                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                        block(aspectInfo);
                                    });
                                } error:NULL];
                
            }
        }
    }
}
@end
