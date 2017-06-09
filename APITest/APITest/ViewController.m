//
//  ViewController.m
//  APITest
//
//  Created by m1nd on 08.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "ViewController.h"
#import "VNServerManager.h"
#import "UIImageView+AFNetworking.h"

#import "VNUser.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *friendsArray;

@property (assign, nonatomic) BOOL firstTimeAppear;

@end

@implementation ViewController

static NSInteger friendsInRequest = 5;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.friendsArray = [NSMutableArray array];
    
    self.firstTimeAppear = YES;
    //[self getFriendsFromServer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

- (void)getFriendsFromServer {
    
    [[VNServerManager sharedManager]
    getFriendsWithOffset:[self.friendsArray count]
                   count:20
               onSuccees:^(NSArray *friends) {
                   [self.friendsArray addObjectsFromArray:friends];
                   
                   NSMutableArray *newPaths = [NSMutableArray array];
                   for (int i = (int)[self.friendsArray count] - (int)[friends count]; i < [self.friendsArray count]; i++) {
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

    return [self.friendsArray count]+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == [self.friendsArray count]) {
        cell.textLabel.text = @"LOAD MORE";
        cell.imageView.image = nil;
    } else {
        VNUser *friend = [self.friendsArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                               friend.firstName,
                               friend.lastName];
        NSURLRequest *request = [NSURLRequest requestWithURL:friend.imageURL];
        __weak UITableViewCell *weakCell = cell;
        cell.imageView.image = nil;
        [cell.imageView setImageWithURLRequest:request
                              placeholderImage:nil
                                       success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                           weakCell.imageView.image = image;
                                           [weakCell layoutSubviews];
                                       }
                                       failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                           
                                       } ];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == [self.friendsArray count]) {
        [self getFriendsFromServer];
    }
}


@end
