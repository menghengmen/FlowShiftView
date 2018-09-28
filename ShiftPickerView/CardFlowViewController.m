//
//  CardFlowViewController.m
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/28.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "CardFlowViewController.h"
#import "ShiftPickerView.h"
@interface CardFlowViewController ()<MHShiftPickerViewDatasource>
@property  (nonatomic, nonnull,strong) NSMutableArray *dataArray;
@end

@implementation CardFlowViewController

-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"全部",@"附近",@"智能", nil];
    }
    
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"卡片式";
    self.view.backgroundColor = [UIColor whiteColor];
    ShiftPickerView *view = [[ShiftPickerView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];
    view.type = MHFlowTypeFlow;
    view.dataSource = self;
    
    
    view.dataArray= @[@"wdf",@"werfdsdf",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg",@"wefg"];
    [self.view addSubview:view];
    
}

#pragma mark MHShiftPickerViewDatasource
-(NSInteger)numberOfTheColumn:(ShiftPickerView *)menuView{
    return self.dataArray.count;
}

-(NSInteger)menu:(ShiftPickerView *)menuView numberOfTheRowInColumns:(NSInteger)column{
    
    return 10;
}

-(NSString*)menu:(ShiftPickerView *)menuView titleInColumns:(NSInteger)column{
    return self.dataArray[column];
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
