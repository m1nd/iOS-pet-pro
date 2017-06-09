//
//  VNMGovernment.h
//  NotificationsTest
//
//  Created by m1nd on 15.04.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString* const VNMGovernmentTaxLevelDidChangeNotification;
extern NSString* const VNMGovernmentSalaryDidChangeNotification;
extern NSString* const VNMGovernmentPensionDidChangeNotification;
extern NSString* const VNMGovernmentAveragePriceDidChangeNotification;

extern NSString* const VNMGovernmentTaxLevelUserInfoKey;
extern NSString* const VNMGovernmentSalaryUserInfoKey;
extern NSString* const VNMGovernmentPensionUserInfoKey;
extern NSString* const VNMGovernmentAveragePriceUserInfoKey;

@interface VNMGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;

@end
