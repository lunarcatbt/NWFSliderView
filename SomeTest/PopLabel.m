//
//  PopLabel.m
//  SomeTest
//
//  Created by 李威龙 on 16/1/15.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "PopLabel.h"

@implementation PopLabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"remark"];
    
    [image drawInRect:rect];
    
}


@end
