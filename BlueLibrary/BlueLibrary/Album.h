//
//  Album.h
//  BlueLibrary
//
//  Created by m1nd on 29.01.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, copy, readonly) NSString *title, *artist, *genre, *coverUrl, *year;

- (id)initWithTitle:(NSString *)title
            aritist:(NSString *)artist
           coverUrl:(NSString *)coverUrl
               year:(NSString *)year;

@end
