//
//  BZSimpleLayerVC.m
//  BZLayerDemo
//
//  Created by brandon on 2020/6/26.
//  Copyright © 2020 brandon_zheng. All rights reserved.
//

#import "BZSimpleLayerVC.h"

@interface BZSimpleLayerVC ()

@end

@implementation BZSimpleLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SimpleLayer";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addLayer];
    // Do any additional setup after loading the view.
}

- (void)addLayer{
    CALayer *layer_1 = [CALayer layer];
    layer_1.frame = CGRectMake(100, 100+kNavBarAndStatusBarHeight, 120, 80);
    layer_1.backgroundColor = [UIColor grayColor].CGColor;
    [self.view.layer addSublayer:layer_1];
    
    CALayer *layer_2 = [CALayer layer];
    layer_2.frame = CGRectMake(20, 20, 80, 40);
    layer_2.backgroundColor = [UIColor redColor].CGColor;
    [layer_1 addSublayer:layer_2];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
