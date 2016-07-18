//
//  TwoViewController.m
//  自定义转场动画
//
//  Created by  lichen on 16/5/23.
//  Copyright © 2016年  lichen. All rights reserved.
//

#import "TwoViewController.h"

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [self initView];
    
}

- (void)initView
{
    _img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 64, SCREEN_W - 20, (SCREEN_W - 20)/2)];
    _img.image = [UIImage imageNamed:@"img1"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 64, SCREEN_W - 20, (SCREEN_W - 20)/2);
    [btn addTarget:self action:@selector(dismissAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_img];
    [self.view addSubview:btn];
}

- (void)dismissAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc{
    NSLog(@"销毁了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
