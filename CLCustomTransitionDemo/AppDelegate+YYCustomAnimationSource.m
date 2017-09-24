//
//  AppDelegate+YYCustomAnimationSource.m
//  CLCustomTransitionDemo
//
//  Created by chen liang on 2017/9/24.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import "AppDelegate+YYCustomAnimationSource.h"
#import "YYCustomAnimationKey.h"

@implementation AppDelegate (YYCustomAnimationSource)

- (void)enableCustomAnimation {
    
    [YYCustomAnimationFactory shareInstance].delegate = self;
}
- (NSDictionary<NSString *,NSString *> *)animationKindofFactory {
    
    return @{kYYCustomPopAnimationIdentify:@"YYYouYueInexCustomAnimationDelegate"};
}
@end
