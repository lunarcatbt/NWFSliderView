//
//  NWFSliderTickView.h
//  SomeTest
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NWFSliderTickView : UIView

- (instancetype)initWithFrame:(CGRect)frame rangeOfSlider:(BOOL)isRange;

- (void)setupTickNumberWithItems:(NSArray *)items;

@end
