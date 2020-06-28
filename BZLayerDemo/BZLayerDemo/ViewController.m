//
//  ViewController.m
//  BZLayerDemo
//
//  Created by brandon on 2020/6/24.
//  Copyright © 2020 brandon_zheng. All rights reserved.
//

#import "ViewController.h"
#import "BZSimpleLayerVC.h"
#import "BZImageLayerVC.h"
#import "BZLayerClipVC.h"
#import "BZLayerDrawVC.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tv;

@property(nonatomic,copy)NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"BZLayerDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI{
    self.tv = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarAndStatusBarHeight, iScreenW, iScreenH-(kNavBarAndStatusBarHeight+kBottomSafeHeight)) style:UITableViewStylePlain];
    self.tv.dataSource = self;
    self.tv.delegate = self;
    [self.tv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tv];
}

#pragma mark - UITableViewDelegate&UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        BZSimpleLayerVC *vc = [[BZSimpleLayerVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        BZImageLayerVC *vc = [[BZImageLayerVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        BZLayerClipVC *vc = [[BZLayerClipVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        BZLayerDrawVC *vc = [[BZLayerDrawVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

#pragma mark - getter&setter

- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"简单的layer添加",@"为layer添加图片",@"layer剪裁",@"layer的绘制",@"Memory monitor"];
    }
    return _dataArray;
}

@end
