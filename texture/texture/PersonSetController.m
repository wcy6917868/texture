//
//  PersonSetController.m
//  texture
//
//  Created by 王澄宇 on 16/12/15.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "PersonSetController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface PersonSetController ()
{
    UIImageView *headImg;
    UILabel *nickName;
    
}

@end

@implementation PersonSetController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
    self.navigationController.navigationBar.translucent = NO;
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
        
        self.navigationItem.title = @"个人设置";
       [self.navigationController.navigationBar setTitleTextAttributes:
         @{NSFontAttributeName:[UIFont systemFontOfSize:18*SCREENW_RATE],
           NSForegroundColorAttributeName:RGB(51, 51, 51)}];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(sure)];
        [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15*SCREENW_RATE],NSForegroundColorAttributeName:RGB(102, 102, 102)} forState:UIControlStateNormal];

}

- (void)configUI
{
    self.view.backgroundColor = RGB(238, 238, 238);
    UIView *headV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 86*SCREENW_RATE)];
    headV.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:headV];
    
    headImg = [[UIImageView alloc]initWithFrame:CGRectMake(15*SCREENW_RATE, 13*SCREENW_RATE, 61*SCREENW_RATE, 61*SCREENW_RATE)];
    headImg.layer.cornerRadius = 25.0f;
    headImg.layer.masksToBounds = YES;
    headImg.image = [UIImage imageNamed:@"touxiang8"];
    [headV addSubview:headImg];
    
    UILabel *textL = [[UILabel alloc]initWithFrame:CGRectMake(307*SCREENW_RATE, 37*SCREENW_RATE, 56*SCREENW_RATE, 14*SCREENW_RATE)];
    textL.text = @"修改头像";
    textL.textColor = RGB(102, 102, 102);
    textL.font = [UIFont systemFontOfSize:13];
    [headV addSubview:textL];
    
    UIView *nickNameV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headV.frame)+15*SCREENW_RATE, SCREENW, 45*SCREENW_RATE)];
    nickNameV.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:nickNameV];
    
    UILabel *textL1 = [[UILabel alloc]initWithFrame:CGRectMake(16*SCREENW_RATE, 15*SCREENW_RATE, 33*SCREENW_RATE, 15*SCREENW_RATE)];
    textL1.font = [UIFont systemFontOfSize:15*SCREENW_RATE];
    textL1.textColor = RGB(51, 51, 51);
    textL1.text = @"昵称";
    [nickNameV addSubview:textL1];
    
    nickName = [[UILabel alloc]initWithFrame:CGRectMake(300*SCREENW_RATE, 17*SCREENW_RATE, 75*SCREENW_RATE, 14*SCREENW_RATE)];
    nickName.font = [UIFont systemFontOfSize:13*SCREENW_RATE];
    nickName.textColor = RGB(102, 102, 102);
    nickName.text = @"张三疯";
    [nickNameV addSubview:nickName];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nickNameV.frame)-1, SCREENW, 1)];
    lineV.backgroundColor = RGB(245, 245, 245);
    [self.view addSubview:lineV];
    
    UIView *sexV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nickNameV.frame), SCREENW, 45*SCREENW_RATE)];
    sexV.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:sexV];
    
    UILabel *textL2 = [[UILabel alloc]initWithFrame:CGRectMake(16*SCREENW_RATE, 15*SCREENW_RATE, 33*SCREENW_RATE, 15*SCREENW_RATE)];
    textL2.font = [UIFont systemFontOfSize:15*SCREENW_RATE];
    textL2.textColor = RGB(51, 51, 51);
    textL2.text = @"性别";
    [sexV addSubview:textL2];
    
    UIButton *boyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    boyBtn.frame = CGRectMake(301*SCREENW_RATE, 14*SCREENW_RATE, 17*SCREENW_RATE, 17*SCREENW_RATE);
    [boyBtn setBackgroundImage:[UIImage imageNamed:@"nan0"] forState:UIControlStateNormal];
    [boyBtn setBackgroundImage:[UIImage imageNamed:@"nan1"] forState:UIControlStateSelected];
    [sexV addSubview:boyBtn];
    
    UIButton *girlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    girlBtn.frame = CGRectMake(CGRectGetMaxX(boyBtn.frame)+28*SCREENW_RATE, 14*SCREENW_RATE, 17*SCREENW_RATE, 17*SCREENW_RATE);
    [girlBtn setBackgroundImage:[UIImage imageNamed:@"nv0"] forState:UIControlStateNormal];
    [girlBtn setBackgroundImage:[UIImage imageNamed:@"nv1"] forState:UIControlStateSelected];
    [sexV addSubview:girlBtn];
    
    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = NO;
    self.navigationController.navigationBar.translucent = YES;
}

- (void)sure
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
