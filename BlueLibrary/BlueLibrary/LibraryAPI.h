//
//  LibraryAPI.h
//  BlueLibrary
//
//  Created by m1nd on 29.01.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface LibraryAPI : NSObject

+ (LibraryAPI *)sharedInstance;

- (NSArray *)getAlbums;

- (void)addAlbums:(Album *)album atIndex:(int)index;

- (void)deleteAlbumIndex:(int)index;

@end
