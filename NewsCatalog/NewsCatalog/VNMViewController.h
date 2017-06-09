//
//  VNMViewController.h
//  NewsCatalog
//
//  Created by m1nd on 29.12.13.
//  Copyright (c) 2013 m1nd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VNMViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_data;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
