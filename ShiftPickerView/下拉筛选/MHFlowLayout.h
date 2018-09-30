//
//  MHFlowLayout.h
//  ShiftPickerView
//
//  Created by 哈哈 on 2018/9/27.
//  Copyright © 2018年 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>
//collectionview对其方式
typedef NS_ENUM(NSInteger, MHPickerCollectViewAlignType) {
    MHCollectViewAlignLeft,
    MHCollectViewAlignMiddle,
    MHCollectViewAlignRight,
};
@interface MHFlowLayout : UICollectionViewFlowLayout
@property   (nonatomic,readonly)   MHPickerCollectViewAlignType alignType;
-(instancetype)initWithType:(MHPickerCollectViewAlignType)type;
@end
