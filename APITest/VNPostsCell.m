//
//  VNPostsCell.m
//  APITest
//
//  Created by m1nd on 30.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "VNPostsCell.h"

@implementation VNPostsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightForText:(NSString *)text {

    CGFloat offset = 5.0;
    
    UIFont *font = [UIFont systemFontOfSize:17.f];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(0, -1);
    shadow.shadowBlurRadius = 0.5;
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    [paragraph setLineBreakMode:NSLineBreakByWordWrapping];
    [paragraph setAlignment:NSTextAlignmentCenter];
    
    
    NSDictionary *attibutes = [NSDictionary dictionaryWithObjectsAndKeys:
                               font, NSFontAttributeName,
                               paragraph, NSParagraphStyleAttributeName,
                               shadow, NSShadowAttributeName, nil];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(320 - 2 * offset, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attibutes
                                     context:nil];
    return CGRectGetHeight(rect) + 2 * offset;
}


@end
