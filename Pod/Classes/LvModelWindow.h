//
//  LvModelWindow.h
//  LvDemos
//
//  Created by guangbool on 15-2-3.
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


/**
 背景视图。默认为`黑色 alpha:0.7` 的视图
 
 它和 `windowRootView` 四周对齐
 */
@property (nonatomic) UIView *backgroudView;

/**
 背景视图的点击隐藏 window 的手势。所有设置的背景视图都会添加该手势，可以通过设置 `enabled` 启用或关闭该手势。
 
 以动画方式隐藏 window
 */
@property (nonatomic, readonly) UITapGestureRecognizer *backgroudViewTapToDismissGesture;

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
