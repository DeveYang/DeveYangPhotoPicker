//
//  ViewController.m
//  DeveYangPhotoPicker
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 DeveYang. All rights reserved.
//

#import "ViewController.h"
#import "PhotoListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo";
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 30)];
    label.text = @"点击空白处";
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    直接创建
//    PhotoListViewController *photoListVC = [[PhotoListViewController alloc] init];
//    通过类名创建
    UIViewController *photoListVC = [[NSClassFromString(@"PhotoListViewController") alloc] init];
    photoListVC.title = @"选择后照片列表";
    [self.navigationController pushViewController:photoListVC animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
