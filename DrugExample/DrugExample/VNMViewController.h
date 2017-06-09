//
//  VNMViewController.h
//  DrugExample
//
//  Created by m1nd on 11.01.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VNMViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *squareView;
@property (nonatomic) CGPoint lastTransition;

- (IBAction)pan:(UIPanGestureRecognizer *)sender;

@end
