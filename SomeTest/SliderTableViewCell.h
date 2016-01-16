//
//  SliderTableViewCell.h
//  SomeTest
//
//  Created by 李威龙 on 16/1/14.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NWFSliderTickView.h"

@interface SliderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NWFSliderTickView *slider;

+ (UINib *)nib;

@end
