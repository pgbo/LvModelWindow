//
//  LvViewController.m
//  LvModelWindow
//
//  Created by pgbo on 07/13/2015.
//  Copyright (c) 2015 pgbo. All rights reserved.
//

#import "LvViewController.h"
#import <LvModelWindow/LvModelWindow.h>
#import "DefaultModelWindowAnimation.h"

@interface LvViewController () <LvModelWindowDelegate>

@property (nonatomic) LvModelWindow *modelWindow;

@end

@implementation LvViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTap:)]];
}

- (void)viewTap:(UITapGestureRecognizer *)tap
{
    [self.modelWindow showWithAnimated:YES];
}

- (LvModelWindow *)modelWindow
{
    if (!_modelWindow) {
        _modelWindow = [[LvModelWindow alloc]initWithPreferStatusBarHidden:NO preferStatusBarStyle:UIStatusBarStyleLightContent supportedOrientationPortrait:NO supportedOrientationPortraitUpsideDown:NO supportedOrientationLandscapeLeft:NO supportedOrientationLandscapeRight:NO];
        _modelWindow.modelWindowDelegate = self;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 64)];
        [_modelWindow.windowRootView addSubview:label];
        _modelWindow.windowRootView.backgroundColor = [UIColor blackColor];
        
        label.text = @"😄我显示出来了, 再点我就会消失";
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissModelWindow)]];
        
        _modelWindow.modelWindowAnimation = ({
            DefaultModelWindowAnimation *animation = [[DefaultModelWindowAnimation alloc]init];
            animation.touchBackgroudView = _modelWindow.windowRootView;
            animation.contentView = label;
            animation;
        });
    }
    return _modelWindow;
}

- (void)dismissModelWindow
{
    [_modelWindow dismissWithAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
