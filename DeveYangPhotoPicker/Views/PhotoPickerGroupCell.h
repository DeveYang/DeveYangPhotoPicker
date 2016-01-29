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
 *  赋值cell
 */
@property (nonatomic , strong) PhotoPickerGroup *group;
@end
