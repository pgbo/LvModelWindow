//
//  LvModelWindowAnimating.h
//  Pods
//
//  Created by guangbool on 16/5/31.
//
//

#import <Foundation/Foundation.h>

#import "LvModelWindowContextAnimationing.h"

@protocol LvModelWindowAnimating <NSObject>

/**
 *  Asks your animator object for the duration (in seconds) of the animation.
 *
 *  @param animationContext Context for animation
 *
 *  @return The duration, in seconds, of your custom transition animation.
 */
- (NSTimeInterval)animationDuration:(id<LvModelWindowContextAnimationing>)animationContext;

/**
 *  Tells your animator object to perform the animations.
 *
 *  @param animationContext Context for animation
 */
- (void)animate:(id<LvModelWindowContextAnimationing>)animationContext;

@end
