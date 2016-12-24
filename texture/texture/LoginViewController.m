//
//  LoginViewController.m
//  texture
//
//  Created by 王澄宇 on 16/10/31.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPassWordViewController.h"
#import "RegisterViewController.h"
#import "MyTabBarController.h"
#import "AppDelegate.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configUI];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)configUI
{
    self.navigationController.navigationBar.hidden = YES;
    
    UIImageView *TitleImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 81*SCREENW_RATE, 81*SCREENW_RATE)];
    TitleImageV.center = CGPointMake(CGRectGetMidX(self.view.frame),146*SCREENW_RATE);
    TitleImageV.image = [UIImage imageNamed:@"logo0"];
    [self.view addSubview:TitleImageV];
    
    UIImageView *userImage = [[UIImageView alloc]initWithFrame:CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(TitleImageV.frame)+71*SCREENW_RATE, 12*SCREENW_RATE, 14*SCREENW_RATE)];
    userImage.image = [UIImage imageNamed:@"yonghuming0"];
    [self.view addSubview:userImage];
    
    UITextField *userTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(userImage.frame)+32*SCREENW_RATE,CGRectGetMaxY(TitleImageV.frame)+58*SCREENW_RATE, 209*SCREENW_RATE, 40*SCREENW_RATE)];
    userTF.font = [UIFont systemFontOfSize:13];
    [userTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"用户名" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view addSubview:userTF];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(userImage.frame) - 3*SCREENW_RATE, CGRectGetMaxY(userTF.frame), 251*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:lineV];
    
    UIImageView *passwordImage = [[UIImageView alloc]initWithFrame:CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+37*SCREENW_RATE, 14*SCREENW_RATE, 14*SCREENW_RATE)];
    passwordImage.image = [UIImage imageNamed:@"mima0"];
    [self.view addSubview:passwordImage];
    
    UITextField *passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(passwordImage.frame)+32*SCREENW_RATE,CGRectGetMaxY(lineV.frame)+25*SCREENW_RATE, 209*SCREENW_RATE, 40*SCREENW_RATE)];
    passwordTF.font = [UIFont systemFontOfSize:13];
    [passwordTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"密码" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view addSubview:passwordTF];
    
    UIView *lineV1 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(userImage.frame) - 3*SCREENW_RATE, CGRectGetMaxY(passwordTF.frame), 251*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV1.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:lineV1];
    
    UIButton *forgetPassWord = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPassWord.frame = CGRectMake(263*SCREENW_RATE, CGRectGetMaxY(lineV1.frame)+10*SCREENW_RATE, 50*SCREENW_RATE, 11*SCREENW_RATE);
    [forgetPassWord setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPassWord setTitleColor:RGB(53, 193, 236) forState:UIControlStateNormal];
    [forgetPassWord addTarget:self action:@selector(forgetPassWord) forControlEvents:UIControlEventTouchUpInside];
    forgetPassWord.titleLabel.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:forgetPassWord];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(forgetPassWord.frame)+37*SCREENW_RATE, 251*SCREENW_RATE, 45*SCREENW_RATE);
    loginBtn.backgroundColor = RGB(53, 195, 236);
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 22.0f;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(loginBtn.frame)+16*SCREENW_RATE, 251*SCREENW_RATE, 45*SCREENW_RATE);
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(register) forControlEvents:UIControlEventTouchUpInside];
    registerBtn.layer.cornerRadius = 22.0f;
    registerBtn.layer.borderWidth = 1.0f;
    registerBtn.layer.borderColor = RGB(53, 195, 236).CGColor;
    registerBtn.layer.masksToBounds = YES;
    [self.view addSubview:registerBtn];
    
    UIView *lineV2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(registerBtn.frame)+69*SCREENW_RATE, 120*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV2.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:lineV2];
    
    UIView *pointV = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lineV2.frame)+13*SCREENW_RATE, lineV2.frame.origin.y, 4*SCREENW_RATE, 4*SCREENW_RATE)];
    pointV.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:pointV];
    
    UILabel *moreLoglabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pointV.frame), CGRectGetMaxY(registerBtn.frame)+63*SCREENW_RATE, 103*SCREENW_RATE, 13*SCREENW_RATE)];
    moreLoglabel.text = @"更多登录方式";
    moreLoglabel.textAlignment = NSTextAlignmentCenter;
    moreLoglabel.font = [UIFont systemFontOfSize:13];
    moreLoglabel.textColor = RGB(153, 153, 153);
    [self.view addSubview:moreLoglabel];
    
    UIView *pointV1 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moreLoglabel.frame), lineV2.frame.origin.y, 4*SCREENW_RATE, 4*SCREENW_RATE)];
    pointV1.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:pointV1];
    
    UIView *lineV3 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pointV1.frame)+12*SCREENW_RATE, lineV2.frame.origin.y, 121*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV3.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:lineV3];
    
    UIButton *weixinLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    weixinLogin.frame = CGRectMake(129*SCREENW_RATE, CGRectGetMaxY(moreLoglabel.frame)+25*SCREENW_RATE, 26*SCREENW_RATE, 26*SCREENW_RATE);
    [weixinLogin setBackgroundImage:[UIImage imageNamed:@"weixin0"] forState:UIControlStateNormal];
    [self.view addSubview:weixinLogin];
    
    UIButton *qqLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    qqLogin.frame = CGRectMake(CGRectGetMaxX(weixinLogin.frame)+66*SCREENW_RATE, CGRectGetMaxY(moreLoglabel.frame)+25*SCREENW_RATE, 26*SCREENW_RATE, 26*SCREENW_RATE);
    [qqLogin setBackgroundImage:[UIImage imageNamed:@"qq0"] forState:UIControlStateNormal];
    [self.view addSubview:qqLogin];
}

- (void)forgetPassWord
{
    ForgetPassWordViewController *forgetPassVC = [[ForgetPassWordViewController alloc]init];
    [self.navigationController pushViewController:forgetPassVC animated:YES];
}

- (void)login
{
    AppDelegate *appdel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MyTabBarController *myTabBar = [[MyTabBarController alloc]init];
    appdel.window.rootViewController = myTabBar;
}

- (void)register
{
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
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
