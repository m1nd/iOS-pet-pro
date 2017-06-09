//
//  VNGroupWallViewController.m
//  APITest
//
//  Created by m1nd on 29.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "VNGroupWallViewController.h"
#import "VNServerManager.h"
#import "VNPostsCell.h"

#import "VNUser.h"
#import "VNPost.h"

@interface VNGroupWallViewController ()

@property (strong, nonatomic) NSMutableArray *postsArray;

@property (assign, nonatomic) BOOL firstTimeAppear;

@end

static NSInteger postsInRequest = 5;

@implementation VNGroupWallViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.postsArray = [NSMutableArray array];
    
    self.firstTimeAppear = YES;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    [refresh addTarget:self action:@selector(refreshWall) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    
    UIBarButtonItem *plus = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(postOnWall:)];
    self.navigationItem.rightBarButtonItem = plus;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:YES];
    if (self.firstTimeAppear) {
        self.firstTimeAppear = NO;
        [[VNServerManager sharedManager]authorizeUser:^(VNUser *user) {
            NSLog(@"AUTHORIZED!");
            NSLog(@"%@ %@", user.firstName, user.lastName);
        }];
    }
}

#pragma mark -API

- (void)postOnWall:(id) sender {
    [[VNServerManager sharedManager] postText:@"This is a test message"
                                onGroupWall:@"79541794"
                                  onSuccees:^(id result) {
                                      
                                  } onFailuer:^(NSError *error, NSInteger statusCode) {
                                      
                                  }];
}


- (void)refreshWall {

    [[VNServerManager sharedManager]
     getGroupWall:@"79541794"
     withOffset:0
     count:MAX(postsInRequest, [self.postsArray count])
     onSuccees:^(NSArray *posts) {
         [self.postsArray removeAllObjects];
         [self.postsArray addObjectsFromArray:posts];
         [self.tableView reloadData];
         [self.refreshControl endRefreshing];
     }
     onFailuer:^(NSError *error, NSInteger statusCode) {
         NSLog(@"error =  %@, code = %ld", [error localizedDescription], statusCode);
         [self.refreshControl endRefreshing];
     }];
    
}

- (void)getPostsFromServer {
    
    [[VNServerManager sharedManager]
     getGroupWall:@"79541794"
     withOffset:[self.postsArray count]
     count:postsInRequest
     onSuccees:^(NSArray *posts) {
         [self.postsArray addObjectsFromArray:posts];
         
         NSMutableArray *newPaths = [NSMutableArray array];
         for (int i = (int)[self.postsArray count] - (int)[posts count]; i < [self.postsArray count]; i++) {
             [newPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
         }
         
         [self.tableView beginUpdates];
         [self.tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationTop];
         [self.tableView endUpdates];
         //[self.tableView reloadData];
     }
     onFailuer:^(NSError *error, NSInteger statusCode) {
         NSLog(@"error =  %@, code = %ld", [error localizedDescription], statusCode);
     }];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.postsArray count]+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.row == [self.postsArray count]) {
    
        static NSString *identifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = @"LOAD MORE";
        cell.imageView.image = nil;
        
        return cell;
        
    } else {
       
        static NSString *identifier = @"PostCell";
        
        VNPostsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        VNPost *post = [self.postsArray objectAtIndex:indexPath.row];
        
        cell.postTextLabel.text = post.text;
    
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == [self.postsArray count]) {
        
    return 44.f;
        
    } else {
        VNPost *post = [self.postsArray objectAtIndex:indexPath.row];
        return [VNPostsCell heightForText:post.text];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == [self.postsArray count]) {
        [self getPostsFromServer];
    }
}

@end
