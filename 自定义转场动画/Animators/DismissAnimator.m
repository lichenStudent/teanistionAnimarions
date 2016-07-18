//
//  DismissAnimator.m
//  自定义转场动画
//
//  Created by  lichen on 16/5/23.
//  Copyright © 2016年  lichen. All rights reserved.
//

#import "DismissAnimator.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@implementation DismissAnimator

- (void)animateTransitionEvent
{
    
    OneViewController *one = (OneViewController *)self.toViewController;
    
    TwoViewController *two = (TwoViewController *)self.fromViewController;
    
    UITableViewCell *cell = [one.tab cellForRowAtIndexPath:one.currentIndexPath];
    
    UIImageView *cellImg = [cell.contentView viewWithTag:101];
    
    NSLog(@"img.x-----%f,img.y------%f",cellImg.frame.origin.x,cellImg.frame.origin.y);
    
    UIView *tmpImageView = self.containerView.subviews.lastObject;
    
    cellImg.hidden = YES;
    two.img.hidden = YES;
    tmpImageView.hidden = NO;
    
    [self.containerView insertSubview:self.toViewController.view atIndex:0];
    
    //开始做动画
    [UIView animateWithDuration:self.transitionDuration
                          delay:0.0f
         usingSpringWithDamping:1 initialSpringVelocity:0.f options:0 animations:^{
             
             tmpImageView.frame = [cellImg convertRect:cellImg.bounds toView:self.containerView];

             self.fromViewController.view.alpha = 0.f;
             
         } completion:^(BOOL finished) {
             //转场完毕删除原图片
            [self completeTransition];
            cellImg.hidden = NO;
            [tmpImageView removeFromSuperview];
            
         }];
    
}


@end
