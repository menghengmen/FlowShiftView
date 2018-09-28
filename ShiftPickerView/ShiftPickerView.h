//
//  ShiftPickerView.h
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/27.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShiftPickerView;

typedef NS_ENUM(NSUInteger,MHFlowType) {
    MHFlowTypeCard = 0,///卡片式
    MHFlowTypeFlow, ///流水式
};

@protocol MHShiftPickerViewDatasource <NSObject>

@required
-(NSInteger)numberOfTheColumn:(ShiftPickerView*)menuView;///列数
-(NSInteger)menu:(ShiftPickerView*)menuView numberOfTheRowInColumns:(NSInteger)column;///该列下有几行
-(NSString*)menu:(ShiftPickerView*)menuView  titleInColumns:(NSInteger)column;///该列的标题
@end



@interface ShiftPickerView : UIView
@property   (nonatomic,strong)   NSMutableArray *dataArray;
@property   (nonatomic,assign)   MHFlowType type;
@property   (nonatomic,weak,nullable)  id<MHShiftPickerViewDatasource>dataSource;

-(instancetype)initWithFrame:(CGRect)frame;
@end
