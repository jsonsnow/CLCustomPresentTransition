//
//  YYYouYueIndexPresentTransitionDelegate.m
//  优悦一族
//
//  Created by liang on 2017/8/30.
//  Copyright © 2017年 umed. All rights reserved.
//

#import "YYYouYueIndexPresentTransitionDelegate.h"
#import "YYYouYueInexCustomAnimationDelegate.h"
#import "YYCustomAnimationFactory.h"

@implementation YYYouYueIndexPresentTransitionDelegate
- (instancetype)init {
    
    return [self initWithIdentify:kYYCustomPopAnimationIdentify];
}
- (instancetype)initWithIdentify:(NSString *)identify {
    
    self = [super init];
    _animationIdentifer = identify;
    return self;
}
+ (instancetype)transitionWithIdentify:(NSString *)indentifer {
    return [[self alloc] initWithIdentify:indentifer];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
   return [[YYCustomAnimationFactory shareInstance] factoryAnimationWithIdentifier:_animationIdentifer type:CustomAnimationTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[YYCustomAnimationFactory shareInstance] factoryAnimationWithIdentifier:_animationIdentifer type:CustomAnimationTypeDismiss];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    
    return self.percentInteractive.fire?self.percentInteractive:nil;
}
#pragma mark - getter and setter
- (void)setPercentInteractive:(YYYouYueIndexDismissPercentInteractive *)percentInteractive {
    
    _percentInteractive = percentInteractive;
}
@end
