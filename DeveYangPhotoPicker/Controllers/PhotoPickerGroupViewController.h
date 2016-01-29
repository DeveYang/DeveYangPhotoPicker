//
//  PhotoPickerGroupViewController.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoPickerViewController.h"

@interface PhotoPickerGroupViewController : UIViewController
@property (nonatomic , weak) id<PhotoPickerViewControllerDelegate> delegate;
@property (nonatomic , assign) PickerViewShowStatus status;
@property (nonatomic , assign) NSInteger maxCount;
// 记录选中的值
@property (strong,nonatomic) NSArray *selectAsstes;
// 置顶展示图片
@property (assign,nonatomic) BOOL topShowPhotoPicker;
@end
