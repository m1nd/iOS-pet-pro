//
//  ViewController.m
//  Calculator
//
//  Created by m1nd on 08.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "ViewController.h"
#import "CalculateModel.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) CalculateModel *model;
@property (assign, nonatomic) BOOL waitNextOperand;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[CalculateModel alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onOperandPressed:(UIButton *)sender {
    NSString *value = self.valueLabel.text;
    if ([value isEqualToString:@"0"] || self.waitNextOperand) {
        value = @"";
        self.waitNextOperand = NO;
    }
    value = [value stringByAppendingString:sender.titleLabel.text];
    self.valueLabel.text = value;
}
- (IBAction)onOperationPressed:(UIButton *)sender {
    self.model.operation = sender.titleLabel.text;
    self.model.currentOperand = self.valueLabel.text.floatValue;
    self.waitNextOperand = YES;
    
}
- (IBAction)onEqualPressed:(UIButton *)sender {
    CGFloat value = [self.model performOperand:self.valueLabel.text.floatValue];
    self.valueLabel.text = [NSString stringWithFormat:@"%f", value];
    self.model.currentOperand = value;
    
    
}
- (IBAction)onClearPressed:(UIButton *)sender {
    self.valueLabel.text = @"0";
    self.model.operation = nil;
}

@end
