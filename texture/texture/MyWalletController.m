//
//  MyWalletController.m
//  texture
//
//  Created by 王澄宇 on 16/12/16.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "MyWalletController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface MyWalletController ()

@end

@implementation MyWalletController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)configNav
{
    self.navigationController.navigationBar.barTintColor = RGB(245, 245, 245);
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10*SCREENW_RATE, 18*SCREENW_RATE)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left0"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.title = @"我的钱包";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18*SCREENW_RATE],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"账单" style:UIBarButtonItemStyleDone target:self action:@selector(bill)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15*SCREENW_RATE],NSForegroundColorAttributeName:RGB(102, 102, 102)} forState:UIControlStateNormal];
}

- (void)configUI
{
    self.view.backgroundColor = RGB(238, 238, 238);
    
    UIView *backGDView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 170*SCREENW_RATE)];
    backGDView.backgroundColor = RGB(35, 195, 236);
    [self.view addSubview:backGDView];
    
    UILabel *timeBi = [[UILabel alloc]initWithFrame:CGRectMake(0, 20*SCREENW_RATE, SCREENW, 60*SCREENW_RATE)];
    timeBi.textColor = RGB(255, 255, 255);
    timeBi.font = [UIFont systemFontOfSize:36*SCREENW_RATE];
    timeBi.textAlignment = NSTextAlignmentCenter;
    timeBi.text = @"6666";
    [backGDView addSubview:timeBi];
    
    UILabel *timeText = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(timeBi.frame), SCREENW, 30*SCREENW_RATE)];
    timeText.textColor = RGB(255, 255, 255);
    timeText.font = [UIFont systemFontOfSize:15*SCREENW_RATE];
    timeText.textAlignment = NSTextAlignmentCenter;
    timeText.text = @"时间币";
    [backGDView addSubview:timeText];
    
    UILabel *whateverL = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(timeText.frame), SCREENW, 15*SCREENW_RATE)];
    whateverL.font = [UIFont systemFontOfSize:13];
    whateverL.textColor = RGB(255, 255, 255);
    whateverL.textAlignment = NSTextAlignmentCenter;
    whateverL.text = @"时间币, 大用处";
    [backGDView addSubview:whateverL];
    
    UIView *rechargeV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(backGDView.frame)+12*SCREENW_RATE, SCREENW, 50*SCREENW_RATE)];
    rechargeV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:rechargeV];
    
    UIImageView *rechargeImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 18*SCREENW_RATE, 17*SCREENW_RATE)];
    rechargeImg.image = [UIImage imageNamed:@"tixian"];
    [rechargeV addSubview:rechargeImg];
    
    UILabel *rechargeL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rechargeImg.frame)+12*SCREENW_RATE, 18*SCREENW_RATE, 35*SCREENW_RATE, 15*SCREENW_RATE)];
    rechargeL.textColor = RGB(102, 102, 102);
    rechargeL.text = @"充值";
    rechargeL.font = [UIFont systemFontOfSize:15];
    [rechargeV addSubview:rechargeL];
    
    UIView *tixianV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(rechargeV.frame)+12*SCREENW_RATE, SCREENW, 50*SCREENW_RATE)];
    tixianV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tixianV];
    
    UIImageView *tiXinaImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 18*SCREENW_RATE, 17*SCREENW_RATE)];
    tiXinaImg.image = [UIImage imageNamed:@"tixian"];
    [tixianV addSubview:tiXinaImg];
    
    UILabel *tiXianL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tiXinaImg.frame)+12*SCREENW_RATE, 18*SCREENW_RATE, 35*SCREENW_RATE, 15*SCREENW_RATE)];
    tiXianL.textColor = RGB(102, 102, 102);
    tiXianL.text = @"提现";
    tiXianL.font = [UIFont systemFontOfSize:15];
    [tixianV addSubview:tiXianL];

}

- (void)back
{
    self.navigationController.navigationBar.translucent = YES;
    self.tabBarController.hidesBottomBarWhenPushed = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)bill
{
    
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
