//
//  ShiftPickerView.m
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/27.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "ShiftPickerView.h"
#import "MHFlowLayout.h"
#import "MHFlowCardLayout.h"
#import "MHPickerViewCell.h"
#import  <Masonry/Masonry.h>

#define  ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define WS(weakSelf)      __weak typeof(self) weakSelf = self
#define ButtonTag  10086
@interface ShiftPickerView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)  UICollectionView *collectionView;
@property (nonatomic,strong)  MHFlowLayout *mhFlowLayout;
@property (nonatomic,strong)  MHFlowCardLayout *cardLayout;
@property (nonatomic,assign)  NSInteger  numberOfColumn;///列数
@property (nonatomic,assign)  NSInteger  currentSelectedColumn;///选中的列数

@property (nonatomic, strong) UIButton *backgroundViewBtn;//灰色背景
@property (nonatomic, strong) UIWindow *window;//
@property (nonatomic, strong) UIView *bottomView;///底部视图
@property (nonatomic, assign) BOOL   isShow;///是否打开

@end

@implementation ShiftPickerView

#pragma mark lazy init
-(UICollectionView*)collectionView{
    if (!_collectionView) {
        self.mhFlowLayout = [[MHFlowLayout alloc] initWithType:MHCollectViewAlignLeft];
        self.mhFlowLayout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout: self.mhFlowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
        _collectionView.allowsMultipleSelection = YES;
        [_collectionView registerClass:[MHPickerViewCell class] forCellWithReuseIdentifier:@"MHPickerViewCell"];
    }
    
    return _collectionView;
}

-(UIButton*)backgroundViewBtn{
    if (!_backgroundViewBtn) {
        _backgroundViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroundViewBtn.userInteractionEnabled = YES;
        _backgroundViewBtn.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.f];
        _backgroundViewBtn.opaque = NO;
        [_backgroundViewBtn addTarget:self action:@selector(backgroundViewDidTap) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundViewBtn;
}

-(UIView*)bottomView{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.frame = CGRectMake(0, 350, ScreenWidth, 50);
        
        UIButton *resetBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/2, 50)];
        [resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        resetBtn.backgroundColor = [UIColor lightGrayColor];
        [_bottomView addSubview:resetBtn];
        
        UIButton *sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2, 0, ScreenWidth/2, 50)];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        sureBtn.backgroundColor = [UIColor greenColor];
        [_bottomView addSubview:sureBtn];
        
    }
    return _bottomView;
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _currentSelectedColumn = 0;
        self.window = [UIApplication sharedApplication].keyWindow;
    }
    return self;
}

# pragma mark 数据源方法
-(void)setDataSource:(id<MHShiftPickerViewDatasource>)dataSource{
    _dataSource = dataSource;
    _numberOfColumn = [self.dataSource numberOfTheColumn:self];///列数
    CGFloat  btnWidth = ScreenWidth/_numberOfColumn;
    
    for (int index = 0; index <_numberOfColumn; index ++) {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.frame = CGRectMake(btnWidth *index, 0, btnWidth-0.5, 50);
        [titleBtn setTitle:[self.dataSource menu:self titleInColumns:index] forState:UIControlStateNormal];
        titleBtn.backgroundColor = [UIColor whiteColor];
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [titleBtn setImage:[UIImage imageNamed:@"jiantou_down"] forState:UIControlStateNormal];
        [titleBtn setImage:[UIImage imageNamed:@"jiantou_up"] forState:UIControlStateSelected];
        [titleBtn addTarget:self action:@selector(titleButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        titleBtn.tag = ButtonTag+index;
        [self addSubview:titleBtn];
        
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.frame = CGRectMake(titleBtn.frame.origin.x + titleBtn.frame.size.width, titleBtn.frame.origin.y + 10, 1, titleBtn.frame.size.height - 20);
        [self addSubview:lineView];
        
    }
    
    
}

#pragma mark Action
///dismiss
-(void)backgroundViewDidTap{
    [self animationWithButton:nil backgroundView:self.backgroundViewBtn collection:self.collectionView isShow:NO];
}



///弹出
-(void)titleButtonDidClick:(UIButton*)sender{
    [self.collectionView reloadData];
    self.currentSelectedColumn = sender.tag -ButtonTag;
    sender.selected = YES;

    [self animationWithButton:sender backgroundView:self.backgroundViewBtn collection:self.collectionView isShow:YES];
}

#pragma matk AnimationMethod
-(void)animationWithButton:(UIButton*)btn backgroundView:(UIView*)backgroundView
                collection:(UICollectionView*)collectionView isShow:(BOOL)isShow{
    [self animationWithBackground:backgroundView isShow:isShow];
    
}

-(void)animationWithBackground:(UIView*)background isShow:(BOOL)isShow{
    WS(weakSelf);

    if (isShow == YES) {
        [self.window addSubview:background];
        [background addSubview:self.collectionView];
        [background mas_makeConstraints:^(MASConstraintMaker *make) {
            CGRect rect = [weakSelf convertRect:weakSelf.bounds toView:weakSelf.window];
            make.top.mas_equalTo(CGRectGetMaxY(rect));
            make.left.right.bottom.equalTo(weakSelf.window);
        }];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(background);
            make.height.mas_equalTo(400);
        }];
        [background addSubview:self.bottomView];
        [UIView animateWithDuration:0
                         animations:^{
                             background.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];

                         }];
    
    } else {
        
        [UIView animateWithDuration:0 animations:^{
            background.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        } completion:^(BOOL finished) {
            [background removeFromSuperview];
        }];
        
        
    }
    
    
}


#pragma mark UICollectionDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataSource menu:self numberOfTheRowInColumns:self.currentSelectedColumn];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MHPickerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MHPickerViewCell" forIndexPath:indexPath];
    cell.contentString = [self.dataSource menu:self titleForAtIndexPath:indexPath forInColumn:self.currentSelectedColumn];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *titleStr = [self.dataSource menu:self titleForAtIndexPath:indexPath forInColumn:self.currentSelectedColumn];
    return CGSizeMake([self mh_stringSizeWithFont:[UIFont systemFontOfSize:17.0] str:titleStr maxWidth:ScreenWidth maxHeight:30].width +30, 30);
        
    
}

- (CGSize)mh_stringSizeWithFont:(UIFont *)font str:(NSString*)str maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight
{
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    CGSize maxSize = CGSizeMake(maxWidth, maxHeight);
    attr[NSFontAttributeName] = font;
    return [str boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.dalegate menu:self didSelectRowAtIndexPath:indexPath.item];
}

@end
