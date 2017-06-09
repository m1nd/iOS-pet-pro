//
//  VNUser.m
//  APITest
//
//  Created by m1nd on 08.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "VNUser.h"

@implementation VNUser

- (id)initWithServerResponse:(NSDictionary *) responseObject {
    self = [super initWithServerResponse:responseObject];
    if (self) {
        self.firstName = [responseObject objectForKey:@"first_name"];
        self.lastName = [responseObject objectForKey:@"last_name"];
        
        NSString *urlString = [responseObject objectForKey:@"photo_50"];
        
        if (urlString) {
            self.imageURL = [NSURL URLWithString:urlString];
        }
        
    }
    return self;
}

@end
