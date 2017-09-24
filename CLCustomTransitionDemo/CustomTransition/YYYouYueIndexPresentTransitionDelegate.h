//
//  YYYouYueIndexPresentTransitionDelegate.h
//  优悦一族
//
//  Created by liang on 2017/8/30.
//  Copyright © 2017年 umed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YYYouYueIndexDismissPercentInteractive.h"
#import "YYCustomAnimationKey.h"

@interface YYYouYueIndexPresentTransitionDelegate : NSObject<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) YYYouYueIndexDismissPercentInteractive *percentInteractive;
@property (nonatomic, copy) NSString *animationIdentifer;//转场动画的key
+ (instancetype)transitionWithIdentify:(NSString *)indentifer;

@end
