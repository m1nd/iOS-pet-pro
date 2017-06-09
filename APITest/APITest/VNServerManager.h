//
//  VNServerManager.h
//  APITest
//
//  Created by m1nd on 08.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VNUser;

@interface VNServerManager : NSObject

@property (strong, nonatomic, readonly) VNUser *currentUser;

+ (VNServerManager *)sharedManager;

- (void)authorizeUser:(void(^)(VNUser * user)) completion;

- (void)getFriendsWithOffset:(NSInteger) offset
                       count:(NSInteger) count
                   onSuccees:(void(^)(NSArray *friends)) succees
                   onFailuer:(void (^)(NSError * error, NSInteger statusCode)) faulure;

- (void)getUser:(NSString *) userID
      onSuccees:(void(^)(VNUser *user)) succees
      onFailuer:(void (^)(NSError * error, NSInteger statusCode)) faulure;

- (void)getGroupWall:(NSString *) groupID
          withOffset:(NSInteger) offset
               count:(NSInteger) count
           onSuccees:(void(^)(NSArray *posts)) succees
           onFailuer:(void (^)(NSError * error, NSInteger statusCode)) faulure;

-(void)postText:(NSString *)text
    onGroupWall:(NSString *)groupID
      onSuccees:(void(^)(id result)) succees
      onFailuer:(void (^)(NSError * error, NSInteger statusCode)) faulure;

@end
