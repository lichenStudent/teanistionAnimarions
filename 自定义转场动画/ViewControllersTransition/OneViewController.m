//
//  OneViewController.m
//  自定义转场动画
//
//  Created by  lichen on 16/5/23.
//  Copyright © 2016年  lichen. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
#import "PresentAnimator.h"
#import "DismissAnimator.h"

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate>

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tab];
}

#pragma mark --- table delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 180, 90)];
        img.tag = 101;
        [cell.contentView addSubview:img];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(10, 99.5, SCREEN_W - 10, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:line];

    }
    //设置这个会点击2次才会响应一次点击事件
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIImageView *cellImg = (UIImageView *)[cell.contentView viewWithTag:101];
    cellImg.image = [UIImage imageNamed:@"img1"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _currentIndexPath = indexPath;
    TwoViewController *two = [TwoViewController new];
    two.transitioningDelegate  = self;
    //设置这个dismiss的时候会销毁原viewcontroller。
//    two.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:two animated:YES completion:nil];
    [self.tab deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"-----%ld",indexPath.row);

}

#pragma mark - 定制转场动画 (Present 与 Dismiss动画代理)
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    // 推出控制器的动画
    return [PresentAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    DismissAnimator *dismissAnimator   = [DismissAnimator new];
    dismissAnimator.transitionDuration = 1.f;
    
    // 退出控制器动画
    return dismissAnimator;
}

#pragma mark --- get
- (UITableView *)tab
{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 20,SCREEN_W, SCREEN_H - 20) style:UITableViewStylePlain];
        _tab.dataSource = self;
        _tab.delegate = self;
        _tab.rowHeight = 100.0f;
        _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tab;
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
