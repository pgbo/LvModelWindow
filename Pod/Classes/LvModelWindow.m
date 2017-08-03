//
//  LvModelWindow.m
//  LvDemos
//
//  Created by guangbool on 15-2-3.
//
//

#import "LvModelWindow.h"

@interface LvModelWindowAnimationContext : NSObject <LvModelWindowContextAnimationing>

/**
 *  The view in which the animation should take place.
 */
@property (nonatomic) UIView *windowContainerView;

@property (nonatomic, assign) BOOL fromVisible;

@property (nonatomic, assign) BOOL toVisible;

@property (nonatomic, copy) void(^completeAnimationBlock)(BOOL didComplete);

@end

@implementation LvModelWindowAnimationContext

@end

@interface LvModelWindowRootVC : UIViewController

@property (nonatomic, readonly) BOOL customPrefersStatusBarHidden;
@property (nonatomic, readonly) UIStatusBarStyle customPreferStatusBarStyle;
@property (nonatomic, readonly) BOOL supportedOrientationPortrait;
@property (nonatomic, readonly) BOOL supportedOrientationPortraitUpsideDown;
@property (nonatomic, readonly) BOOL supportedOrientationLandscapeLeft;
@property (nonatomic, readonly) BOOL supportedOrientationLandscapeRight;

@property (nonatomic) UITapGestureRecognizer *backgroudViewTapToDismissGesture;

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

@property (nonatomic) UIView *defaultBackgroudView;
@property (nonatomic) UITapGestureRecognizer *backgroudViewTapToDismissGesture;

@end

@implementation LvModelWindow

- (instancetype)init
{
    return [self initWithPreferStatusBarHidden:NO
                          preferStatusBarStyle:UIStatusBarStyleDefault
                  supportedOrientationPortrait:YES
        supportedOrientationPortraitUpsideDown:YES
             supportedOrientationLandscapeLeft:YES
            supportedOrientationLandscapeRight:YES
                              windowEdgeInsets:UIEdgeInsetsZero];
}

- (instancetype)initWithPreferStatusBarHidden:(BOOL)preferStatusBarHidden
                         preferStatusBarStyle:(UIStatusBarStyle)preferStatusBarStyle
                 supportedOrientationPortrait:(BOOL)supportedOrientationPortrait
       supportedOrientationPortraitUpsideDown:(BOOL)supportedOrientationPortraitUpsideDown
            supportedOrientationLandscapeLeft:(BOOL)supportedOrientationLandscapeLeft
           supportedOrientationLandscapeRight:(BOOL)supportedOrientationLandscapeRight
{
    return [self initWithPreferStatusBarHidden:preferStatusBarHidden
                          preferStatusBarStyle:preferStatusBarStyle
                  supportedOrientationPortrait:supportedOrientationPortrait
        supportedOrientationPortraitUpsideDown:supportedOrientationPortraitUpsideDown
             supportedOrientationLandscapeLeft:supportedOrientationLandscapeLeft
            supportedOrientationLandscapeRight:supportedOrientationLandscapeRight
                              windowEdgeInsets:UIEdgeInsetsZero];
}

- (instancetype)initWithPreferStatusBarHidden:(BOOL)preferStatusBarHidden
                         preferStatusBarStyle:(UIStatusBarStyle)preferStatusBarStyle
                 supportedOrientationPortrait:(BOOL)supportedOrientationPortrait
       supportedOrientationPortraitUpsideDown:(BOOL)supportedOrientationPortraitUpsideDown
            supportedOrientationLandscapeLeft:(BOOL)supportedOrientationLandscapeLeft
           supportedOrientationLandscapeRight:(BOOL)supportedOrientationLandscapeRight
                             windowEdgeInsets:(UIEdgeInsets)windowEdgeInsets
{
    if (self = [super init]) {
        _preferStatusBarHidden = preferStatusBarHidden;
        _preferStatusBarStyle = preferStatusBarStyle;
        _supportedOrientationPortrait = supportedOrientationPortrait;
        _supportedOrientationPortraitUpsideDown = supportedOrientationPortraitUpsideDown;
        _supportedOrientationLandscapeLeft = supportedOrientationLandscapeLeft;
        _supportedOrientationLandscapeRight = supportedOrientationLandscapeRight;
        _windowEdgeInsets = windowEdgeInsets;
        [self setupModelWindow];
    }
    return self;
}

