//
//  DefaultModelWindowAnimation.h
//  LvModelWindow
//
//  Created by guangbool on 16/5/31.
//  Copyright © 2016年 pgbo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <LvModelWindow/LvModelWindow.h>

@interface DefaultModelWindowAnimation : NSObject <LvModelWindowAnimating>

@property (nonatomic) UIView *touchBackgroudView;
@property (nonatomic) UIView *contentView;

@end
