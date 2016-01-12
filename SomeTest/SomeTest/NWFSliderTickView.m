//
//  NWFSliderTickView.m
//  SomeTest
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "NWFSliderTickView.h"

@implementation NWFSliderTickView
{
    UISlider *firstSL;
    UISlider *secSL;
    NSArray *tickNumbers;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame rangeOfSlider:(BOOL)isRange{
    self = [self initWithFrame:frame];
    
    if (self && isRange) {
        [self setupSlider];
    }
    
    return self;
}

- (void)setupSlider{
    CGFloat height = self.frame.size.height/2;
    firstSL = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, height)];
    firstSL.minimumTrackTintColor = [UIColor clearColor];
    firstSL.maximumTrackTintColor = [UIColor clearColor];
    [firstSL addTarget:self action:@selector(sliding:) forControlEvents:UIControlEventValueChanged];
    
    secSL = [[UISlider alloc] initWithFrame:CGRectMake(0, height, self.frame.size.width, height)];
    secSL.thumbTintColor = [UIColor clearColor];
    secSL.userInteractionEnabled = NO;
    
    [self addSubview:firstSL];
    [self addSubview:secSL];
}

- (void)sliding:(UISlider *)sender{
    secSL.value = firstSL.value;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code.
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线条样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    //设置线条粗细宽度
    CGContextSetLineWidth(context, 1.0);
    
    CGFloat space = [UIScreen mainScreen].bounds.size.width/17;
    
    //设置颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    
    for (int i = 0; i < 16; i++) {
        //开始一个起始路径
        CGContextBeginPath(context);
        //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
        CGContextMoveToPoint(context, i*space, self.frame.size.height/2);
        //设置下一个坐标点
        CGContextAddLineToPoint(context, i*space, 10);
        //连接上面定义的坐标点
        CGContextStrokePath(context);
    }
    
    if (tickNumbers) {
        UIFont  *font = [UIFont boldSystemFontOfSize:15.0];//设置
        
        for (id temp in tickNumbers) {
            NSInteger index = [tickNumbers indexOfObject:temp];
            [temp drawInRect:CGRectMake(index*space, 10, 20, 20) withAttributes:@{NSFontAttributeName:font}];
        }

    }
}

- (void)setupTickNumberWithItems:(NSArray *)items{
    tickNumbers = items;
    
    [self layoutIfNeeded];
}
@end
