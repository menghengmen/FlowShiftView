//
//  SideViewController.m
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/30.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "SideViewController.h"
#import "SideView.h"
#define  ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define  ScreenHeight  [[UIScreen mainScreen] bounds].size.height

@interface SideViewController ()<SideViewDatasource,SideViewDelegate>
@property (nonatomic,strong) SideView  *sideView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *titleArray;

@end

@implementation SideViewController

-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        NSArray *allArr = @[@"全部",@"甜点饮品",@"生日蛋糕",@"火锅",@"自助餐",@"日韩料理"];
        NSArray *nearlyArr = @[@"1km",@"1km--5km",@"5km--10km",@"5km--10km",@"10km--20km",@"20km--30km",@"30km--50km"];
        NSArray *teliarr = @[@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达",@"个人，个人个；二，个人报名v",@"哈哈",@"wVC【评论",@"热密封",@" 佛克润发热",@"w反而发客人",@"VC想，吗不想吃",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达"];
        
        _dataArray = [NSMutableArray arrayWithObjects:allArr,nearlyArr,teliarr,nil];
    }
    return _dataArray;
    
}

-(NSMutableArray*)titleArray{
    if (!_titleArray) {
        _titleArray = [NSMutableArray arrayWithObjects:@"品牌",@"折扣和服务",@"发货地", nil];
    }
    
    return  _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)drag:(UIButton *)sender {
    SideView *side = [[SideView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    side.dataSource = self;
    side.delegate = self;
    [self.view addSubview:side];
}

#pragma  mark SideViewDatasource
-(NSInteger)numberOfSection:(SideView *)sideView{
    return self.dataArray.count;
}

-(NSInteger)sideView:(SideView *)sideView numberOfRowInSection:(NSInteger)section{
    
    return [self.dataArray[section] count];
}

-(NSString*)sideView:(SideView *)sideView titleForSection:(NSInteger)section{
    
    return self.titleArray[section];
}

-(NSString*)sideView:(SideView *)sideView titleForRow:(NSIndexPath *)indexPath{
    
    return self.dataArray[indexPath.section][indexPath.row];
}

#pragma mark SideViewDelegate
-(void)sideView:(SideView *)sideView didSelectedRowAtIndexpaths:(NSArray *)indexPatns{
    for (NSIndexPath *path in indexPatns) {
        NSLog(@"%@",self.dataArray[path.section][path.row]);
    }
    
}


@end
