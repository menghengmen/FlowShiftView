//
//  CardFlowViewController.m
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/28.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "CardFlowViewController.h"
#import "ShiftPickerView.h"
@interface CardFlowViewController ()

@end

@implementation CardFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"卡片式";
    self.view.backgroundColor = [UIColor whiteColor];
    ShiftPickerView *view = [[ShiftPickerView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200)];
    view.dataArray= @[@"wdf",@"werfdsdf",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg"];
    [self.view addSubview:view];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
