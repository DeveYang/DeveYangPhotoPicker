//
//  PhotoPickerAssetsViewController.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoPickerGroupViewController.h"
@class PhotoPickerGroup;
@interface PhotoPickerAssetsViewController : UIViewController
@property (weak , nonatomic) PhotoPickerGroupViewController *groupVc;
@property (nonatomic , assign) PickerViewShowStatus status;
@property (nonatomic , strong) PhotoPickerGroup *assetsGroup;
@property (nonatomic , assign) NSInteger maxCount;
// 需要记录选中的值的数据
@property (strong,nonatomic) NSArray *selectPickerAssets;
// 置顶展示图片
@property (assign,nonatomic) BOOL topShowPhotoPicker;
@end
