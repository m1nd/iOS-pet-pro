//
//  VNUser.h
//  APITest
//
//  Created by m1nd on 08.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "VNServerObject.h"

@interface VNUser : VNServerObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSURL *imageURL;

@end