- (void)setupModelWindow
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    CGRect windowFrame = CGRectMake(_windowEdgeInsets.left, _windowEdgeInsets.top, screenSize.width - (_windowEdgeInsets.left + _windowEdgeInsets.right), screenSize.height - (_windowEdgeInsets.top + _windowEdgeInsets.bottom));
    
    _window = [[UIWindow alloc]initWithFrame:windowFrame];
    _window.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    _windowRootVC = [[LvModelWindowRootVC alloc]initWithPrefersStatusBarHidden:_preferStatusBarHidden
                                                          preferStatusBarStyle:_preferStatusBarStyle
                                                  supportedOrientationPortrait:_supportedOrientationPortrait
                                        supportedOrientationPortraitUpsideDown:_supportedOrientationPortraitUpsideDown
                                             supportedOrientationLandscapeLeft:_supportedOrientationLandscapeLeft
                                            supportedOrientationLandscapeRight:_supportedOrientationLandscapeRight];
    _window.rootViewController = _windowRootVC;
    _window.rootViewController.view.backgroundColor = [UIColor clearColor];
    
    // Set default backgroud view
    [self setBackgroudView:self.defaultBackgroudView];
}

- (UIView *)defaultBackgroudView
{
    if (!_defaultBackgroudView) {
        _defaultBackgroudView = [UIView new];
        _defaultBackgroudView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    }
    return _defaultBackgroudView;
}

- (UIView *)windowRootView
{
    return _windowRootVC.view;
}

- (UIViewController *)windowRootViewCcontroller
{
    return _windowRootVC;
}

- (void)setBackgroudView:(UIView *)backgroudView {
    if (_backgroudView == backgroudView) return;
    
    [_backgroudView removeFromSuperview];
    _backgroudViewTapToDismissGesture = nil;
    
    _backgroudView = backgroudView;
    
    if (backgroudView) {
        backgroudView.translatesAutoresizingMaskIntoConstraints = YES;
        backgroudView.frame = self.windowRootView.bounds;
        backgroudView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.windowRootView insertSubview:backgroudView atIndex:0];
        
        backgroudView.userInteractionEnabled = YES;
        self.backgroudViewTapToDismissGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroudViewToDismiss:)];
    }
}

- (void)backgroudViewToDismiss:(UITapGestureRecognizer *)tap {
    [self dismissWithAnimated:YES];
}

/**
 *  显示
 */
- (void)showWithAnimated:(BOOL)animated
{
    if ([self showing])
        return;
    
    _window.hidden = NO;
    
    if (animated && self.modelWindowAnimation) {
        
        LvModelWindowAnimationContext *animationCtx = [[LvModelWindowAnimationContext alloc]init];
        animationCtx.windowContainerView = self.windowRootView;
        animationCtx.fromVisible = NO;
        animationCtx.toVisible = YES;
        animationCtx.completeAnimationBlock = ^(BOOL didComplete){
            [self didShow];
        };
        [self.modelWindowAnimation animate:animationCtx];
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

- (void)dismissWithAnimated:(BOOL)animated
{
    if (![self showing]) {
        return;
    }
    
    if (animated && self.modelWindowAnimation) {
        
        LvModelWindowAnimationContext *animationCtx = [[LvModelWindowAnimationContext alloc]init];
        animationCtx.windowContainerView = self.windowRootView;
        animationCtx.fromVisible = YES;
        animationCtx.toVisible = NO;
        animationCtx.completeAnimationBlock = ^(BOOL didComplete){
            _window.hidden = YES;
            [self didDismiss];
        };
        [self.modelWindowAnimation animate:animationCtx];
    } else {
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
