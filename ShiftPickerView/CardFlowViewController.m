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
    
    
    view.dataArray= @[@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达",@"个人，个人个；二，个人报名v",@"哈哈",@"wVC【评论",@"热密封",@" 佛克润发热",@"w反而发客人",@"VC想，吗不想吃"];
    [self.view addSubview:view];
    
}

#pragma mark MHShiftPickerViewDatasource
-(NSInteger)numberOfTheColumn:(ShiftPickerView *)menuView{
    return self.dataArray.count;
}

-(NSInteger)menu:(ShiftPickerView *)menuView numberOfTheRowInColumns:(NSInteger)column{
    
    return self.dataArray.count;
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
