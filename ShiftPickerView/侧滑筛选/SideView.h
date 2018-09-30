//
//  SideView.h
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/30.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SideView;

@protocol SideViewDatasource <NSObject>

@required
-(NSInteger)numberOfSection:(SideView*)sideView ;///有几个区
-(NSInteger)sideView:(SideView*)sideView numberOfRowInSection:(NSInteger)section;//
-(NSString*)sideView:(SideView*)sideView titleForSection:(NSInteger)section;///区头标题
@optional
-(NSString*)sideView:(SideView*)sideView titleForRow:(NSIndexPath*)indexPath;

@end


NS_ASSUME_NONNULL_BEGIN

@interface SideView : UIView
-(instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic,strong,nullable)  id <SideViewDatasource>dataSource;
@end

NS_ASSUME_NONNULL_END
