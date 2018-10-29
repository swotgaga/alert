//
//  JellyAlertController.m
//  HandServiceBoxBoss
//
//  Created by 姜卓辰 on 2018/10/12.
//  Copyright © 2018年 姜卓辰. All rights reserved.
//

#import "JellyAlertController.h"

@interface JellyAlertController ()

@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation JellyAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    SCREEN_ADAPTION
    //如果自定义需要更大的现实面积，可以使用属性，是否裁剪超出super view的部分
//    self.view.clipsToBounds = NO;
    
    

    
    // Do any additional setup after loading the view.
}

/**弹窗提醒*/
+ (void)addScoreRuleAlertWithTitle:(NSString *)title andController:(UIViewController *)controller andConfirmBlock:(confirmBlock)confirmBlock {
    
    JellyAlertController *alertC = [JellyAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    alertC.tempBlock = confirmBlock;
    
    //用于覆盖原有的样式
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(-15, 0, 305, 400)];
    customView.backgroundColor = [UIColor whiteColor];
    
    customView.layer.cornerRadius = 4.f;
    customView.layer.masksToBounds = YES;
    
    [alertC.view addSubview:customView];
    customView.userInteractionEnabled = YES;
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 275, 60)];
    imageView.image = [UIImage imageNamed:@"integral-rule"];
    [customView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13, 95, 280, 200)];
    label.textColor = DYJ_UIColorFrom16RGB(0x666666);
    label.font = [UIFont systemFontOfSize:14];
    label.text = title;
    label.accessibilityLabel = [title stringByReplacingOccurrencesOfString:@" \n" withString:@"：："];
    label.numberOfLines = 0;
    [customView addSubview:label];
    
    UILabel *redLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 313, 300, 22)];
    redLabel.text = @"* 本规则最终解释权归手服宝平台所有";
    redLabel.textColor = DYJ_UIColorFrom16RGB(0xf94949);
    redLabel.font = [UIFont systemFontOfSize:12];
    [customView addSubview:redLabel];
    
    //用于出发隐藏的按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(90, 350, 120, 30)];
    //    self.button.center = self.customView.center;
    button.layer.cornerRadius = 15.f;
    button.layer.masksToBounds = YES;
    
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"我知道了" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:button];
    
    //必须加入一个alertAction否则系统提示你，alertControllrt要有一个一个action
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:nil];
    
    [alertC addAction:action];
    
    for (UIView *view in alertC.view.subviews) {
        if (view.frame.size.width != 305) {
            view.accessibilityElementsHidden = YES;
        }
    }
   
    
    UITabBarController *tab = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    UINavigationController *nav = (UINavigationController *)tab.selectedViewController;
    
    UIViewController *vc = nav.childViewControllers[1];
    
    
    // 将UIAlertController模态出来 相当于UIAlertView show 的方法
    [vc presentViewController:alertC animated:YES completion:^{
        
        
    }];
    
    
    
}

+ (void)onClick:(UIButton *)button {
    
    for (UIView* next = [button superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[JellyAlertController class]]) {
            
            JellyAlertController *alertC = (JellyAlertController *)nextResponder ;
            if (alertC.tempBlock) {
                alertC.tempBlock();
            }
            [alertC dismissViewControllerAnimated:YES completion:nil];
            
        }
    }
    
    
    
    
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
