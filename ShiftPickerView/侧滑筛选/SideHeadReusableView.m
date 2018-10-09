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

    UIButton *moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width/2, 10, self.bounds.size.width/2-14, self.bounds.size.height)];
    [moreBtn setTitle:@"全部" forState:UIControlStateNormal];
    [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    moreBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
   // moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [moreBtn addTarget:self action:@selector(clickMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreBtn];
    self.showAllBtn = moreBtn;

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width-14, 20, 14, 10)];
    imageView.image = [UIImage imageNamed:@"jiantou_down"];
    [self addSubview:imageView];
    self.arrowImageView = imageView;

}

-(void)clickMoreBtn:(UIButton*)sender{
    
    self.moreBtnClick(sender);
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
