//
//  LibraryAPI.m
//  BlueLibrary
//
//  Created by m1nd on 29.01.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import "LibraryAPI.h"
#import "PersistencyManager.h"
#import "HTTPClient.h"

@interface LibraryAPI ()
{
    PersistencyManager *persistencyManager;
    HTTPClient *httpClient;
    BOOL isOnLine;
}
@end


@implementation LibraryAPI

- (id)init
{
    self = [super init];
    if (self) {
        persistencyManager = [[PersistencyManager alloc]init];
        httpClient = [[HTTPClient alloc]init];
        isOnLine = NO;
    }
    return self;
}

+ (LibraryAPI *)sharedInstance
{
    static LibraryAPI *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc]init];
    });
    return _sharedInstance;
}

- (NSArray *)getAlbums
{

    return [persistencyManager getAlbums];

}

- (void)addAlbums:(Album *)album atIndex:(int)index
{

    [persistencyManager addAlbum:album atIndex:index];
    if (isOnLine) {
        [httpClient postRequest:@"/api/Album" body:[album description]];
    }

}

- (void)deleteAlbumIndex:(int)index
{

    [persistencyManager deleteAlbumAtIndex:index];
    if (isOnLine) {
        [httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
    
}

@end
