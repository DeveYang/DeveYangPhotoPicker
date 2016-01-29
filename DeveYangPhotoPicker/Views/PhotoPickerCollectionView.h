//
//  PhotoPickerCollectionView.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoAssets.h"
// 展示状态
typedef NS_ENUM(NSUInteger, PickerCollectionViewShowOrderStatus){
    PickerCollectionViewShowOrderStatusTimeDesc = 0, // 升序
    PickerCollectionViewShowOrderStatusTimeAsc // 降序
};
@class PhotoPickerCollectionView;
@protocol PhotoPickerCollectionViewDelegate <NSObject>
// 选择相片就会调用
- (void) pickerCollectionViewDidSelected:(PhotoPickerCollectionView *) pickerCollectionView deleteAsset:(PhotoAssets *)deleteAssets;

// 点击拍照就会调用
- (void)pickerCollectionViewDidCameraSelect:(PhotoPickerCollectionView *) pickerCollectionView;

@end
@interface PhotoPickerCollectionView : UICollectionView<UICollectionViewDelegate>
// scrollView滚动的升序降序
@property (nonatomic , assign) PickerCollectionViewShowOrderStatus status;
// 保存所有的数据
@property (nonatomic , strong) NSArray *dataArray;
// 保存选中的图片
@property (nonatomic , strong) NSMutableArray *selectAssets;
// 最后保存的一次图片
@property (strong,nonatomic) NSMutableArray *lastDataArray;
// delegate
@property (nonatomic , weak) id <PhotoPickerCollectionViewDelegate> collectionViewDelegate;
// 限制最大数
@property (nonatomic , assign) NSInteger maxCount;
// 置顶展示图片
@property (assign,nonatomic) BOOL topShowPhotoPicker;
// 选中的索引值，为了防止重用
@property (nonatomic , strong) NSMutableArray *selectsIndexPath;
// 记录选中的值
@property (assign,nonatomic) BOOL isRecoderSelectPicker;
@end
