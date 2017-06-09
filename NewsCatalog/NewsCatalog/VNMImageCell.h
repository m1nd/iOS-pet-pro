//
//  VNMImageCell.h
//  NewsCatalog
//
//  Created by m1nd on 29.12.13.
//  Copyright (c) 2013 m1nd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VNMImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@property (weak, nonatomic) IBOutlet UILabel *cellTextLabel;

@end
