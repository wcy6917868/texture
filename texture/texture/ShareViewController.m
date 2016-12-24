//
//  ShareViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/16.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "ShareViewController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface ShareViewController ()

@end

@implementation ShareViewController

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
    
    UILabel *rewardL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 22*SCREENW_RATE, 328*SCREENW_RATE, 41*SCREENW_RATE)];
    rewardL.font = [UIFont systemFontOfSize:18];
    rewardL.textAlignment = NSTextAlignmentCenter;
    rewardL.textColor = RGB(51, 51, 51);
    rewardL.text = @"100时间币";
    [rewardV addSubview:rewardL];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(rewardL.frame)+20*SCREENW_RATE, 352*SCREENW_RATE, 1*SCREENW_RATE)];
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
    [rewardlBtn setTitle:@"支付并分享" forState:UIControlStateNormal];
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
