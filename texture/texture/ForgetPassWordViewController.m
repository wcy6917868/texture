//
//  ForgetPassWordViewController.m
//  texture
//
//  Created by 王澄宇 on 16/10/31.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "ForgetPassWordViewController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface ForgetPassWordViewController ()
{
    UIImageView *navBarHairlineImageView;
}

@end

@implementation ForgetPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    navBarHairlineImageView.hidden = YES;
}

- (void)configNav
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 12*SCREENW_RATE, 21*SCREENW_RATE);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left0"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
}

- (void)configUI
{
    self.view.backgroundColor = RGB(255, 255, 255);
    UIImageView *TitleImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 81*SCREENW_RATE, 81*SCREENW_RATE)];
    TitleImageV.center = CGPointMake(CGRectGetMidX(self.view.frame),146*SCREENW_RATE);
    TitleImageV.image = [UIImage imageNamed:@"logo0"];
    [self.view addSubview:TitleImageV];
    
    UIImageView *userImage = [[UIImageView alloc]initWithFrame:CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(TitleImageV.frame)+71*SCREENW_RATE, 12*SCREENW_RATE, 14*SCREENW_RATE)];
    userImage.image = [UIImage imageNamed:@"yonghuming0"];
    [self.view addSubview:userImage];
    
    UITextField *userTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(userImage.frame)+32*SCREENW_RATE,CGRectGetMaxY(TitleImageV.frame)+58*SCREENW_RATE, 209*SCREENW_RATE, 40*SCREENW_RATE)];
    userTF.font = [UIFont systemFontOfSize:13];
    [userTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"用户名/手机号" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view addSubview:userTF];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(userImage.frame) - 3*SCREENW_RATE, CGRectGetMaxY(userTF.frame), 251*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:lineV];
    
    UIImageView *testNumImage = [[UIImageView alloc]initWithFrame:CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+37*SCREENW_RATE, 14*SCREENW_RATE, 14*SCREENW_RATE)];
    testNumImage.image = [UIImage imageNamed:@"yanzhengma0"];
    [self.view addSubview:testNumImage];
    
    UITextField *testNumTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(testNumImage.frame)+32*SCREENW_RATE,CGRectGetMaxY(lineV.frame)+25*SCREENW_RATE, 209*SCREENW_RATE, 40*SCREENW_RATE)];
    testNumTF.font = [UIFont systemFontOfSize:13];
    [testNumTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"验证码" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(CGRectGetMaxX(testNumImage.frame)+138*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+35*SCREENW_RATE, 91*SCREENW_RATE, 26*SCREENW_RATE);
    [testBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [testBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    testBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    testBtn.backgroundColor = RGB(53, 195, 236);
    testBtn.layer.cornerRadius = 10.0f;
    testBtn.layer.masksToBounds = YES;
    [self.view addSubview:testBtn];
    [self.view addSubview:testNumTF];
    
    UIView *lineV1 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(userImage.frame) - 3*SCREENW_RATE, CGRectGetMaxY(testNumTF.frame), 251*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV1.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:lineV1];
    
    UIImageView *passwordImage = [[UIImageView alloc]initWithFrame:CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(lineV1.frame)+37*SCREENW_RATE, 14*SCREENW_RATE, 14*SCREENW_RATE)];
    passwordImage.image = [UIImage imageNamed:@"mima0"];
    [self.view addSubview:passwordImage];
    
    UITextField *passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(passwordImage.frame)+32*SCREENW_RATE,CGRectGetMaxY(lineV1.frame)+25*SCREENW_RATE, 209*SCREENW_RATE, 40*SCREENW_RATE)];
    passwordTF.font = [UIFont systemFontOfSize:13];
    [passwordTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"输入密码" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view addSubview:passwordTF];
    
    UIView *lineV2 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(userImage.frame) - 3*SCREENW_RATE, CGRectGetMaxY(passwordTF.frame), 251*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV2.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:lineV2];
    
    UIImageView *surePasswordImage = [[UIImageView alloc]initWithFrame:CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(lineV2.frame)+37*SCREENW_RATE, 14*SCREENW_RATE, 14*SCREENW_RATE)];
    surePasswordImage.image = [UIImage imageNamed:@"mima0"];
    [self.view addSubview:surePasswordImage];
    
    UITextField *surePasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(passwordImage.frame)+32*SCREENW_RATE,CGRectGetMaxY(lineV2.frame)+25*SCREENW_RATE, 209*SCREENW_RATE, 40*SCREENW_RATE)];
    surePasswordTF.font = [UIFont systemFontOfSize:13];
    [surePasswordTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"确认密码" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view addSubview:surePasswordTF];
    
    UIView *lineV3 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(userImage.frame) - 3*SCREENW_RATE, CGRectGetMaxY(surePasswordTF.frame), 251*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV3.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:lineV3];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(lineV3.frame)+60*SCREENW_RATE, 251*SCREENW_RATE, 45*SCREENW_RATE);
    sureBtn.backgroundColor = RGB(53, 195, 236);
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [sureBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    sureBtn.layer.cornerRadius = 22.0f;
    sureBtn.layer.masksToBounds = YES;
    [self.view addSubview:sureBtn];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews)
    {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
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
