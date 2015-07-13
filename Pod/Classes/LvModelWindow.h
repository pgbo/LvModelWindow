//
//  LvModelWindow.h
//  LvDemos
//
//  Created by 彭光波 on 15-2-3.
//
//

#import <UIKit/UIKit.h>

@class LvModelWindow;
@protocol LvModelWindowDelegate <NSObject>

@optional
- (void)modelWindowDidShow:(LvModelWindow *)modelWindow;

@optional
- (void)modelWindowDidDismiss:(LvModelWindow *)modelWindow;

@optional
- (void(^)())showAnimations:(LvModelWindow *)modelWindow;

@optional
- (void(^)())showCompletion:(LvModelWindow *)modelWindow;

@optional
- (void(^)())dismissAnimations:(LvModelWindow *)modelWindow;

@optional
- (void(^)())dismissCompletion:(LvModelWindow *)modelWindow;

@end

/**
 *  模态视窗
 */
@interface LvModelWindow : NSObject

/**
 *  需要自定义的视图可以添加到windowRootView中
 */
@property (nonatomic, readonly) UIView *windowRootView;

@property (nonatomic, readonly) BOOL preferStatusBarHidden;
@property (nonatomic, readonly) BOOL supportedOrientationPortrait;
@property (nonatomic, readonly) BOOL supportedOrientationPortraitUpsideDown;
@property (nonatomic, readonly) BOOL supportedOrientationLandscapeLeft;
@property (nonatomic, readonly) BOOL supportedOrientationLandscapeRight;

/**
 *  是否正在显示
 */
@property (nonatomic, readonly) BOOL showing;

@property (nonatomic, weak) id<LvModelWindowDelegate> modelWindowDelegate;

- (instancetype)initWithPreferStatusBarHidden:(BOOL)preferStatusBarHidden
                 supportedOrientationPortrait:(BOOL)supportedOrientationPortrait
       supportedOrientationPortraitUpsideDown:(BOOL)supportedOrientationPortraitUpsideDown
            supportedOrientationLandscapeLeft:(BOOL)supportedOrientationLandscapeLeft
           supportedOrientationLandscapeRight:(BOOL)supportedOrientationLandscapeRight;

/**
 *  显示
 */
- (void)showWithAnimated:(BOOL)animated;

/**
 *  消失
 */
- (void)dismissWithAnimated:(BOOL)animated;

@end
