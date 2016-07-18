//
//  BaseAnimator.h
//  自定义转场动画
//
//  Created by  lichen on 16/5/23.
//  Copyright © 2016年  lichen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseAnimator : NSObject<UIViewControllerAnimatedTransitioning>

//动画执行时间
@property (nonatomic) NSTimeInterval transitionDuration;

//子类重写此方法实现动画效果
- (void)animateTransitionEvent;

/**
 *  == 在animateTransitionEvent使用才有效 ==
 *
 *  源头控制器
 */
@property (weak,nonatomic,readonly) UIViewController *fromViewController;

/**
 *  == 在animateTransitionEvent使用才有效 ==
 *
 *  目标控制器
 */
@property (weak,nonatomic,readonly) UIViewController *toViewController;

/**
 *  == 在animateTransitionEvent使用才有效 ==
 *
 *  containerView(转场时两个viewcontrol的view)
 */
@property (weak,nonatomic,readonly) UIView *containerView;

//动画事件结束
- (void)completeTransition;

@end
