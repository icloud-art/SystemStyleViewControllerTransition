//
//  CLRootViewController.h
//  NavigationTrasionViewController
//
//  Created by Charles Leo  on 14-6-24.
//  Copyright (c) 2014年 Grace Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLNavigationControllerDelegate.h"
@interface CLRootViewController : UIViewController
{
    CLNavigationControllerDelegate * delegate;
}
@property (assign,nonatomic) CGPoint mPoint;
@end
