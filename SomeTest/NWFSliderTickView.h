//
//  NWFSliderTickView.h
//  SomeTest
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NWFSliderTickView : UISlider

@property (nonatomic,assign) CGFloat xPosition;
@property (nonatomic,strong) UILabel *numLabel;

- (void)setupTickNumberWithItems:(NSArray *)items;

@end
