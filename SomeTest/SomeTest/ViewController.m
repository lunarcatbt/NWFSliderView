//
//  ViewController.m
//  SomeTest
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"
#import "NWFSliderTickView.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NWFSliderTickView *sliderView = [[NWFSliderTickView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 60) rangeOfSlider:YES];
    [sliderView setupTickNumberWithItems:@[@"1",@"10",@"15",@"20",@"24"]];
    
    [self.view addSubview:sliderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
