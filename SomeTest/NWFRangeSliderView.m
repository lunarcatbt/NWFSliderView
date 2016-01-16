//
//  NWFRangeSliderView.m
//  SomeTest
//
//  Created by 李威龙 on 16/1/13.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "NWFRangeSliderView.h"
#import "NMRangeSlider.h"

@implementation NWFRangeSliderView

{
    NSArray * tickNumbers;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        _rangeSL = [[NMRangeSlider alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];

        _rangeSL.stepValue = 1/16;
        _rangeSL.stepValueContinuously = YES;
//        rangeSL.lowerHandleImageNormal = [UIImage imageNamed:@"thumb"];
        
        [self addSubview:_rangeSL];
        
        self.opaque = YES;
        self.backgroundColor = [UIColor greenColor];
        self.userInteractionEnabled = YES;
        self.clipsToBounds = YES;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code.
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线条样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    //设置线条粗细宽度
    CGContextSetLineWidth(context, 1.0);
    
    CGFloat space = (self.frame.size.width - 20)/16;
    
    //设置颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    
    for (int i = 0; i < 17; i++) {
        //开始一个起始路径
        CGContextBeginPath(context);
        //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
//        CGContextMoveToPoint(context, i*space, self.frame.size.height/2);
        CGContextMoveToPoint(context, 10 + i*space, 20);

        //设置下一个坐标点
        CGContextAddLineToPoint(context,10 + i*space, 25);
        //连接上面定义的坐标点
        CGContextStrokePath(context);
    }
    
    if (tickNumbers) {
        UIFont  *font = [UIFont boldSystemFontOfSize:15.0];//设置
        
//        for (id temp in tickNumbers) {
//            NSInteger index = [tickNumbers indexOfObject:temp];
//            
//            [temp drawInRect:CGRectMake(index*space, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
//        }
        
        [@"8" drawInRect:CGRectMake(0, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
        [@"10" drawInRect:CGRectMake(0 + space*2, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
        [@"15" drawInRect:CGRectMake(0 + space*7, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
        [@"20" drawInRect:CGRectMake(0 + space*12, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
        [@"24" drawInRect:CGRectMake(0 + space*16, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];

    }
}

- (void)setupTickNumberWithItems:(NSArray *)items{
    tickNumbers = items;
    
    [self layoutIfNeeded];
}

@end
