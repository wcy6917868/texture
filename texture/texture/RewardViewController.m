//
//  RewardViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/16.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "RewardViewController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface RewardViewController ()

@end

@implementation RewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI
{
    UIView *rewardV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 286*SCREENW_RATE ,352*SCREENW_RATE, 128*SCREENW_RATE)];
    rewardV.backgroundColor = [UIColor whiteColor];
    rewardV.layer.cornerRadius = 5.0f;
    rewardV.layer.masksToBounds = YES;
    [self.view addSubview: rewardV];
    
    UITextField *rewardTF = [[UITextField alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 22*SCREENW_RATE, 328*SCREENW_RATE, 41*SCREENW_RATE)];
    rewardTF.font = [UIFont systemFontOfSize:13];
    [rewardTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"请输入打赏金额" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    UIView *padV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 12*SCREENW_RATE, 5*SCREENW_RATE)];
    rewardTF.leftViewMode = UITextFieldViewModeAlways;
    rewardTF.leftView = padV;
    rewardTF.layer.borderColor = RGB(221, 221, 221).CGColor;
    rewardTF.layer.borderWidth = 0.3f;
    [rewardV addSubview:rewardTF];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(rewardTF.frame)+20*SCREENW_RATE, 352*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV.backgroundColor = RGB(221, 221, 221);
    [rewardV addSubview:lineV];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, CGRectGetMaxY(lineV.frame), 175*SCREENW_RATE, 44*SCREENW_RATE);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [cancelBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [rewardV addSubview:cancelBtn];
    
    UIButton *rewardlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rewardlBtn.frame = CGRectMake(CGRectGetMaxX(cancelBtn.frame), CGRectGetMaxY(lineV.frame), 177*SCREENW_RATE, 44*SCREENW_RATE);
    rewardlBtn.backgroundColor = RGB(53, 195, 236);
    [rewardlBtn setTitle:@"打赏" forState:UIControlStateNormal];
    rewardlBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [rewardlBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    [rewardlBtn addTarget:self action:@selector(reward) forControlEvents:UIControlEventTouchUpInside];
    [rewardV addSubview:rewardlBtn];
    
    
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)reward
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
