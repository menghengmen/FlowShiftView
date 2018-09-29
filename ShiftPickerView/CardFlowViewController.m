//
//  CardFlowViewController.m
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/28.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "CardFlowViewController.h"
#import "ShiftPickerView.h"
@interface CardFlowViewController ()<MHShiftPickerViewDatasource,MHShiftPickerViewDelegate>
@property  (nonatomic, nonnull,strong) NSMutableArray *titleArray;
@property  (nonatomic,nonnull,strong)  NSMutableArray *dataArray;
@end

@implementation CardFlowViewController

-(NSMutableArray*)titleArray{
    if (!_titleArray) {
        _titleArray = [NSMutableArray arrayWithObjects:@"全部",@"附近",@"智能", nil];
    }
    
    return _titleArray;
}

-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        NSArray *allArr = @[@"全部",@"甜点饮品",@"生日蛋糕",@"火锅",@"自助餐",@"日韩料理"];
        NSArray *nearlyArr = @[@"1km",@"1km--5km",@"5km--10km",@"5km--10km",@"10km--20km",@"20km--30km"];
        NSArray *teliarr = @[@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达",@"个人，个人个；二，个人报名v",@"哈哈",@"wVC【评论",@"热密封",@" 佛克润发热",@"w反而发客人",@"VC想，吗不想吃",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达",@"个人，个人个；二，个人报名v",@"哈哈",@"wVC【评论",@"热密封",@" 佛克润发热",@"w反而发客人",@"VC想，吗不想吃",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达",@"个人，个人个；二，个人报名v",@"哈哈",@"wVC【评论",@"热密封",@" 佛克润发热",@"w反而发客人",@"VC想，吗不想吃",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达",@"个人，个人个；二，个人报名v",@"哈哈",@"wVC【评论",@"热密封",@" 佛克润发热",@"w反而发客人",@"VC想，吗不想吃",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达",@"个人，个人个；二，个人报名v",@"哈哈",@"wVC【评论",@"热密封",@" 佛克润发热",@"w反而发客人",@"VC想，吗不想吃",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大"];

        _dataArray = [NSMutableArray arrayWithObjects:allArr,nearlyArr,teliarr,nil];
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
    view.delegate = self;
    [self.view addSubview:view];
    
}

#pragma mark MHShiftPickerViewDatasource
-(NSInteger)numberOfTheColumn:(ShiftPickerView *)menuView{
    return self.titleArray.count;
}

-(NSInteger)menu:(ShiftPickerView *)menuView numberOfTheRowInColumns:(NSInteger)column{
    
    return [self.dataArray[column] count];
}

-(NSString*)menu:(ShiftPickerView *)menuView titleForAtIndexPath:(NSIndexPath *)indexPath forInColumn:(NSInteger)column{
    
    return self.dataArray[column][indexPath.row];
}

-(NSString*)menu:(ShiftPickerView *)menuView titleInColumns:(NSInteger)column{
    return self.titleArray[column];
}

#pragma mark MHShiftPickerViewDelegate
-(void)menu:(ShiftPickerView *)menuView didSelectRowAtIndexPath:(NSInteger)indexPath{
    
    NSLog(@"%ld",(long)indexPath);
}

-(void)menu:(ShiftPickerView *)menuView didSelectRowAtIndexPaths:(NSArray *)indexPaths withColumn:(NSInteger)column{
    for (NSIndexPath *index in indexPaths) {
        NSLog(@"%@", self.dataArray[column][(long)index.row ]);
    }
    
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
