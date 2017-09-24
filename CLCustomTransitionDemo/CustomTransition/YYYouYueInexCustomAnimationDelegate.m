//
//  YYYouYueInexCustomAnimationDelegate.m
//  优悦一族
//
//  Created by liang on 2017/8/30.
//  Copyright © 2017年 umed. All rights reserved.
//

#import "YYYouYueInexCustomAnimationDelegate.h"

@implementation YYYouYueInexCustomAnimationDelegate

#pragma mark

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    if (self.type == CustomAnimationTypePresent) {
        
        [self presentAnimation:transitionContext containerView:containerView from:fromView to:toView];;
    } else
        [self dismissAnimation:transitionContext containerView:containerView from:fromView to:toView];
}

- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext containerView:(UIView *)contaiview from:(UIView *)from to:(UIView *)to {
    
    [contaiview insertSubview:to belowSubview:from];
    to.frame = CGRectMake(-100, 0, contaiview.bounds.size.width, contaiview.bounds.size.height);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        from.frame = CGRectOffset(contaiview.bounds, contaiview.bounds.size.width, 0);
        to.frame = CGRectMake(0, 0, contaiview.bounds.size.width, contaiview.bounds.size.height);
    } completion:^(BOOL finished) {
       
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
   
}

- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext containerView:(UIView *)contaiview from:(UIView *)from to:(UIView *)to {
    [contaiview addSubview:to];
     to.frame = CGRectMake(0, contaiview.bounds.size.height, contaiview.bounds.size.width, contaiview.bounds.size.height);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        to.frame = CGRectMake(0, 0, contaiview.bounds.size.width, contaiview.bounds.size.height);
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if (![transitionContext transitionWasCancelled]) {
            
            [from removeFromSuperview];
        }
    }];
}
@end
