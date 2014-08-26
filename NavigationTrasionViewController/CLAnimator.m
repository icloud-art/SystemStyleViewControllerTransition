//
//  CLAnimator.m
//  NavigationTrasionViewController
//
//  Created by Charles Leo  on 14-6-24.
//  Copyright (c) 2014年 Grace Leo. All rights reserved.
//

#import "CLAnimator.h"

@implementation CLAnimator

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    NSLog(@"尼玛1");
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
      // fromViewController.view.transform = CGAffineTransformMakeScale(2,2);
        fromViewController.view.transform = CGAffineTransformScale(CGAffineTransformMakeScale(0, 0), 2, 2);
       // fromViewController.view.transform = CGAffineTransformMakeTranslation(320,0);//右移动画
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
}
@end
