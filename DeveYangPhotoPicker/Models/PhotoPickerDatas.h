//
//  PhotoPickerDatas.h
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PhotoPickerDatas;
@class PhotoPickerGroup;
// 回调
typedef void(^callBackBlock)(id obj);

@interface PhotoPickerDatas : NSObject
/**
*  获取所有组
*/
+ (instancetype) defaultPicker;

/**
 * 获取所有组对应的图片与视频
 */
- (void) getAllGroupWithPhotosAndVideos : (callBackBlock ) callBack;

/**
 * 获取所有组对应的图片
 */
- (void) getAllGroupWithPhotos : (callBackBlock ) callBack;

/**
 * 获取所有组对应的Videos
 */
- (void) getAllGroupWithVideos : (callBackBlock ) callBack;

/**
 *  传入一个组获取组里面的Asset
 */
- (void) getGroupPhotosWithGroup : (PhotoPickerGroup *) pickerGroup finished : (callBackBlock ) callBack;

/**
 *  传入一个AssetsURL来获取UIImage
 */
- (void) getAssetsPhotoWithURLs:(NSURL *) url callBack:(callBackBlock ) callBack;

@end
