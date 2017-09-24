//
//  CLPresentedViewController.m
//  CLCustomTransitionDemo
//
//  Created by chen liang on 2017/9/23.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import "CLPresentedViewController.h"

@interface CLPresentedViewController ()

@end

@implementation CLPresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    YYYouYueIndexDismissPercentInteractive *interactive = [[YYYouYueIndexDismissPercentInteractive alloc] init];
    interactive.delegate = self;
    [interactive fireInteractive];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
- (YYPercentInteractiveLocation)percentInteractiveLocation {
    
    return YYPercentInteractiveLocationLeft;
}

- (UIViewController *)intercativeController {
    
    return self;
}

- (UIViewController *)customTransitionController {
    
    return self.navigationController;
}
- (YYPercentInteractiveType)transitionType {
    
   return YYPercentInteractiveTypeDisMiss;
}

#pragma mark
- (void)backAction:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
