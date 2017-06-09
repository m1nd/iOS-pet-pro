//
//  VNMViewController.m
//  NewsCatalog
//
//  Created by m1nd on 29.12.13.
//  Copyright (c) 2013 m1nd. All rights reserved.
//

#import "VNMViewController.h"
#import "VNMImageCell.h"
#import "NCData.h"
#import "VNMDetailViewController.h"

@interface VNMViewController ()

@end

@implementation VNMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"ITDox";
    _data = [NCData fetchData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data count];
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const ImageCellId = @"ImageCell";
    
    VNMImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ImageCellId];
    
    NCData *item = [_data objectAtIndex:indexPath.row];
    [cell.cellTextLabel setText:item.title];
  //  cell.cellImageView.image = [UIImage imageNamed:item.imageName];
    [cell.cellImageView setImage:[UIImage imageNamed:item.imageName]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if (indexPath) {
        NCData *item = [_data objectAtIndex:indexPath.row];
        [segue.destinationViewController setDetail:item];
    }

}

@end
