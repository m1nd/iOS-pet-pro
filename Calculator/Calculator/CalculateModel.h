//
//  CalculateModel.h
//  Calculator
//
//  Created by m1nd on 08.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CalculateModel : NSObject

@property (copy, nonatomic) NSString *operation;
@property (assign, nonatomic) CGFloat currentOperand;

- (CGFloat)performOperand:(CGFloat)operand;

@end
