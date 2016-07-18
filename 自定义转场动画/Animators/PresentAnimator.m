//
//  PresentAnimator.m
//  自定义转场动画
//
//  Created by  lichen on 16/5/23.
//  Copyright © 2016年  lichen. All rights reserved.
//

#import "PresentAnimator.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@implementation PresentAnimator

- (void)animateTransitionEvent
{
    OneViewController *one = (OneViewController *)self.fromViewController;
    
    TwoViewController *two = (TwoViewController *)self.toViewController;;
    
    UITableViewCell *cell = [one.tab cellForRowAtIndexPath:one.currentIndexPath];
    UIImageView *cellImg = [cell.contentView viewWithTag:101];
    
    NSLog(@"img.x-----%f,img.y------%f",cellImg.frame.origin.x,cellImg.frame.origin.y);
    
    UIView *tmpImageView = [cellImg snapshotViewAfterScreenUpdates:NO];
    tmpImageView.frame = [cellImg convertRect:cellImg.bounds toView: self.containerView];
    
    [self.containerView addSubview:self.toViewController.view];
    
    [self.containerView addSubview:tmpImageView];

    cellImg.hidden = YES;
    two.view.alpha = 0;
    two.img.hidden = YES;

    //开始做动画
    [UIView animateWithDuration:self.transitionDuration
                          delay:0.0f
         usingSpringWithDamping:1 initialSpringVelocity:0.f options:0 animations:^{

            tmpImageView.frame = [two.img convertRect:two.img.bounds toView:self.containerView];
            two.view.alpha = 1;

         } completion:^(BOOL finished) {
             //转场完毕删除原图片
             tmpImageView.hidden = YES;
             two.img.hidden = NO;
             [self completeTransition];
         }];

    
    
}

@end
