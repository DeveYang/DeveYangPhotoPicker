//
//  PhotoPickerGroupCell.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import "PhotoPickerGroupCell.h"
#import "PhotoPickerGroup.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoPickerGroupCell()
@property(nonatomic, weak)UIImageView  *groupImageView;
@property(nonatomic, weak)UILabel  *groupNameLabel;
@property(nonatomic, weak)UILabel  *groupPicCountLabel;
@end
@implementation PhotoPickerGroupCell

- (UIImageView *)groupImageView{
    if (!_groupImageView) {
        UIImageView *groupImageView = [[UIImageView alloc] init];
        groupImageView.frame = CGRectMake(15, 5, 70, 70);
        groupImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_groupImageView = groupImageView];
    }
    return _groupImageView;
}

- (UILabel *)groupNameLabel{
    if (!_groupNameLabel) {
        UILabel *groupNameLabel = [[UILabel alloc] init];
        groupNameLabel.frame = CGRectMake(95, 15, self.frame.size.width - 100, 20);
        [self.contentView addSubview:_groupNameLabel = groupNameLabel];
    }
    return _groupNameLabel;
}

- (UILabel *)groupPicCountLabel{
    if (!_groupPicCountLabel) {
        UILabel *groupPicCountLabel = [[UILabel alloc] init];
        groupPicCountLabel.font = [UIFont systemFontOfSize:13];
        groupPicCountLabel.textColor = [UIColor lightGrayColor];
        groupPicCountLabel.frame = CGRectMake(95, 40, self.frame.size.width - 100, 20);
        [self.contentView addSubview:_groupPicCountLabel = groupPicCountLabel];
    }
    return _groupPicCountLabel;
}

- (void)setGroup:(PhotoPickerGroup *)group{
    _group = group;
    self.groupNameLabel.text = group.groupName;
    self.groupImageView.image = group.thumbImage;
    self.groupPicCountLabel.text = [NSString stringWithFormat:@"(%ld)",group.assetsCount];
}

@end
