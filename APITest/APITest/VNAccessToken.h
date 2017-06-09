//
//  VNAccessToken.h
//  APITest
//
//  Created by m1nd on 21.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VNAccessToken : NSObject

@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSDate *expirationDate;
@property (strong, nonatomic) NSString *userID;

@end
