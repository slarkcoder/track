//
//  Logging.h
//  Aspect
//
//  Created by zhangchao on 16/3/24.
//  Copyright © 2016年 slark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Aspects.h>


#define kLoggingPageImpression @"kLoggingPageImpression"
#define kLoggingTrackedEvents @"kLoggingTrackedEvents"
#define kLoggingEventName @"kLoggingEventName"
#define kLoggingEventSelectorName @"kLoggingEventSelectorName"
#define kLoggingEventHandlerBlock @"kLoggingEventHandlerBlock"

@interface Logging : NSObject

+ (void)setupWithConfig:(NSDictionary *)configs;
@end
