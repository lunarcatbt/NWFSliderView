//
//  SliderTableViewCell.m
//  SomeTest
//
//  Created by 李威龙 on 16/1/14.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "SliderTableViewCell.h"

@implementation SliderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [_slider setupTickNumberWithItems:@[@"8",@"10",@"13",@"19",@"24"]];
    [_slider setMaximumTrackImage:[UIImage imageNamed:@"green"] forState:UIControlStateNormal];
    [_slider setMinimumTrackImage:[UIImage imageNamed:@"progress bar"] forState:UIControlStateNormal];
    [_slider setThumbImage:[UIImage imageNamed:@"Graduation"] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (UINib *)nib{
    return [UINib nibWithNibName:@"SliderTableViewCell" bundle:nil];
}
@end
