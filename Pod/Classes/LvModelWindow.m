//
//  LvModelWindow.m
//  LvDemos
//
//  Created by 彭光波 on 15-2-3.
//
//

#import "LvModelWindow.h"

@interface LvModelWindowRootVC : UIViewController

@property (nonatomic, readonly) BOOL customPrefersStatusBarHidden;
@property (nonatomic, readonly) UIStatusBarStyle customPreferStatusBarStyle;
@property (nonatomic, readonly) BOOL supportedOrientationPortrait;
@property (nonatomic, readonly) BOOL supportedOrientationPortraitUpsideDown;
@property (nonatomic, readonly) BOOL supportedOrientationLandscapeLeft;
@property (nonatomic, readonly) BOOL supportedOrientationLandscapeRight;

- (instancetype)initWithPrefersStatusBarHidden:(BOOL)prefersStatusBarHidden
                          preferStatusBarStyle:(UIStatusBarStyle)preferStatusBarStyle
                  supportedOrientationPortrait:(BOOL)supportedOrientationPortrait
        supportedOrientationPortraitUpsideDown:(BOOL)supportedOrientationPortraitUpsideDown
             supportedOrientationLandscapeLeft:(BOOL)supportedOrientationLandscapeLeft
            supportedOrientationLandscapeRight:(BOOL)supportedOrientationLandscapeRight;

@end

@implementation LvModelWindowRootVC

- (instancetype)initWithPrefersStatusBarHidden:(BOOL)prefersStatusBarHidden
                          preferStatusBarStyle:(UIStatusBarStyle)preferStatusBarStyle
                  supportedOrientationPortrait:(BOOL)supportedOrientationPortrait
        supportedOrientationPortraitUpsideDown:(BOOL)supportedOrientationPortraitUpsideDown
             supportedOrientationLandscapeLeft:(BOOL)supportedOrientationLandscapeLeft
            supportedOrientationLandscapeRight:(BOOL)supportedOrientationLandscapeRight
{
    if (self = [super init]) {
        _customPrefersStatusBarHidden = prefersStatusBarHidden;
        _customPreferStatusBarStyle = preferStatusBarStyle;
        _supportedOrientationPortrait = supportedOrientationPortrait;
        _supportedOrientationPortraitUpsideDown = supportedOrientationPortraitUpsideDown;
        _supportedOrientationLandscapeLeft = supportedOrientationLandscapeLeft;
        _supportedOrientationLandscapeRight = supportedOrientationLandscapeRight;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
}

#ifdef __IPHONE_7_0
- (BOOL)prefersStatusBarHidden
{
    return _customPrefersStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _customPreferStatusBarStyle;
}
#endif

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    UIInterfaceOrientationMask mask = 0;
    if (_supportedOrientationPortrait) {
        mask = UIInterfaceOrientationMaskPortrait;
    }
    
    if (_supportedOrientationPortraitUpsideDown) {
        if (mask != 0) {
            mask = mask|UIInterfaceOrientationMaskPortraitUpsideDown;
        } else {
            mask = UIInterfaceOrientationMaskPortraitUpsideDown;
        }
    }
    
    if (_supportedOrientationLandscapeLeft) {
        if (mask != 0) {
            mask = mask|UIInterfaceOrientationMaskLandscapeLeft;
        } else {
            mask = UIInterfaceOrientationMaskLandscapeLeft;
        }
    }
    
    if (_supportedOrientationLandscapeRight) {
        if (mask != 0) {
            mask = mask|UIInterfaceOrientationMaskLandscapeRight;
        } else {
            mask = UIInterfaceOrientationMaskLandscapeRight;
        }
    }
    
    return mask;
}

@end


@interface LvModelWindow ()

@property (nonatomic) UIWindow *window;
@property (nonatomic) LvModelWindowRootVC *windowRootVC;

@end

@implementation LvModelWindow

- (instancetype)init
{
    return [self initWithPreferStatusBarHidden:NO
                          preferStatusBarStyle:UIStatusBarStyleDefault
                  supportedOrientationPortrait:YES
        supportedOrientationPortraitUpsideDown:YES
             supportedOrientationLandscapeLeft:YES
            supportedOrientationLandscapeRight:YES];
}

