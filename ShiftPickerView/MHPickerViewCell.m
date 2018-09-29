//
//  MHPickerViewCell.m
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/27.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "MHPickerViewCell.h"
#import <Masonry/Masonry.h>
#define WS(weakSelf)      __weak typeof(self) weakSelf = self
#define MHRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

@interface MHPickerViewCell()

@end

@implementation MHPickerViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self viewConfig];
    }
    return self;
}

- (void)viewConfig
{
    WS(weakSelf);
    self.label = [[UILabel alloc] init];
    self.label.layer.cornerRadius = 5;
    self.label.layer.masksToBounds = YES;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
}

-(void)setContentString:(NSString *)contentString{
    _contentString = contentString;
    self.label.text = contentString;
    
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    _label.backgroundColor = selected?MHRGBAColor(43, 100, 255, 1) :[UIColor lightGrayColor];
    _label.textColor = selected?[UIColor whiteColor] :[UIColor blackColor];
    
}
@end
