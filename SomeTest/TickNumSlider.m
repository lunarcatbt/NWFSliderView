//
//  TickNumSlider.m
//  SomeTest
//
//  Created by 李威龙 on 16/1/14.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "TickNumSlider.h"

@implementation TickNumSlider

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, - 20, 40, 20)];
        _numLabel.text = @"0";
        _numLabel.backgroundColor = [UIColor greenColor];
        _numLabel.textColor = [UIColor redColor];
        _numLabel.alpha = 0;
        
        [self addSubview:_numLabel];
    }
    
    return self;
}

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value{
    CGRect kRect = [super thumbRectForBounds:bounds trackRect:rect value:value];
    
    float stepValueInternal = self.frame.size.width/17;
    
    _numLabel.text = [self valueInt:roundf(kRect.origin.x / stepValueInternal)];
    _numLabel.transform = CGAffineTransformMakeTranslation(kRect.origin.x, 0);

    if(stepValueInternal > 0)
    {
        kRect = CGRectMake(roundf(kRect.origin.x / stepValueInternal) * stepValueInternal, kRect.origin.y, kRect.size.width, kRect.size.height) ;
    }
    
    return kRect;
}

- (NSString *)valueInt:(CGFloat)value{
    return [[NSString stringWithFormat:@"%d",(int)value + 8] stringByAppendingString:@"%"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    self.numLabel.alpha = 1.f;

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.numLabel.alpha = 0;
    }];

}
@end
