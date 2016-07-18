//
//  BaseAnimator.m
//  自定义转场动画
//
//  Created by  lichen on 16/5/23.
//  Copyright © 2016年  lichen. All rights reserved.
//

#import "BaseAnimator.h"

@interface BaseAnimator()

@property (nonatomic, weak) id <UIViewControllerContextTransitioning> transitionContext;

@property (weak,nonatomic) UIViewController *fromViewController;
@property (weak,nonatomic) UIViewController *toViewController;
@property (weak,nonatomic) UIView *containerView;

@end

@implementation BaseAnimator

- (instancetype)init
{
    if (self = [super init]) {
        
        [self deafultSet];
    }
    return self;
}
//默认参数设置
- (void)deafultSet {
    
    _transitionDuration = 0.5f;
    
}
#pragma mark --- animate delegate
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    return _transitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    self.toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    self.containerView      = [transitionContext containerView];
    self.transitionContext  = transitionContext;
    
    [self animateTransitionEvent];
    
}

- (void)animateTransitionEvent
{
    
}

#pragma mark -
- (void)completeTransition {
    
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
}

@end
