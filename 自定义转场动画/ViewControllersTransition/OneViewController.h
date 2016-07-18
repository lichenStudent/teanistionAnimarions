//
//  OneViewController.h
//  自定义转场动画
//
//  Created by  lichen on 16/5/23.
//  Copyright © 2016年  lichen. All rights reserved.
//

#import "BaseVC.h"

@interface OneViewController : BaseVC

@property (strong,nonatomic)UITableView *tab;
/**
 *  记录当前点击的indexPath
 */
@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@end
