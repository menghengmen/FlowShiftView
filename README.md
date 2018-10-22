# FlowShiftView
瀑布流标签筛选框

![gif图](https://github.com/menghengmen/FlowShiftView/blob/master/gif5%E6%96%B0%E6%96%87%E4%BB%B6.gif)  

##  使用 （侧滑筛选）
SideView的协议方法
```objc
@protocol SideViewDatasource <NSObject>

@required
-(NSInteger)numberOfSection:(SideView*)sideView ;///有几个区
-(NSInteger)sideView:(SideView*)sideView numberOfRowInSection:(NSInteger)section;//
-(NSString*)sideView:(SideView*)sideView titleForSection:(NSInteger)section;///区头标题
@optional
-(NSString*)sideView:(SideView*)sideView titleForRow:(NSIndexPath*)indexPath;

@end
```
在VC里面遵循SideViewDatasource，而协议里边的方法都是用`@required`修饰的，所以必须要实现它
```objc
self.titleArray = [NSMutableArray arrayWithObjects:@"品牌",@"折扣和服务",@"发货地", nil];
  NSArray *allArr = @[@"全部",@"甜点饮品",@"生日蛋糕",@"火锅",@"自助餐",@"日韩料理",@"麻辣烫"];
        NSArray *nearlyArr = @[@"1km",@"1km--5km",@"5km--10km",@"5km--10km",@"10km--20km",@"20km--30km",@"30km--50km"];
        NSArray *teliarr = @[@"1打卡呈现出现在重新操作 车车现场现场",@"2没",@"3大神啊大",@"4防盗门个，地方",@"5卡拉曼达",@"6个人，个人个；二，个人报名v",@"7哈哈",@"8wVC【评论",@"9热密封",@"10佛克润发热",@"11w反而发客人",@"12VC想，吗不想吃",@"13打卡呈现出现在重新操作 车车现场现场",@"14没",@"15大神啊大",@"16打卡呈现出现在重新操作 车车现场现场",@"17没",@"18大神啊大",@"19防盗门个，地方",@"20卡拉曼达"];
     
 self.dataArray = [NSMutableArray arrayWithObjects:allArr,nearlyArr,teliarr,nil];

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
```
##  使用 （下拉筛选）
ShiftPickerView的协议方法
```objc
@protocol MHShiftPickerViewDatasource <NSObject>
@required
-(NSInteger)numberOfTheColumn:(ShiftPickerView*)menuView;///列数
-(NSInteger)menu:(ShiftPickerView*)menuView numberOfTheRowInColumns:(NSInteger)column;///该列下有几行
-(NSString*)menu:(ShiftPickerView*)menuView  titleInColumns:(NSInteger)column;///该列的标题
@optional
-(NSString*)menu:(ShiftPickerView*)menuView titleForAtIndexPath:(NSIndexPath*)indexPath  forInColumn:(NSInteger)column;///该列下行的标题
@end

@protocol MHShiftPickerViewDelegate <NSObject>
@optional
-(void)menu:(ShiftPickerView*)menuView didSelectRowAtIndexPath:(NSInteger)indexPath;///单选
-(void)menu:(ShiftPickerView*)menuView didSelectRowAtIndexPaths:(NSArray*)indexPaths withColumn:(NSInteger)column;///多选


@end

```
在VC里面遵循MHShiftPickerViewDatasource，MHShiftPickerViewDelegate，而协议里边的方法都是用`@required`修饰的，所以必须要实现它：
```objc

 self.titleArray = [NSMutableArray arrayWithObjects:@"全部",@"附近",@"智能", nil];
 NSArray *allArr = @[@"全部",@"甜点饮品",@"生日蛋糕",@"火锅",@"自助餐",@"日韩料理"];
        NSArray *nearlyArr = @[@"1km",@"1km--5km",@"5km--10km",@"5km--10km",@"10km--20km",@"20km--30km",@"30km--50km"];
        NSArray *teliarr = @[@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达",@"个人，个人个；二，个人报名v",@"哈哈",@"wVC【评论",@"热密封",@" 佛克润发热",@"w反而发客人",@"VC想，吗不想吃",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"打卡呈现出现在重新操作 车车现场现场",@"没",@"大神啊大",@"防盗门个，地方",@"卡拉曼达"];

self.dataArray = [NSMutableArray arrayWithObjects:allArr,nearlyArr,teliarr,nil];

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
```
