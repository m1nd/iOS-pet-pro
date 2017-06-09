//
//  VNPost.h
//  APITest
//
//  Created by m1nd on 29.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "VNServerObject.h"

@interface VNPost : VNServerObject

@property (strong, nonatomic) NSString *text;

- (id)initWithServerResponse:(NSDictionary *) responseObject;


@end
