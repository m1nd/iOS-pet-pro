//
//  BCData.h
//  Ex3
//
//  Created by m1nd on 29.12.13.
//  Copyright (c) 2013 m1nd. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface NCData : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *createdOn;
@property (nonatomic, copy) NSString *author;

+ (NSArray *)fetchData;

@end
