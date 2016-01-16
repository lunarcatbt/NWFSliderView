//
//  NWFRangeSliderView.h
//  SomeTest
//
//  Created by 李威龙 on 16/1/13.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMRangeSlider.h"

@interface NWFRangeSliderView : UIView


@property (nonatomic, strong) NMRangeSlider *rangeSL;

- (void)setupTickNumberWithItems:(NSArray *)items;

@end
