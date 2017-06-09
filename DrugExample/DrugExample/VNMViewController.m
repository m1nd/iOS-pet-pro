//
//  VNMViewController.m
//  DrugExample
//
//  Created by m1nd on 11.01.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import "VNMViewController.h"

@interface VNMViewController ()

@end

@implementation VNMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)rotate
{

    self.squareView.transform = CGAffineTransformIdentity;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.squareView.transform = CGAffineTransformMakeRotation(M_PI/2);
    [UIView commitAnimations];
}

- (void)backToCenter
{

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(rotate)];
    CGPoint center = self.view.center;
    self.squareView.center = center;
    [UIView commitAnimations];
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender{

    if (sender.state == UIGestureRecognizerStateBegan)
        self.lastTransition = CGPointZero;
    
    CGPoint transition = [sender translationInView:self.view];
    CGRect newRect = self.squareView.frame;
    newRect.origin = CGPointMake(newRect.origin.x + transition.x - self.lastTransition.x, newRect.origin.y + transition.y - self.lastTransition.y);
    self.squareView.frame = newRect;
    self.lastTransition = transition;
    
    if (sender.state == UIGestureRecognizerStateEnded)
        [self backToCenter];
}

@end
