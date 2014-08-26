//
//  CLRootViewController.m
//  NavigationTrasionViewController
//
//  Created by Charles Leo  on 14-6-24.
//  Copyright (c) 2014年 Grace Leo. All rights reserved.
//

#import "CLRootViewController.h"
#import "CLSecondViewController.h"
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
    self.view.backgroundColor = [UIColor redColor];
    int flag = 100;
    for ( int i = 0; i<2; i++) {
        for (int j = 0; j<2; j++) {
            UIView * view = [[UIView alloc]initWithFrame:CGRectMake(i* 90+ 80,j* 90+ 200, 80, 80)];
            view.backgroundColor = [UIColor greenColor];
            UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOneClick:)];
            view.userInteractionEnabled = YES;
            view.tag = flag ++;
            [view addGestureRecognizer:singleTap];
            [self.view addSubview:view];
        }
    }
}

-(void)tapOneClick:(UITapGestureRecognizer *)gesture
{
    NSLog(@"tag is %d",gesture.view.tag);
    currentTag = gesture.view.tag;
   // CGPoint point = gesture.view.frame.origin;
    orginPoint = gesture.view.frame.origin;
    self.mPoint = gesture.view.center;
    CGPoint center = gesture.view.center;
    [UIView animateWithDuration:0.35 animations:^{
        gesture.view.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        
    }];
    CLSecondViewController * sendView = [[CLSecondViewController alloc]init];
    sendView.mPoint = self.mPoint;
    sendView.view.frame = CGRectZero;
    [self.navigationController pushViewController:sendView animated:YES];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [UIView animateWithDuration:0.35 animations:^{
       
        UIView * view = [self.view viewWithTag:currentTag];
        view.frame =  CGRectMake(orginPoint.x, orginPoint.y, 80, 80);
    }];
   
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
