//
//  VNLoginViewController.h
//  APITest
//
//  Created by m1nd on 21.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VNAccessToken;

typedef void(^VNLoginCompletionBlock)(VNAccessToken *token);

@interface VNLoginViewController : UIViewController

- (id)initWithCompletionBlock:(VNLoginCompletionBlock) completionBlock;

@end
