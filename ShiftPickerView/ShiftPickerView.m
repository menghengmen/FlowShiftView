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

@interface ShiftPickerView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)  UICollectionView *collectionView;
@property (nonatomic,strong)  MHFlowLayout *mhFlowLayout;
@property (nonatomic,strong)  MHFlowCardLayout *cardLayout;

@end

@implementation ShiftPickerView

#pragma mark lazy init
-(UICollectionView*)collectionView{
    if (!_collectionView) {
       // self.mhFlowLayout = [[MHFlowLayout alloc] initWithType:MHCollectViewAlignLeft];
       // self.mhFlowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 30, 40);
       
        self.cardLayout = [[MHFlowCardLayout alloc] init];
        self.cardLayout.itemSize = CGSizeMake(200, 200);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.cardLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MHPickerViewCell class] forCellWithReuseIdentifier:@"MHPickerViewCell"];
    }
    
    return _collectionView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUi];
    }
    return self;
}

-(void)setUpUi{
    [self addSubview:self.collectionView];
    
}

#pragma mark UICollectionDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MHPickerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MHPickerViewCell" forIndexPath:indexPath];
    cell.contentString = self.dataArray[indexPath.row];
    
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *titleStr = self.dataArray[indexPath.row];
//    return CGSizeMake([self mh_stringSizeWithFont:[UIFont systemFontOfSize:13.0] str:titleStr maxWidth:10000 maxHeight:30].width +30, 30);
//
//}

- (CGSize)mh_stringSizeWithFont:(UIFont *)font str:(NSString*)str maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight
{
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    CGSize maxSize = CGSizeMake(maxWidth, maxHeight);
    attr[NSFontAttributeName] = font;
    return [str boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size;
    
}
@end
