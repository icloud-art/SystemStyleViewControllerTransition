//
//  CLPopAnimator.m
//  NavigationTrasionViewController
//
//  Created by Charles Leo  on 14-6-25.
//  Copyright (c) 2014年 Grace Leo. All rights reserved.
//

#import "CLPopAnimator.h"
@implementation CLPopAnimator
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.6;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    NSLog(@"尼玛2");
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       // fromViewController.view.transform = CGAffineTransformMakeScale(0, 0);
//        fromViewController.view.transform =CGAffineTransformMakeTranslation(1, 0);
//        CGAffineTransformMakeScale(2,2);
        fromViewController.view.transform = CGAffineTransformScale(CGAffineTransformMakeScale(0, 0), 0, 0);
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

@end
