//
//  ViewController.m
//  SomeTest
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"
#import "NWFSliderTickView.h"
#import "NWFRangeSliderView.h"
#import "SliderTableViewCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NWFSliderTickView *sliderView = [[NWFSliderTickView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH - 10, 60)];
//    [sliderView setupTickNumberWithItems:@[@"8",@"10",@"15",@"20",@"24"]];
//    [sliderView setValue:0];
//    
//    [self.view addSubview:sliderView];
//    
    NMRangeSlider *rangeSLView = [[NMRangeSlider alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT - 200, SCREEN_WIDTH - 20, 80)];
    [rangeSLView setupTickNumberWithItems:@[@"1",@"4",@"9",@"12",@"15",@"18",@"24"]];
    [rangeSLView setLowerHandleImageNormal:[UIImage imageNamed:@"Graduation"]];
    [rangeSLView setLowerHandleImageHighlighted:[UIImage imageNamed:@"Graduation"]];
    [rangeSLView setTrackBackgroundImage:[UIImage imageNamed:@"progress bar"]];
    [rangeSLView setTrackImage:[UIImage imageNamed:@"green"]];
    
    [self.view addSubview:rangeSLView];

    [self.mainTable registerNib:[SliderTableViewCell nib] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SliderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
@end
