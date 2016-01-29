//
//  PhotoPickerViewController.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>
//回调
typedef void(^completionBlock) (id obj);
@class PhotoPickerViewController;
// 状态组
typedef NS_ENUM(NSInteger , PickerViewShowStatus) {
    PickerViewShowStatusGroup = 0, // default groups .
    PickerViewShowStatusCameraRoll ,
    PickerViewShowStatusSavePhotos ,
    PickerViewShowStatusPhotoStream ,
    PickerViewShowStatusVideo,
};
@protocol PhotoPickerViewControllerDelegate <NSObject>
/**
 *  返回所有的Asstes对象
 */
- (void)pickerViewControllerDoneAsstes:(NSArray *)assets;
/**
 *  点击拍照
 */
@optional
- (void)pickerCollectionViewSelectCamera:(PhotoPickerViewController *)pickerVc withImage:(UIImage *)image;

@end
@interface PhotoPickerViewController : UIViewController
@property (nonatomic , weak) id<PhotoPickerViewControllerDelegate>delegate;
// 决定你是否需要push到内容控制器, 默认显示组
@property (nonatomic , assign) PickerViewShowStatus status;
// 可以用代理来返回值或者用block来返回值
@property (nonatomic , copy) completionBlock callBack;
// 每次选择图片的最小数, 默认与最大数是9
@property (nonatomic , assign) NSInteger maxCount;
// 记录选中的值
@property (strong,nonatomic) NSArray *selectPickers;
// 置顶展示图片
@property (assign,nonatomic) BOOL topShowPhotoPicker;
// 展示控制器
- (void)showPickerVc:(UIViewController *)vc;
@end
