//
//  VNServerManager.m
//  APITest
//
//  Created by m1nd on 08.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "VNServerManager.h"
#import "AFNetworking.h"
#import "VNLoginViewController.h"
#import "VNAccessToken.h"

#import "VNUser.h"
#import "VNPost.h"

@interface VNServerManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *requestOperationManager;

@property (strong, nonatomic) VNAccessToken *accessToken;

@end

@implementation VNServerManager

+ (VNServerManager *)sharedManager{
    
    static VNServerManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[VNServerManager alloc]init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURL *url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    }
    return self;
}

- (void)authorizeUser:(void(^)(VNUser * user)) completion {

    VNLoginViewController *vc = [[VNLoginViewController alloc]initWithCompletionBlock:^(VNAccessToken *token) {
        
        self.accessToken = token;
        
        if (token) {
        
            [self getUser:self.accessToken.userID
        onSuccees:^(VNUser *user) {
            if (completion) {
                completion(user);
            }
        }
        onFailuer:^(NSError *error, NSInteger statusCode) {
            if (completion) {
                completion(nil);
            }
        }];
            
        } else if (completion) {
            completion(nil);
        }
        
    }];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    UIViewController *mainVC = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
    
    [mainVC presentViewController:nav
                        animated:YES
                      completion:nil];
    
}

- (void)getUser:(NSString *) userID
      onSuccees:(void(^)(VNUser *user)) succees
      onFailuer:(void (^)(NSError * error, NSInteger statusCode)) faulure {
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            userID, @"user_ids",
                            // @"269557", @"user_id",
                            @"photo_50", @"fields",
                            @"nom",      @"name_case", nil];
    
    
    [self.requestOperationManager GET:@"users.get" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *dictArray = [responseObject objectForKey:@"response"];
       
        if ([dictArray count] > 0) {
            VNUser *user = [[VNUser alloc]initWithServerResponse:[dictArray firstObject]];
            if (succees) {
                succees(user);
            } else {
                // if (failure) {
                //         failure(nil, operation.response.statusCode);
                // }
                
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        // if (failure) {
        //     failure(error, operation.response.statusCode);
        // }
        
    }];
    
    
}

- (void)getFriendsWithOffset:(NSInteger) offset
                       count:(NSInteger) count
                   onSuccees:(void(^)(NSArray *friends)) succees
                   onFailuer:(void (^)(NSError * error, NSInteger statusCode)) faulure {
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"79541794", @"user_id",
                           // @"269557", @"user_id",
                            @"name",     @"order",
                            @(count),    @"count",
                            @(offset),   @"offset",
                            @"photo_50", @"fields",
                            @"nom",      @"name_case", nil];
    
    
    [self.requestOperationManager GET:@"friends.get" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *dictArray = [responseObject objectForKey:@"response"];
        NSMutableArray *objectsArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
         
            VNUser *user = [[VNUser alloc]initWithServerResponse:dict];
            [objectsArray addObject:user];
            
        }
        
        if (succees) {
            succees(objectsArray);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
       // if (failure) {
       //     failure(error, operation.response.statusCode);
       // }
        
    }];
    
}

- (void)getGroupWall:(NSString *) groupID
          withOffset:(NSInteger) offset
               count:(NSInteger) count
           onSuccees:(void(^)(NSArray *posts)) succees
           onFailuer:(void (^)(NSError * error, NSInteger statusCode)) faulure {
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            groupID,     @"owner_id",
                            @(count),    @"count",
                            @(offset),   @"offset",
                            @"all",      @"filter", nil];
    
    
    [self.requestOperationManager GET:@"wall.get" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *dictArray = [responseObject objectForKey:@"response"];
        
        if ([dictArray count] > 1) {
            dictArray = [dictArray subarrayWithRange:NSMakeRange(1, (int)[dictArray count] - 1)];
        } else {
            dictArray = nil;
        }
        
        NSMutableArray *objectsArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            
            VNPost *user = [[VNPost alloc]initWithServerResponse:dict];
            [objectsArray addObject:user];
            
        }
        
        if (succees) {
            succees(objectsArray);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        // if (failure) {
        //     failure(error, operation.response.statusCode);
        // }
        
    }];
}

-(void)postText:(NSString *)text
    onGroupWall:(NSString *)groupID
      onSuccees:(void(^)(id result)) succees
      onFailuer:(void (^)(NSError * error, NSInteger statusCode)) faulure {
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            groupID,            @"owner_id",
                            text,               @"message",
                            self.accessToken.token,    @"access_token", nil];

    [self.requestOperationManager POST:@"wall.post" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if (succees) {
            succees(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        // if (failure) {
        //     failure(error, operation.response.statusCode);
        // }
        
    }];



}

@end
