//
//  CalculateModel.m
//  Calculator
//
//  Created by m1nd on 08.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "CalculateModel.h"

@implementation CalculateModel

- (CGFloat)performOperand:(CGFloat)operand
{
    CGFloat value = self.currentOperand;
    
    if ([self.operation isEqualToString:@"x"]) {
        value *= operand;
    }
    
    if ([self.operation isEqualToString:@"/"]) {
        value /= operand;
    }
    
    if ([self.operation isEqualToString:@"+"]) {
        value += operand;
    }
    
    if ([self.operation isEqualToString:@"-"]) {
        value -= operand;
    }
    
    return value;
}

@end
