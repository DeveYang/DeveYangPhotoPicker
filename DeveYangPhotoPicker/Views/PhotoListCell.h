//
//  PhotoListCell.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageview1;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
