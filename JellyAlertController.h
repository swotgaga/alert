//
//  JellyAlertController.h
//  HandServiceBoxBoss
//
//  Created by 姜卓辰 on 2018/10/12.
//  Copyright © 2018年 姜卓辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JellyAlertController : UIAlertController

@property (nonatomic, copy) void(^tempBlock)();

/**弹窗提醒*/
+ (void)addScoreRuleAlertWithTitle:(NSString *)title andController:(UIViewController *)controller andConfirmBlock:(confirmBlock)confirmBlock;

@end