- (instancetype)initWithPreferStatusBarHidden:(BOOL)preferStatusBarHidden
                         preferStatusBarStyle:(UIStatusBarStyle)preferStatusBarStyle
                 supportedOrientationPortrait:(BOOL)supportedOrientationPortrait
       supportedOrientationPortraitUpsideDown:(BOOL)supportedOrientationPortraitUpsideDown
            supportedOrientationLandscapeLeft:(BOOL)supportedOrientationLandscapeLeft
           supportedOrientationLandscapeRight:(BOOL)supportedOrientationLandscapeRight
{
    if (self = [super init]) {
        _preferStatusBarHidden = preferStatusBarHidden;
        _preferStatusBarStyle = preferStatusBarStyle;
        _supportedOrientationPortrait = supportedOrientationPortrait;
        _supportedOrientationPortraitUpsideDown = supportedOrientationPortraitUpsideDown;
        _supportedOrientationLandscapeLeft = supportedOrientationLandscapeLeft;
        _supportedOrientationLandscapeRight = supportedOrientationLandscapeRight;
        [self setupModelWindow];
    }
    return self;
}

- (void)setupModelWindow
{
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    _windowRootVC = [[LvModelWindowRootVC alloc]initWithPrefersStatusBarHidden:_preferStatusBarHidden
                                                          preferStatusBarStyle:_preferStatusBarStyle
                                                  supportedOrientationPortrait:_supportedOrientationPortrait
                                        supportedOrientationPortraitUpsideDown:_supportedOrientationPortraitUpsideDown
                                             supportedOrientationLandscapeLeft:_supportedOrientationLandscapeLeft
                                            supportedOrientationLandscapeRight:_supportedOrientationLandscapeRight];
    _window.rootViewController = _windowRootVC;
}

- (UIView *)windowRootView
{
    return _windowRootVC.view;
}

- (UIViewController *)windowRootViewCcontroller
{
    return _windowRootVC;
}


/**
 *  显示
 */
- (void)showWithAnimated:(BOOL)animated
{
    if ([self showing])
        return;
    
    _window.hidden = NO;
    
    if (animated) {
        [UIView animateWithDuration:.3 animations:^{
            if ([self.modelWindowDelegate respondsToSelector:@selector(showAnimations:)]) {
                void(^animations)() = [self.modelWindowDelegate showAnimations:self];
                if (animations) {
                    animations();
                }
            }
        } completion:^(BOOL finished){
            if ([self.modelWindowDelegate respondsToSelector:@selector(showCompletion:)]) {
                void(^showCompletion)() = [self.modelWindowDelegate showCompletion:self];
                if (showCompletion) {
                    showCompletion();
                }
            }
            [self didShow];
        }];
    } else {
        [self didShow];
    }
}

- (void)didShow
{
    if (self.modelWindowDelegate
        && [self.modelWindowDelegate respondsToSelector:@selector(modelWindowDidShow:)]) {
        [self.modelWindowDelegate modelWindowDidShow:self];
    }
}

/**
 *  消失
 */
- (void)dismissWithAnimated:(BOOL)animated
{
    if (![self showing]) {
        return;
    }
    
    if(animated){
        [UIView animateWithDuration:.3 animations:^{
            if ([self.modelWindowDelegate respondsToSelector:@selector(dismissAnimations:)]) {
                void(^animations)() = [self.modelWindowDelegate dismissAnimations:self];
                if (animations) {
                    animations();
                }
            }
        } completion:^(BOOL finished){
            if ([self.modelWindowDelegate respondsToSelector:@selector(showCompletion:)]) {
                void(^dismissCompletion)() = [self.modelWindowDelegate dismissCompletion:self];
                if (dismissCompletion) {
                    dismissCompletion();
                }
            }
            _window.hidden = YES;
            [self didDismiss];
        }];
    }
    else{
        _window.hidden = YES;
        [self didDismiss];
    }
}

- (void)didDismiss
{
    if (self.modelWindowDelegate
        && [self.modelWindowDelegate respondsToSelector:@selector(modelWindowDidDismiss:)]) {
        [self.modelWindowDelegate modelWindowDidDismiss:self];
    }
}

- (BOOL)showing
{
    return !_window.hidden;
}

#define DegreesToRadians(degrees) (degrees * M_PI / 180)

- (void)setTransformForOrientation:(UIInterfaceOrientation)orientation
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_window setTransform:[self transformForOrientation:orientation]];
    });
}

- (CGAffineTransform)transformForOrientation:(UIInterfaceOrientation)orientation {
    
    switch (orientation) {
            
        case UIInterfaceOrientationLandscapeLeft:
            return CGAffineTransformMakeRotation(-DegreesToRadians(90));
            
        case UIInterfaceOrientationLandscapeRight:
            return CGAffineTransformMakeRotation(DegreesToRadians(90));
            
        case UIInterfaceOrientationPortraitUpsideDown:
            return CGAffineTransformMakeRotation(DegreesToRadians(180));
            
        case UIInterfaceOrientationPortrait:
        default:
            return CGAffineTransformMakeRotation(DegreesToRadians(0));
    }
}

- (void)recvDidChangeStatusBarFrameNote:(NSNotification *)notification {
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    [self setTransformForOrientation:orientation];
}

@end
