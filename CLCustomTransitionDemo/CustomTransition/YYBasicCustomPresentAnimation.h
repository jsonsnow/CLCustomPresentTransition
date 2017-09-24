//
//  YYBasicCustomPresentAnimation.h
//  CLCustomTransitionDemo
//
//  Created by chen liang on 2017/9/24.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CustomAnimationType) {
    CustomAnimationTypePresent = 0,
    CustomAnimationTypeDismiss = 1
};
@interface YYBasicCustomPresentAnimation : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, readonly,assign) CustomAnimationType type;
+ (instancetype)youYueIndexAnimation:(CustomAnimationType)type;
//工厂方法创建用到
+ (instancetype)customAnimationPresent;
+ (instancetype)customAnimationDismiss;

@end
