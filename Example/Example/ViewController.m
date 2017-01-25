//
//  ViewController.m
//  Example
//
//  Created by Dmitry on 1/25/17.
//  Copyright © 2017 Grapefruit. All rights reserved.
//

#import "ViewController.h"
#import "DKActivityIndicatorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DKActivityIndicatorView *i = [[DKActivityIndicatorView alloc] initInsideView:self.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [i startAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [i stopAnimating];
        });
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
