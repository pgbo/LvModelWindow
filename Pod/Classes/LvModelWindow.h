//
//  LvModelWindow.h
//  LvDemos
//
//  Created by 彭光波 on 15-2-3.
//
//

#import <UIKit/UIKit.h>

#import "LvModelWindowAnimating.h"

@class LvModelWindow;
@protocol LvModelWindowDelegate <NSObject>

@optional
- (void)modelWindowDidShow:(LvModelWindow *)modelWindow;

@optional
- (void)modelWindowDidDismiss:(LvModelWindow *)modelWindow;

@end

/**
 *  模态视窗
 */
@interface LvModelWindow : NSObject

/**
 *  需要自定义的视图可以添加到windowRootView中
 */
@property (nonatomic, readonly) UIView *windowRootView;
@property (nonatomic, readonly) UIViewController *windowRootViewController;

@property (nonatomic, readonly) BOOL preferStatusBarHidden;
@property (nonatomic, readonly) UIStatusBarStyle preferStatusBarStyle;
@property (nonatomic, readonly) BOOL supportedOrientationPortrait;
@property (nonatomic, readonly) BOOL supportedOrientationPortraitUpsideDown;
@property (nonatomic, readonly) BOOL supportedOrientationLandscapeLeft;
@property (nonatomic, readonly) BOOL supportedOrientationLandscapeRight;
/**
 *  窗体相对于 UIScreen 的边距
 */
@property (nonatomic, readonly) UIEdgeInsets windowEdgeInsets;

/**
 *  是否正在显示
 */
@property (nonatomic, readonly) BOOL showing;

@property (nonatomic, weak) id<LvModelWindowDelegate> modelWindowDelegate;

/**
 *  指定动画
 */
@property (nonatomic, strong) id<LvModelWindowAnimating> modelWindowAnimation;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithPreferStatusBarHidden:(BOOL)preferStatusBarHidden
                         preferStatusBarStyle:(UIStatusBarStyle)preferStatusBarStyle
                 supportedOrientationPortrait:(BOOL)supportedOrientationPortrait
       supportedOrientationPortraitUpsideDown:(BOOL)supportedOrientationPortraitUpsideDown
            supportedOrientationLandscapeLeft:(BOOL)supportedOrientationLandscapeLeft
           supportedOrientationLandscapeRight:(BOOL)supportedOrientationLandscapeRight;

- (instancetype)initWithPreferStatusBarHidden:(BOOL)preferStatusBarHidden
                         preferStatusBarStyle:(UIStatusBarStyle)preferStatusBarStyle
                 supportedOrientationPortrait:(BOOL)supportedOrientationPortrait
       supportedOrientationPortraitUpsideDown:(BOOL)supportedOrientationPortraitUpsideDown
            supportedOrientationLandscapeLeft:(BOOL)supportedOrientationLandscapeLeft
           supportedOrientationLandscapeRight:(BOOL)supportedOrientationLandscapeRight
                             windowEdgeInsets:(UIEdgeInsets)windowEdgeInsets;

/**
 *  显示
 *  @param animated 是否动画，如果`animated`为`YES`, 且存在`modelWindowAnimation`，那么会使用动画
 */
- (void)showWithAnimated:(BOOL)animated;

/**
 *  消失
 *  @param animated 是否动画，如果`animated`为`YES`, 且存在`modelWindowAnimation`，那么会使用动画
 */
- (void)dismissWithAnimated:(BOOL)animated;

@end
