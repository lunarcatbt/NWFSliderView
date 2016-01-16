//
//  NWFSliderTickView.m
//  SomeTest
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "NWFSliderTickView.h"
#import "PopLabel.h"

@implementation NWFSliderTickView

{
    NSArray *tickNumbers;
    UIImageView *backImg;
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
    CGContextSetRGBStrokeColor(context, 59/255.f, 201/255.f, 114/255.f, 1.0);
    
    for (int i = 0; i < 17; i++) {
        //开始一个起始路径
        CGContextBeginPath(context);
        //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
        CGContextMoveToPoint(context, 10 + i*space, 20);
        //设置下一个坐标点
        CGContextAddLineToPoint(context, 10 + i*space, 30);
        //连接上面定义的坐标点
        CGContextStrokePath(context);
    }
    
    if (tickNumbers) {
        UIFont  *font = [UIFont boldSystemFontOfSize:15.0];//设置
        
        for (NSString *temp in tickNumbers) {
            NSInteger index = [tickNumbers indexOfObject:temp];
            
            NSInteger current = [tickNumbers[index] integerValue];
            NSInteger start = 8;
            
            [temp drawInRect:CGRectMake(0 + space*(current - start), 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
        }
        
//        [@"8" drawInRect:CGRectMake(0, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
//        [@"10" drawInRect:CGRectMake(0 + space*2, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
//        [@"15" drawInRect:CGRectMake(0 + space*7, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
//        [@"20" drawInRect:CGRectMake(0 + space*12, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
//        [@"24" drawInRect:CGRectMake(0 + space*16, 0, 20, 20) withAttributes:@{NSFontAttributeName:font}];
        
    }
}

- (void)setupTickNumberWithItems:(NSArray *)items{
    tickNumbers = items;
    
    [self layoutIfNeeded];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    [self configNumberView];
    
    return self;
}

- (void)awakeFromNib{
    [self configNumberView];
}

- (void)configNumberView{
    if (self) {
        _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, - 20, 40, 20)];
        _numLabel.text = @"0";
//        _numLabel.backgroundColor = [UIColor colorWithRed:59/255.f green:201/255.f blue:114/255.f alpha:1];
        _numLabel.backgroundColor = [UIColor clearColor];
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.textColor = [UIColor whiteColor];
        _numLabel.alpha = 0;
        
        backImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"remark"]];
        backImg.frame = _numLabel.frame;
        backImg.alpha = 0;

        [self addSubview:backImg];
        [self addSubview:_numLabel];
    }
}

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value{
    CGRect kRect = [super thumbRectForBounds:bounds trackRect:rect value:value];
    
    float stepValueInternal = self.frame.size.width/17;
    
    _numLabel.text = [self valueInt:roundf(kRect.origin.x / stepValueInternal)];
    _numLabel.transform = CGAffineTransformMakeTranslation(kRect.origin.x, 0);
    backImg.transform = CGAffineTransformMakeTranslation(kRect.origin.x, 0);

    if(stepValueInternal > 0)
    {
        kRect = CGRectMake(roundf(kRect.origin.x / stepValueInternal) * stepValueInternal - 4, kRect.origin.y + 10, kRect.size.width , kRect.size.height) ;
    }
    
    return kRect;
}

- (NSString *)valueInt:(CGFloat)value{
    return [[NSString stringWithFormat:@"%d",(int)value + 8] stringByAppendingString:@"%"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    self.numLabel.alpha = 1.f;
    backImg.alpha = self.numLabel.alpha;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.numLabel.alpha = 0;
        backImg.alpha = self.numLabel.alpha;
    }];
    
}
@end
