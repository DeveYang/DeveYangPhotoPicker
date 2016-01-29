//
//  PhotoPickerGroupCell.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//  相册列表Cell

#import "PhotoPickerGroupCell.h"
#import "PhotoPickerGroup.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoPickerGroupCell()
@property(nonatomic, weak)UIImageView  *groupImageView;
@property(nonatomic, weak)UILabel  *groupNameLabel;
@property(nonatomic, weak)UILabel  *groupPicCountLabel;

@end
@implementation PhotoPickerGroupCell
//列表图片
- (UIImageView *)groupImageView{
    if (!_groupImageView) {
        UIImageView *groupImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 70, 70)];
        groupImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.groupImageView = groupImageView;
        [self.contentView addSubview:_groupImageView];
    }
    return _groupImageView;
}
//名字
- (UILabel *)groupNameLabel{
    if (!_groupNameLabel) {
        UILabel *groupNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(95, 15, self.frame.size.width - 100, 20)];
        self.groupNameLabel = groupNameLabel;
        [self.contentView addSubview:_groupNameLabel];
    }
    return _groupNameLabel;
}
//个数
- (UILabel *)groupPicCountLabel{
    if (!_groupPicCountLabel) {
        UILabel *groupPicCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(95, 40, self.frame.size.width - 100, 20)];
        groupPicCountLabel.font = [UIFont systemFontOfSize:13];
        groupPicCountLabel.textColor = [UIColor lightGrayColor];
        self.groupPicCountLabel = groupPicCountLabel;
        [self.contentView addSubview:_groupPicCountLabel];
    }
    return _groupPicCountLabel;
}

- (void)setGroup:(PhotoPickerGroup *)group{
    _group = group;
    self.groupNameLabel.text = group.groupName;
    self.groupImageView.image = group.thumbImage;
    self.groupPicCountLabel.text = [NSString stringWithFormat:@"%ld",group.assetsCount];
}

@end
