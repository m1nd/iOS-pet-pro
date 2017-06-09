//
//  VNPost.m
//  APITest
//
//  Created by m1nd on 29.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "VNPost.h"

@implementation VNPost

- (id)initWithServerResponse:(NSDictionary *) responseObject {
    self = [super initWithServerResponse:responseObject];
    if (self) {
        
        self.text = [responseObject objectForKey:@"text"];
        self.text = [self.text stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    }
    return self;
}


@end
