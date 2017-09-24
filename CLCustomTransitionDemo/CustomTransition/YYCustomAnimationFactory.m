//
//  YYCustomAnimationFactory.m
//  CLCustomTransitionDemo
//
//  Created by chen liang on 2017/9/24.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import "YYCustomAnimationFactory.h"

@interface YYCustomAnimationFactory ()
@property (nonatomic, strong) NSDictionary *anmiationMap;
@end

@implementation YYCustomAnimationFactory

+ (instancetype)shareInstance {
    
    static YYCustomAnimationFactory *_factory;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _factory = [[YYCustomAnimationFactory alloc] init];
    });
    return _factory;
}
- (YYBasicCustomPresentAnimation *)factoryAnimationWithIdentifier:(NSString *)identifier type:(CustomAnimationType)type {
    if (!self.delegate)
        NSAssert(0, @"you must tell me animation name");
    if (![self.delegate respondsToSelector:@selector(animationKindofFactory)]) {
        
        NSAssert(0, @"you must tell me animation name");
    } else {
        if (!_anmiationMap)
            _anmiationMap = [self.delegate animationKindofFactory];
    }
    NSString *animationClassName = _anmiationMap[identifier];
    Class animationClass = NSClassFromString(animationClassName);
    YYBasicCustomPresentAnimation *animation;
    if (type == CustomAnimationTypePresent)
        animation = [animationClass performSelector:@selector(customAnimationPresent)];
    else
        animation = [animationClass performSelector:@selector(customAnimationDismiss)];
    return animation;
}

- (YYBasicCustomPresentAnimation *)createAnimationClass:(Class)class type:(CustomAnimationType)type {
    
    NSMethodSignature *sigature = [class methodSignatureForSelector:@selector(youYueIndexAnimation:)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sigature];
    [invocation setArgument:&type atIndex:3];
    [invocation invoke];
    return nil;
}
@end
