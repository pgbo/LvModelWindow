//
//  DefaultModelWindowAnimation.m
//  LvModelWindow
//
//  Created by guangbool on 16/5/31.
//  Copyright © 2016年 pgbo. All rights reserved.
//

#import "DefaultModelWindowAnimation.h"

@implementation DefaultModelWindowAnimation

- (NSTimeInterval)animationDuration:(id<LvModelWindowContextAnimationing>)animationContext
{
    return 0.3;
}

- (void)animate:(id<LvModelWindowContextAnimationing>)animationContext
{
    if (!animationContext.fromVisible && animationContext.toVisible) {
        
        CGRect contentViewOriginFrame = _contentView.frame;
        _contentView.frame = CGRectMake(CGRectGetWidth(animationContext.windowContainerView.frame),
                                        CGRectGetMinY(contentViewOriginFrame),
                                        CGRectGetWidth(contentViewOriginFrame),
                                        CGRectGetHeight(contentViewOriginFrame));
        _touchBackgroudView.alpha = 0;
        
        [UIView animateWithDuration:0.3 animations:^{
            CGRect contentViewOriginFrame = _contentView.frame;
            _contentView.frame = CGRectMake(CGRectGetWidth(animationContext.windowContainerView.frame) - CGRectGetWidth(contentViewOriginFrame),
                                            CGRectGetMinY(contentViewOriginFrame),
                                            CGRectGetWidth(contentViewOriginFrame),
                                            CGRectGetHeight(contentViewOriginFrame));
            
            _touchBackgroudView.alpha = 1;
        } completion:^(BOOL finished) {
            if (animationContext.completeAnimationBlock) {
                animationContext.completeAnimationBlock(finished);
            }
        }];
        
    } else if (animationContext.fromVisible && !animationContext.toVisible) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect contentViewOriginFrame = _contentView.frame;
            _contentView.frame = CGRectMake(CGRectGetWidth(animationContext.windowContainerView.frame),
                                            CGRectGetMinY(contentViewOriginFrame),
                                            CGRectGetWidth(contentViewOriginFrame),
                                            CGRectGetHeight(contentViewOriginFrame));
            
            _touchBackgroudView.alpha = 0;
        } completion:^(BOOL finished) {
            if (animationContext.completeAnimationBlock) {
                animationContext.completeAnimationBlock(finished);
            }
        }];
    }
}

@end
