//
//  CLPresentedViewController.h
//  CLCustomTransitionDemo
//
//  Created by chen liang on 2017/9/23.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYYouYueIndexDismissPercentInteractive.h"

@interface CLPresentedViewController : UIViewController<YYPercentInteractiveDelegate>
@property (nonatomic, unsafe_unretained) YYYouYueIndexDismissPercentInteractive *interactive;

@end
