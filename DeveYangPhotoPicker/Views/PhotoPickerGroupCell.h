//
//  PhotoPickerGroupCell.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoPickerGroup;

@interface PhotoPickerGroupCell : UITableViewCell
/**
 *  声明一个相册列表模型
 */
@property (nonatomic , strong) PhotoPickerGroup *group;
@end
