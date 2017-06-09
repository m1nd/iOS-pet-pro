//
//  VNMDoctor.m
//  NotificationsTest
//
//  Created by m1nd on 15.04.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import "VNMDoctor.h"
#import "VNMGovernment.h"

#pragma mark - Initialization

@implementation VNMDoctor

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:VNMGovernmentSalaryDidChangeNotification
                object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:VNMGovernmentAveragePriceDidChangeNotification
                 object:nil];
    
    }
    return self;
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void) salaryChangedNotification:(NSNotification*) notification
{
    NSNumber* value = [notification.userInfo objectForKey:VNMGovernmentSalaryUserInfoKey];
    CGFloat salary = [value floatValue];
    if (salary < self.salary) {
        NSLog(@"Doctors are not happy!");
    }else{
        NSLog(@"Doctors are happy :)))) !");
    }
    self.salary = salary;
}

- (void) averagePriceChangedNotification:(NSNotification*) notification
{
    
}

@end
