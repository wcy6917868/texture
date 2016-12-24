//
//  SettingController.m
//  texture
//
//  Created by 王澄宇 on 16/12/19.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "SettingController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface SettingController ()

@end

@implementation SettingController

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
    self.navigationController.navigationBar.barTintColor = RGB(255, 255, 255);
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10*SCREENW_RATE, 18*SCREENW_RATE)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left1"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.title = @"设置";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18*SCREENW_RATE],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
}

- (void)configUI
{
    
    self.view.backgroundColor = RGB(245, 245, 245);
    
    NSArray *titleArray = @[@"密码设置",@"清除缓存",@"意见反馈",@"帮助",@"监测版本"];
    for (int i = 0; i < titleArray.count; i ++)
    {
        UIView *settingView = [[UIView alloc]initWithFrame:CGRectMake(0, 45*i, SCREENW, 45*SCREENW_RATE)];
        settingView.backgroundColor = [UIColor whiteColor];
        
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(settingView.bounds)- 1, SCREENW, 1)];
        lineV.backgroundColor = RGB(238, 238, 238);
        [settingView addSubview:lineV];
        
        UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(16*SCREENW_RATE, 0, 65*SCREENW_RATE, 45*SCREENW_RATE)];
        titleL.textColor = RGB(51, 51, 51);
        titleL.textAlignment = NSTextAlignmentLeft;
        titleL.font = [UIFont systemFontOfSize:15];
        titleL.text = titleArray[i];
        [settingView addSubview:titleL];
        
        if (i == 1)
        {
            UILabel *huanCunL = [[UILabel alloc]initWithFrame:CGRectMake(326*SCREENW_RATE, 0, 50*SCREENW_RATE, 45*SCREENW_RATE)];
            huanCunL.font = [UIFont systemFontOfSize:13];
            huanCunL.textColor = RGB(102, 102, 102);
            huanCunL.textAlignment = NSTextAlignmentLeft;
            huanCunL.text = @"357M";
            [settingView addSubview:huanCunL];
        }
        else if (i == 4)
        {
            UILabel *versionL = [[UILabel alloc]initWithFrame:CGRectMake(333*SCREENW_RATE, 0, 35*SCREENW_RATE, 45*SCREENW_RATE)];
            versionL.font = [UIFont systemFontOfSize:13];
            versionL.textColor = RGB(102, 102, 102);
            versionL.textAlignment = NSTextAlignmentLeft;
            versionL.text = @"V1.0";
            [settingView addSubview:versionL];
        }
        [self.view addSubview:settingView];
    }
    
    UIButton *outLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    outLoginBtn.frame = CGRectMake(0, SCREENH - 110*SCREENW_RATE, SCREENW, 45*SCREENW_RATE);
    outLoginBtn.backgroundColor = RGB(53, 195, 236);
    [outLoginBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [outLoginBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    [self.view addSubview:outLoginBtn];
    
}

- (void)back
{
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = NO;
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
