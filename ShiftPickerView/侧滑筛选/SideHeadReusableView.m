//
//  SideHeadReusableView.m
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/30.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "SideHeadReusableView.h"

@implementation SideHeadReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

-(void)config{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.bounds.size.width/2, self.bounds.size.height)];
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
