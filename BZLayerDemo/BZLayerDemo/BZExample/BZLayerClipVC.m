//
//  BZLayerClipVC.m
//  BZLayerDemo
//
//  Created by brandon on 2020/6/26.
//  Copyright © 2020 brandon_zheng. All rights reserved.
//

#import "BZLayerClipVC.h"

@interface BZLayerClipVC ()

@end

@implementation BZLayerClipVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"BZLayerClip";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addLayer];
    // Do any additional setup after loading the view.
}

- (void)addLayer{
    CALayer *layer_1 = [CALayer layer];
    layer_1.frame = CGRectMake(100, 100+kNavBarAndStatusBarHeight, 300, 200);
    layer_1.backgroundColor = [UIColor grayColor].CGColor;
    [self.view.layer addSublayer:layer_1];
    
    CALayer *layer_2 = [CALayer layer];
    layer_2.frame = CGRectMake(20, 20, 200, 150);
    //如果仅仅转换为CGImage，那么会抛出编译错误，因为它返回的并不是正宗的CGImage类型，而是CGImageRef，因此需要转换一下
    layer_2.contents = (__bridge id _Nullable)([UIImage imageNamed:@"timg"].CGImage);
    //这时候图片是有一些变形的，CALayer也有一个跟contentMode长得很像的属性叫做contentsGravity，设置为kCAGravityResizeAspect可以使图片按照正常的比例显示，而且会适应图层的大小
    layer_2.contentsGravity = kCAGravityResizeAspect;
    //如果换成kCAGravityCenter则会按照原始大小显示
//    layer_2.contentsGravity = kCAGravityCenter;
    
//    layer_2.masksToBounds = YES;
    
    layer_2.contentsRect = CGRectMake(0, 0, 0.5, 0.5);

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
