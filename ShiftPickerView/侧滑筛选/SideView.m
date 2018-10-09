//
//  SideView.m
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/30.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "SideView.h"
#import "MHFlowLayout.h"
#import "MHPickerViewCell.h"
#import "SideHeadReusableView.h"

#define  ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define  ScreenHeight  [[UIScreen mainScreen] bounds].size.height

#define WS(weakSelf)      __weak typeof(self) weakSelf = self
#define HeaderTag  999

@interface SideView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)  MHFlowLayout *mhFlowLayout;

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIButton *backGroundViewButton;
@property (nonatomic,strong) UIView *bottomView;

@end

@implementation SideView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backGroundViewButton];
        [self addSubview:self.collectionView];
        [self addSubview:self.bottomView];
    }
    
    return self;
}

-(UIButton*)backGroundViewButton{
    if (!_backGroundViewButton) {
        _backGroundViewButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _backGroundViewButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        [_backGroundViewButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backGroundViewButton;
    
}

-(UIView*)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(80, ScreenHeight-60, self.frame.size.width-80, 60)];
   
        UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        resetBtn.frame = CGRectMake(0, 0,(self.frame.size.width-80)/2, 50);
        [resetBtn addTarget:self action:@selector(resetData) forControlEvents:UIControlEventTouchUpInside];
        resetBtn.backgroundColor = [UIColor lightGrayColor];
        [resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        [resetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomView addSubview:resetBtn];
        
        UIButton *sureBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width-80)/2, 0, (self.frame.size.width-80)/2, 50)];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(sureData) forControlEvents:UIControlEventTouchUpInside];
        sureBtn.backgroundColor = [UIColor blueColor];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomView addSubview:sureBtn];
    
    }
    
    return _bottomView;
    
}

-(UICollectionView*)collectionView{
    if (!_collectionView) {
        self.mhFlowLayout = [[MHFlowLayout alloc] initWithType:MHCollectViewAlignLeft];
        self.mhFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 40);
        self.mhFlowLayout.headerReferenceSize = CGSizeMake(self.frame.size.width, 30);//区头大小
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(80, 0, ScreenWidth-80, ScreenHeight) collectionViewLayout:self.mhFlowLayout];
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.allowsMultipleSelection = YES;
        [_collectionView registerClass:[MHPickerViewCell class] forCellWithReuseIdentifier:@"MHPickerViewCell"];
   
        [_collectionView registerClass:[SideHeadReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SideHeadReusableView"];
    }
    
    return _collectionView;
    
}

#pragma  mark Action
-(void)backClick{
   
    [self dismiss];
    
}

-(void)resetData{

}


-(void)sureData{
    [self.delegate sideView:self didSelectedRowAtIndexpaths:self.collectionView.indexPathsForSelectedItems];
    [self dismiss];
}

-(void)dismiss{
    [UIView animateWithDuration:1
                     animations:^{
                         self.frame = CGRectMake(ScreenWidth, 0, 0, ScreenHeight);
                         
                     }];
}


#pragma mark UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.dataSource numberOfSection:self];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    SideHeadReusableView *view= [self.collectionView viewWithTag:HeaderTag + section];
    if ([self.dataSource sideView:self numberOfRowInSection:section]>6) {
        if (view.isShowAll) {
            return [self.dataSource sideView:self numberOfRowInSection:section];
            
        } else {
            return 6;
            
        }
    }
    
   return [self.dataSource sideView:self numberOfRowInSection:section];

    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MHPickerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MHPickerViewCell" forIndexPath:indexPath];
    cell.contentString = [self.dataSource sideView:self titleForRow:indexPath];
    return cell;
}
/// 区头
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SideHeadReusableView *headerView;
        if ([headerView viewWithTag:HeaderTag +indexPath.section]) {
            headerView = [collectionView viewWithTag:HeaderTag +indexPath.section];
        } else {
            headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SideHeadReusableView" forIndexPath:indexPath];

        }
        headerView.tag = HeaderTag+indexPath.section;
        headerView.titleLabel.text = [self.dataSource sideView:self titleForSection:indexPath.section];
        if (headerView.isShowAll) {
            [headerView.showAllBtn setTitle:@"收起" forState:UIControlStateNormal];
            headerView.arrowImageView.image = [UIImage imageNamed:@"jiantou_up"];
        } else {
            [headerView.showAllBtn setTitle:@"全部" forState:UIControlStateNormal];            headerView.arrowImageView.image = [UIImage imageNamed:@"jiantou_down"];

        }
        
        
        __weak typeof(headerView) weakHeader = headerView;

        headerView.moreBtnClick = ^(UIButton *btn) {
            weakHeader.isShowAll = !weakHeader.isShowAll;
            [UIView performWithoutAnimation:^{
                [collectionView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
            }];
        };
        
        
        return  headerView;
    } else {
       
        return nil;
     }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([self mh_stringSizeWithFont:[UIFont systemFontOfSize:17.0] str:[self.dataSource sideView:self titleForRow:indexPath] maxWidth:ScreenWidth maxHeight:30].width +30, 30);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (CGSize)mh_stringSizeWithFont:(UIFont *)font str:(NSString*)str maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight
{
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    CGSize maxSize = CGSizeMake(maxWidth, maxHeight);
    attr[NSFontAttributeName] = font;
    return [str boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size;
    
}
@end
