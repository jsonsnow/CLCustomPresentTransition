//
//  YYCustomAnimationFactory.h
//  CLCustomTransitionDemo
//
//  Created by chen liang on 2017/9/24.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYBasicCustomPresentAnimation.h"
@class YYCustomAnimationFactory;
@protocol YYCustomAnimationDataSource <NSObject>

- (NSDictionary <NSString *,NSString *> *)animationKindofFactory;
@end
//一个简单工厂方法
@interface YYCustomAnimationFactory : NSObject
@property (nonatomic, weak) id <YYCustomAnimationDataSource> delegate;//可在appdelegate初始化动画服务，或者需要用到的地方

+ (instancetype)shareInstance;

/**
 通过对应key和type来创建对应的动画类
 */
- (YYBasicCustomPresentAnimation *)factoryAnimationWithIdentifier:(NSString *)identifier type:(CustomAnimationType)type;
@end
