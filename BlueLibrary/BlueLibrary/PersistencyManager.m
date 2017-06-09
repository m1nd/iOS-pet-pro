//
//  PersistencyManager.m
//  BlueLibrary
//
//  Created by m1nd on 29.01.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import "PersistencyManager.h"

@interface PersistencyManager()
{
    NSMutableArray *albums;
}
@end

@implementation PersistencyManager

- (id)init
{

    self = [super init];
    if (self) {
        albums = [NSMutableArray arrayWithArray:
                  @[[[Album alloc] initWithTitle:@"Best of Bowie"
                                        aritist:@"David Bowie"
                                        coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png"
                                           year:@"1992"],
                  [[Album alloc] initWithTitle:@"It's my Life"
                                        aritist:@"No Doubt"
                                       coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_no%20doubt_its%20my%20life%20%20bathwater.png"
                                           year:@"2003" ],
                  [[Album alloc] initWithTitle:@"Nothing Like The Sun"
                                       aritist:@"Sting"
                                      coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_sting_nothing%20like%20the%20sun.png"
                                          year:@"1999"],
                  [[Album alloc] initWithTitle:@"Starting At The Sun"
                                       aritist:@"U2"
                                      coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_u2_staring%20at%20the%20sun.png"
                                          year:@"2000"],
                  [[Album alloc] initWithTitle:@"American Pie"
                                       aritist:@"Madonna"
                                      coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_madonna_american%20pie.png"
                                          year:@"2000"]]];
    }
    return self;
}

- (NSArray *)getAlbums
{
    return albums;
}

- (void)addAlbum:(Album *)album atIndex:(NSUInteger)index
{
    if (albums.count >= index)
        [albums insertObject:album atIndex:index];
    else
        [albums addObject:album];
}

- (void)deleteAlbumAtIndex:(NSUInteger)index
{
    [albums removeObjectAtIndex:index];
}

@end
