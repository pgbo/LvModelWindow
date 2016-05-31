//
//  LvModelWindowContextAnimationing.h
//  Pods
//
//  Created by guangbool on 16/5/31.
//
//

#import <Foundation/Foundation.h>

@protocol LvModelWindowContextAnimationing <NSObject>

/**
 *  The view in which the animation should take place.
 */
- (UIView *)windowContainerView;

- (BOOL)fromVisible;

- (BOOL)toVisible;

- (void(^)(BOOL didComplete))completeAnimationBlock;

@end
