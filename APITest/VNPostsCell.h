//
//  VNPostsCell.h
//  APITest
//
//  Created by m1nd on 30.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VNPostsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *postTextLabel;

+ (CGFloat)heightForText:(NSString *)text;

@end
