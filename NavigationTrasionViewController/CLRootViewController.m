//
//  CLRootViewController.m
//  NavigationTrasionViewController
//
//  Created by Charles Leo  on 14-6-24.
//  Copyright (c) 2014年 Grace Leo. All rights reserved.
//

#import "CLRootViewController.h"
#import "CLSecondViewController.h"
#import "CLAppDelegate.h"
@interface CLRootViewController ()
{
    NSInteger currentTag;
    CGPoint orginPoint;
}
@end

@implementation CLRootViewController
@synthesize mPoint;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"系统动画";
    //NSArray * array = @[@"AAA",@"BBB",@"CCC",@"DDD"];
    NSArray * arrayImage = @[@"ff_IconFacebook@2x",@"ff_IconLocationService@2x",@"ff_IconShowFaceBook@2x",@"ff_IconShowMobile@2x"];
    self.view.backgroundColor = [UIColor redColor];
    int flag = 100;
    for ( int i = 0; i<2; i++) {
        for (int j = 0; j<2; j++) {
            static  int k = 0;
            UIView * view = [[UIView alloc]initWithFrame:CGRectMake(i* 90+ 80,j* 90+ 200, 80, 80)];
            view.backgroundColor = [UIColor greenColor];
            UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOneClick:)];
            view.userInteractionEnabled = YES;
            
            view.tag = flag ++;
            //view.clipsToBounds = YES;
            view.autoresizesSubviews = YES;
            [view addGestureRecognizer:singleTap];
            [self.view addSubview:view];
            
            
            UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 50, 50)];
            title.backgroundColor = [UIColor clearColor];
            title.textColor = [UIColor blackColor];
            //title.text = [array objectAtIndex:k++];
            title.textAlignment = NSTextAlignmentCenter;
            title.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth |  UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
            [view addSubview:title];
            
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 50, 50)];
            imageView.image =[UIImage imageNamed:[arrayImage objectAtIndex:k++]];
            imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth |  UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
            [view addSubview:imageView];
        }
    }
}

-(void)tapOneClick:(UITapGestureRecognizer *)gesture
{
    NSLog(@"tag is %d",gesture.view.tag);
    currentTag = gesture.view.tag;
    orginPoint = gesture.view.frame.origin;
    self.mPoint = gesture.view.center;
    
    UIApplication * app = [UIApplication sharedApplication];
    CLAppDelegate * appDel = app.delegate;
    appDel.mTouchPoint = orginPoint;
    appDel.mTouchView = gesture.view;
    [UIView animateWithDuration:0.35 animations:^{
            appDel.mTouchView.frame = self.view.bounds;
    } completion:^(BOOL finished) {
            }];
    CLSecondViewController * sendView = [[CLSecondViewController alloc]init];
    sendView.mPoint = self.mPoint;
    //sendView.view.frame = CGRectZero;
    [self.navigationController pushViewController:sendView animated:YES];


}
- (void)viewDidDisappear:(BOOL)animated
{
//    [UIView animateWithDuration:1 animations:^{
//       
//        UIView * view = [self.view viewWithTag:currentTag];
//        view.frame =  CGRectMake(orginPoint.x, orginPoint.y, 80, 80);
//    }];
   
}
-(void)buttonClick:(id)sender{
    
    CLSecondViewController * secondView = [[CLSecondViewController alloc]init];
    [self.navigationController pushViewController:secondView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
