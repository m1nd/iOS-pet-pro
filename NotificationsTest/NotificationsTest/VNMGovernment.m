//
//  VNMGovernment.m
//  NotificationsTest
//
//  Created by m1nd on 15.04.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import "VNMGovernment.h"

NSString* const VNMGovernmentTaxLevelDidChangeNotification = @"VNMGovernmentTaxLevelDidChangeNotification";
NSString* const VNMGovernmentSalaryDidChangeNotification = @"VNMGovernmentSalaryDidChangeNotification";
NSString* const VNMGovernmentPensionDidChangeNotification = @"VNMGovernmentPensionDidChangeNotification";
NSString* const VNMGovernmentAveragePriceDidChangeNotification = @"VNMGovernmentAveragePriceDidChangeNotification";

NSString* const VNMGovernmentTaxLevelUserInfoKey = @"VNMGovernmentTaxLevelUserInfoKey";
NSString* const VNMGovernmentSalaryUserInfoKey = @"VNMGovernmentSalaryUserInfoKey";
NSString* const VNMGovernmentPensionUserInfoKey = @"VNMGovernmentPensionUserInfoKey";
NSString* const VNMGovernmentAveragePriceUserInfoKey = @"VNMGovernmentAveragePriceUserInfoKey";

@implementation VNMGovernment

- (id)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000;
        _pension = 500;
        _averagePrice = 10;
    }
    return self;
}

- (void)setTaxLevel:(CGFloat)taxLevel
{
    _taxLevel = taxLevel;

    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:VNMGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VNMGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}


- (void)setSalary:(CGFloat)salary
{
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:VNMGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VNMGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void)setPension:(CGFloat)pension
{
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:VNMGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VNMGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void)setAveragePrice:(CGFloat)averagePrice
{
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:VNMGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VNMGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

@end
