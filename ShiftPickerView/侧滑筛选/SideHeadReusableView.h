//
//  SideHeadReusableView.h
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/30.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SideHeadReusableView : UICollectionReusableView
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) void (^moreBtnClick)(UIButton *btn);
@property(nonatomic,assign) BOOL isShowAll;///是否显示全部
@property(nonatomic,strong) UIButton * showAllBtn;///全部按钮
@property(nonatomic,strong) UIImageView * arrowImageView;///箭头

@end

NS_ASSUME_NONNULL_END
