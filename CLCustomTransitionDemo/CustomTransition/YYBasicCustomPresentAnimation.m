//
//  YYBasicCustomPresentAnimation.m
//  CLCustomTransitionDemo
//
//  Created by chen liang on 2017/9/24.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import "YYBasicCustomPresentAnimation.h"
#define TransitionAnimationDuration 0.2

@interface YYBasicCustomPresentAnimation()
@property (nonatomic, assign, readwrite) CustomAnimationType type;
@end
@implementation YYBasicCustomPresentAnimation

+ (instancetype)youYueIndexAnimation:(CustomAnimationType)type {
    
    return [[self alloc] initWithAnimationType:type];
}
+ (instancetype)customAnimationPresent {
    
    return [[self alloc] initWithAnimationType:CustomAnimationTypePresent];
}

+ (instancetype)customAnimationDismiss {
    
    return [[self alloc] initWithAnimationType:CustomAnimationTypeDismiss];
}
- (instancetype)initWithAnimationType:(CustomAnimationType)type {
    
    self = [super init];
    _type = type;
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return TransitionAnimationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    NSAssert(0, @"subclass should rewrite this method");
}
@end
