//
//  VNMDetailViewController.m
//  NewsCatalog
//
//  Created by m1nd on 30.12.13.
//  Copyright (c) 2013 m1nd. All rights reserved.
//

#import "VNMDetailViewController.h"

@interface VNMDetailViewController ()

@end

@implementation VNMDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetail:(NCData *)detail
{
    _detail = detail;
    NSLog(@"setDetail %@", _detail.title);
}

- (void)reloadData
{
    if (!_detail) {
        return;
    }
    self.navigationItem.title = _detail.category;
    self.titleLabel.text = _detail.title;
    self.imageView.image = [UIImage imageNamed:_detail.imageName];
    self.textView.text = _detail.text;
    
    CGRect contentViewFrame = _contentView.frame;
    contentViewFrame.size.height += _textView.contentSize.height - _textView.frame.size.height;
    _contentView.frame = contentViewFrame;
    _scrollView.contentSize = _contentView.frame.size;
}

@end
