//
//  ViewController.m
//  CLCustomTransitionDemo
//
//  Created by chen liang on 2017/9/23.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import "ViewController.h"
#import "CLPresentedViewController.h"
#import "YYYouYueIndexPresentTransitionDelegate.h"

@interface ViewController ()
@property (nonatomic, strong) YYYouYueIndexPresentTransitionDelegate *presentTransition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)customPresentAction:(id)sender {
    
    CLPresentedViewController *presented = [[CLPresentedViewController alloc] init];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:presented];
    navc.transitioningDelegate = self.presentTransition;
    navc.modalTransitionStyle = UIModalPresentationCustom;
    [self presentViewController:navc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (YYYouYueIndexPresentTransitionDelegate *)presentTransition {
    
    if (!_presentTransition) {
        
        _presentTransition = [YYYouYueIndexPresentTransitionDelegate transitionWithIdentify:kYYCustomPopAnimationIdentify];
    }
    return _presentTransition;
}


@end
