//
//  PhotoListViewController.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import "PhotoListViewController.h"
#import "PhotoListCell.h"
#import "PhotoPickerGroupViewController.h"
#import "PhotoAssets.h"

@interface PhotoListViewController ()<UITableViewDataSource,UITableViewDelegate,PhotoPickerViewControllerDelegate>
@property (weak,nonatomic) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *assets;
@end

@implementation PhotoListViewController
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        [self.view addSubview:tableView];
        self.tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.assets = [NSMutableArray array];
    // 初始化UI
    [self setupButtons];
    [self tableView];
}

- (void) setupButtons{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择照片" style:UIBarButtonItemStyleDone target:self action:@selector(selectPhotos)];
}
#pragma mark - 选择相册
- (void)selectPhotos {
    // 创建控制器
    PhotoPickerViewController *pickerVc = [[PhotoPickerViewController alloc] init];
    // 默认显示相册里面的内容SavePhotos
//    pickerVc.status = PickerViewShowStatusCameraRoll;
    pickerVc.delegate = self;
    [pickerVc showPickerVc:self];
    /**
     *
     传值可以用代理，或者用block来接收，以下是block的传值
     __weak typeof(self) weakSelf = self;
     pickerVc.callBack = ^(NSArray *assets){
     weakSelf.assets = assets;
     [weakSelf.tableView reloadData];
     };
     */
}

#pragma mark - 相册回调
- (void)pickerViewControllerDoneAsstes:(NSArray *)assets{
    [self.assets addObjectsFromArray:assets];
    [self.tableView reloadData];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.assets.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoListCell *cell = [PhotoListCell cellWithTableView:tableView];
//    static NSString *ID = @"cell";
//    Example1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
    PhotoAssets *asset = self.assets[indexPath.row];
    cell.imageview1.image = asset.originImage;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}

@end
