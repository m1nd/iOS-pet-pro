//
//  ViewController.m
//  UIViewGeometryDZ
//
//  Created by m1nd on 12.04.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "ViewController.h"

typedef void(^ColorBlock)(UIColor *);

@interface ViewController ()

@property (strong, nonatomic) ColorBlock testBlock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat figureSize = 40.0f;
    CGRect square = self.view.bounds;
    square.size.height = self.view.bounds.size.width;
    square.origin = CGPointMake(0, 20);
    
//    UIView *desk = [[UIView alloc]initWithFrame:square];
//    desk.backgroundColor = [UIColor blueColor];
//    desk.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:desk];
//    NSLog(@"%@", NSStringFromCGRect(desk.frame));
    
    CGRect chessCage = CGRectMake(square.origin.x, square.origin.y , figureSize, figureSize);
    
    /*
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j <8; j++) {
            
            CGRect tmpRect = chessCage;
            tmpRect.origin = CGPointMake(chessCage.origin.x + 40*j, chessCage.origin.y + 40 *i);
            UIView *viewChess = [[UIView alloc]initWithFrame:tmpRect];
            if (j%2 && !(i%2)) {
                viewChess.backgroundColor = changeColor;
            } else if(!(i%2)) {
                viewChess.backgroundColor = [UIColor whiteColor];
            } else if (i%2) {
                if (!(j%2)) {
                    viewChess.backgroundColor = changeColor;
                } else viewChess.backgroundColor = [UIColor whiteColor];
            }
            viewChess.autoresizingMask =    UIViewAutoresizingFlexibleWidth         |   UIViewAutoresizingFlexibleRightMargin   |
                                            UIViewAutoresizingFlexibleLeftMargin    |   UIViewAutoresizingFlexibleTopMargin     |
                                            UIViewAutoresizingFlexibleBottomMargin;
            [self.view addSubview:viewChess];
        }
    }
    */
    
    __weak ViewController *mySelf = self;
    self.testBlock = ^(UIColor *testColor){
        
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j <8; j++) {
                
                CGRect tmpRect = chessCage;
                tmpRect.origin = CGPointMake(chessCage.origin.x + figureSize*j, chessCage.origin.y + figureSize *i);
                UIView *viewChess = [[UIView alloc]initWithFrame:tmpRect];
                if (j%2 && !(i%2)) {
                    viewChess.backgroundColor = testColor;
                } else if(!(i%2)) {
                    viewChess.backgroundColor = [UIColor whiteColor];
                } else if (i%2) {
                    if (!(j%2)) {
                        viewChess.backgroundColor = testColor;
                    } else viewChess.backgroundColor = [UIColor whiteColor];
                }
                viewChess.autoresizingMask =    UIViewAutoresizingFlexibleWidth         |   UIViewAutoresizingFlexibleRightMargin   |
                                                UIViewAutoresizingFlexibleLeftMargin    |   UIViewAutoresizingFlexibleTopMargin     |
                                                UIViewAutoresizingFlexibleBottomMargin;
                [mySelf.view addSubview:viewChess];
            }
        }
    };
    self.testBlock([UIColor blackColor]);
    
}


- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    self.testBlock([self generateColor]);
}

- (UIColor *)generateColor {
    CGFloat red = (arc4random()%200)/255.0f;
    CGFloat green = (arc4random()%250)/255.0f;
    CGFloat blue = (arc4random()%180)/255.0f;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    return color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
