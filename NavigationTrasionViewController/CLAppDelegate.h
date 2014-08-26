//
//  CLAppDelegate.h
//  NavigationTrasionViewController
//
//  Created by Charles Leo  on 14-6-24.
//  Copyright (c) 2014年 Grace Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLNavigationControllerDelegate.h"

@interface CLAppDelegate : UIResponder <UIApplicationDelegate>
{
    CLNavigationControllerDelegate * delegate;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UINavigationController * mNavCtrl;
@end
