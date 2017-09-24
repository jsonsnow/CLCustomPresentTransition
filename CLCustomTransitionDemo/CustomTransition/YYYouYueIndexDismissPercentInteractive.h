//
//  YYYouYueIndexDismissPercentInteractive.h
//  优悦一族
//
//  Created by liang on 2017/8/30.
//  Copyright © 2017年 umed. All rights reserved.
//

/**
 
 该类一般由需要百分比驱动的控制器来创建,驱动手势类的设计应该也如动画类一样进行设计，占时不提取，下个版本进行
 */
#import <UIKit/UIKit.h>

@class YYYouYueIndexDismissPercentInteractive;
typedef NS_ENUM(NSUInteger,YYPercentInteractiveType) {
    
    YYPercentInteractiveTypePresent,
    YYPercentInteractiveTypeDisMiss,
    YYPercentInteractiveTypePush,
    YYPercentInteractiveTypePop
};

typedef NS_ENUM(NSUInteger,YYPercentInteractiveLocation) {
    
    YYPercentInteractiveLocationTop,
    YYPercentInteractiveLocationLeft,
    YYPercentInteractiveLocationBottom,
    YYPercentInteractiveLocationRight
};
@protocol YYPercentInteractiveDelegate <NSObject>

- (UIViewController *)intercativeController;//需要驱动的控制器
- (UIViewController *)customTransitionController;//自定义转场动画的类，其与需要驱动的控制器可能存在出入，比如一个navc下的，需要驱动的为navc的第一个控制器，而自定义转场动画的控制器为navc
- (YYPercentInteractiveType)transitionType;//转场类型
- (YYPercentInteractiveLocation)percentInteractiveLocation;//触发位置

@optional;
- (void)startTransition:(YYYouYueIndexDismissPercentInteractive *) percentInteractive;
- (void)complteTransition:(YYYouYueIndexDismissPercentInteractive *)complete;
- (void)cancelTransition:(YYYouYueIndexDismissPercentInteractive *)cancel;

@end


@interface YYYouYueIndexDismissPercentInteractive : UIPercentDrivenInteractiveTransition
@property (nonatomic, readonly, assign) BOOL fire;//是否触动转场
@property (nonatomic, unsafe_unretained) UIViewController *transitionController;
@property (nonatomic, readonly, assign) YYPercentInteractiveLocation location;
@property (nonatomic, readonly, assign) YYPercentInteractiveType type;
@property (nonatomic, weak) id <YYPercentInteractiveDelegate> delegate;

- (void)fireInteractive;//需要添加百分比驱动的控制器调用；
- (void)handleGesture:(UIScreenEdgePanGestureRecognizer *)gesture;//因为该类处理方法不够全面，且也不该如此设计，继承该类重载该方法来自定义

@end
