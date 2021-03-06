//
//  PhotoPickerCommon.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#ifndef PhotoPickerCommon_h
#define PhotoPickerCommon_h
// 点击销毁的block
typedef void(^PickerBrowserViewControllerTapDisMissBlock)(NSInteger);

// 点击View执行的动画
typedef NS_ENUM(NSUInteger, UIViewAnimationAnimationStatus) {
    UIViewAnimationAnimationStatusZoom = 0, // 放大缩小
    UIViewAnimationAnimationStatusFade , // 淡入淡出
};

// 图片最多显示9张，超过9张取消单击事件
static NSInteger const KPhotoShowMaxCount = 9;

#define iOS7gt ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// ScrollView 滑动的间距
static CGFloat const PickerColletionViewPadding = 10;

// ScrollView拉伸的比例
static CGFloat const PickerScrollViewMaxZoomScale = 3.0;
static CGFloat const PickerScrollViewMinZoomScale = 1.0;

// 进度条的宽度/高度
static NSInteger const PickerProgressViewW = 50;
static NSInteger const PickerProgressViewH = 50;

// 分页控制器的高度
static NSInteger const PickerPageCtrlH = 25;

// NSNotification
static NSString *PICKER_TAKE_DONE = @"PICKER_TAKE_DONE";
static NSString *PICKER_TAKE_PHOTO = @"PICKER_TAKE_PHOTO";

static NSString *PICKER_PowerBrowserPhotoLibirayText = @"您屏蔽了选择相册的权限，开启请去系统设置->隐私->我的App来打开权限";


#endif /* PhotoPickerCommon_h */
