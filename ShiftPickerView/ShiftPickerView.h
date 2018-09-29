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
@optional
-(NSString*)menu:(ShiftPickerView*)menuView titleForAtIndexPath:(NSIndexPath*)indexPath  forInColumn:(NSInteger)column;///该列下行的标题
@end

@protocol MHShiftPickerViewDelegate <NSObject>
@optional
-(void)menu:(ShiftPickerView*)menuView didSelectRowAtIndexPath:(NSInteger)indexPath;///单选

@end


@interface ShiftPickerView : UIView
@property   (nonatomic,assign)   MHFlowType type;
@property   (nonatomic,weak,nullable)  id<MHShiftPickerViewDatasource>dataSource;
@property   (nonatomic,weak,nullable)  id<MHShiftPickerViewDelegate>dalegate;

-(instancetype)initWithFrame:(CGRect)frame;
@end
