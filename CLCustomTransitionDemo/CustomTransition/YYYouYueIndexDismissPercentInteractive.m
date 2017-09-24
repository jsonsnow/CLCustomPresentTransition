//
//  YYYouYueIndexDismissPercentInteractive.m
//  优悦一族
//
//  Created by liang on 2017/8/30.
//  Copyright © 2017年 umed. All rights reserved.
//

#import "YYYouYueIndexDismissPercentInteractive.h"

@interface YYYouYueIndexDismissPercentInteractive ()
@property (nonatomic, readwrite, assign) BOOL fire;
@property (nonatomic, readwrite, assign) YYPercentInteractiveLocation location;
@property (nonatomic, readwrite, assign) YYPercentInteractiveType type;
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *panGesture;

@end

@implementation YYYouYueIndexDismissPercentInteractive

- (void)setDelegate:(id<YYPercentInteractiveDelegate>)delegate {
    _delegate = delegate;
}
- (void)configTransitionType {
    
    if ([self.delegate respondsToSelector:@selector(transitionType)]) {
        
        self.type = [self.delegate transitionType];
    } else
        self.type = YYPercentInteractiveTypeDisMiss;
}

- (void)configGestureLocation {
    
    if ([self.delegate respondsToSelector:@selector(percentInteractiveLocation)]) {
        
        self.location = [self.delegate percentInteractiveLocation];
    } else
        self.location = YYPercentInteractiveLocationLeft;
}
- (void)addGestrueToControler {
    
    if ([self.delegate respondsToSelector:@selector(intercativeController)]) {
        
        self.transitionController = [self.delegate intercativeController];
        [self.transitionController.view addGestureRecognizer:self.panGesture];
        
    } else
        NSAssert(0, @"must realize this method");
}

- (void)bindInteractiveToTransitionDelegate {
    
    UIViewController *ctr;
    if ([self.delegate respondsToSelector:@selector(customTransitionController)]) {
         ctr = [self.delegate customTransitionController];
    } else {
         ctr = [self.delegate intercativeController];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([ctr.transitioningDelegate respondsToSelector:@selector(setPercentInteractive:)]) {
        
        [ctr.transitioningDelegate performSelector:@selector(setPercentInteractive:) withObject:self];
    }
#pragma clang diagnostic pop
}

//can't add observer for viewLoaded property it no fuction
- (void)addTransitionControllerLoadObserver {
    [self.transitionController addObserver:self forKeyPath:@"viewLoaded" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeViewloadedObserve {
    
    [self.transitionController removeObserver:self forKeyPath:@"viewLoaded"];
}

#pragma mark - public method
- (void)fireInteractive {
    [self configGestureLocation];
    [self configTransitionType];
    [self bindInteractiveToTransitionDelegate];
    [self addGestrueToControler];
}
#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (object == self.transitionController) {
        
        if (self.transitionController.isViewLoaded) {
            
       }
    }
}

#pragma mark - target action
//目前只处理左滑情况
- (void)handleGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
    
    CGPoint translation = [gesture translationInView:self.transitionController.view];
    CGFloat length;
    CGFloat progress;
    if (self.location == YYPercentInteractiveLocationLeft || self.location == YYPercentInteractiveLocationRight) {
         length = translation.x>0?translation.x:-translation.x;
         progress = length/self.transitionController.view.bounds.size.width;
    } else {
        length = translation.y > 0?translation.y:-translation.y;
        progress = length/self.transitionController.view.bounds.size.height;
    }
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            if (self.type == YYPercentInteractiveTypeDisMiss) {
                
                self.fire = YES;
                [self.transitionController dismissViewControllerAnimated:YES completion:nil];
                if ([self.delegate respondsToSelector:@selector(startTransition:)]) {
                 
                    [self.delegate startTransition:self];
                }
                
            }
        }
            break;
        case UIGestureRecognizerStateChanged:{
            
            [self updateInteractiveTransition:progress];
        }break;
        
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            self.fire = NO;
            if (progress < 0.4) {
               
                if ([self.delegate respondsToSelector:@selector(cancelTransition:)]) {
                    
                    [self.delegate cancelTransition:self];
                }
                self.completionSpeed = 0.99;
                [self cancelInteractiveTransition];
            } else {
                
                if ([self.delegate respondsToSelector:@selector(completeTransition:)]) {
                    
                    [self.delegate complteTransition:self];
                }
                self.completionSpeed = 0.99;
                [self finishInteractiveTransition];
            }

        }break;
            
        default:
            break;
    }
}

- (UIScreenEdgePanGestureRecognizer *)panGesture {
    
    if (!_panGesture) {
        _panGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        switch (self.location) {
            case YYPercentInteractiveLocationTop:
                _panGesture.edges = UIRectEdgeTop;
                break;
            case YYPercentInteractiveLocationBottom:
                _panGesture.edges = UIRectEdgeBottom;
                break;
            case YYPercentInteractiveLocationLeft:
                _panGesture.edges = UIRectEdgeLeft;
                break;
            case YYPercentInteractiveLocationRight:
                _panGesture.edges = UIFocusHeadingRight;
                break;
            default:
                break;
        }
    }
    return _panGesture;
}
@end
