//
//  VNMDetailViewController.h
//  NewsCatalog
//
//  Created by m1nd on 30.12.13.
//  Copyright (c) 2013 m1nd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NCData.h"

@interface VNMDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) NCData *detail;

@end
