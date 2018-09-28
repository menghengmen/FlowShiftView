//
//  MHFlowCardLayout.m
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/28.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import "MHFlowCardLayout.h"

@implementation MHFlowCardLayout

///用来布局的初始化操作
-(void)prepareLayout{
    [super prepareLayout];
    self.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
    CGFloat margin = (self.collectionView.frame.size.width - self.itemSize.width) / 2;
    self.collectionView.contentInset =  UIEdgeInsetsMake(0, margin, 0, margin);
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

/**
  * 这个方法的返回值是一个数组（数组里面存放着rect范围内所有元素的布局属性）
  * 这个方法的返回值决定了rect范围内所有元素的排布（frame）
  */
//需要在viewController中使用上MHFlowCardLayout这个类后才能重写这个方法！！
-(NSArray<UICollectionViewLayoutAttributes*> *)layoutAttributesForElementsInRect:(CGRect)rect{
    /// 父类布局
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    ///
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width/2;
    /**
    * 1.一个cell对应一个UICollectionViewLayoutAttributes对象
    * 2.UICollectionViewLayoutAttributes对象决定了cell的frame
    */
    for (UICollectionViewLayoutAttributes * attri in arr) {
        CGFloat centerCha = ABS(attri.center.x - centerX);
        /// 缩放比例
        CGFloat scale = 1.1 - centerCha/self.collectionView.frame.size.width;
        
        attri.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return  arr;
}

/**
  * 这个方法的返回值，就决定了collectionView停止滚动时的偏移量
  */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    // 计算出最终显示的矩形框
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width *0.5;
    CGFloat minOffset = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes *attributes in arr) {
        if (ABS(minOffset)  > ABS(attributes.center.x - centerX)) {
            minOffset = attributes.center.x - centerX;
        }
    }
    proposedContentOffset.x += minOffset;
    return proposedContentOffset;
    
}
@end
