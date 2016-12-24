//
//  CreateGroupNextStepVC.m
//  texture
//
//  Created by 王澄宇 on 16/11/8.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "CreateGroupNextStepVC.h"
#import "GroupHomePageViewController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface CreateGroupNextStepVC ()

@end

@implementation CreateGroupNextStepVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)configNav
{
    self.navigationController.navigationBar.barTintColor = RGB(245, 245, 245);
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10*SCREENW_RATE, 18*SCREENW_RATE)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left0@2x"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.title = @"创建社群";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"创建" style:UIBarButtonItemStyleDone target:self action:@selector(create)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGB(102, 102, 102)} forState:UIControlStateNormal];
}

- (void)configUI
{
    self.view.backgroundColor = RGB(238, 238, 238);
    UIImageView *blueBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCREENW, 124*SCREENW_RATE)];
    blueBg.image = [UIImage imageNamed:@"bg_up0"];
    [self.view addSubview:blueBg];
    
    UIImageView *whiteBg = [[UIImageView alloc]initWithFrame:CGRectMake(143*SCREENW_RATE, 147*SCREENW_RATE, 90*SCREENW_RATE, 90*SCREENW_RATE)];
    whiteBg.image = [UIImage imageNamed:@"tuoyuan0"];
    [self.view addSubview:whiteBg];
    
    UIImageView *cameraPic = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 42*SCREENW_RATE, 37*SCREENW_RATE)];
    cameraPic.center = CGPointMake(CGRectGetMidX(whiteBg.bounds), CGRectGetMidY(whiteBg.bounds));
    cameraPic.image = [UIImage imageNamed:@"xiangji0"];
    [whiteBg addSubview:cameraPic];
    
    UIImageView *bigWhiteBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(blueBg.frame)+8*SCREENW_RATE, SCREENW, 471*SCREENW_RATE)];
    bigWhiteBg.image = [UIImage imageNamed:@"bg_down0"];
    [self.view addSubview:bigWhiteBg];
    
    UIImageView *editImg = [[UIImageView alloc]initWithFrame:CGRectMake(141*SCREENW_RATE, CGRectGetMaxY(whiteBg.frame)+44*SCREENW_RATE, 12*SCREENW_RATE, 12*SCREENW_RATE)];
    editImg.image = [UIImage imageNamed:@"xiugai0@2x"];
    [self.view insertSubview:editImg aboveSubview:bigWhiteBg];
    
    UITextField *groupName = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(editImg.frame)+11*SCREENW_RATE, editImg.frame.origin.y, 83*SCREENW_RATE, 15*SCREENW_RATE)];
    groupName.font = [UIFont systemFontOfSize:12];
    
    [groupName setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"填写社群名称" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view insertSubview:groupName aboveSubview:bigWhiteBg];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(138*SCREENW_RATE, CGRectGetMaxY(groupName.frame)+7*SCREENW_RATE, 100, 1)];
    lineV.backgroundColor = RGB(221, 221, 221);
    [self.view insertSubview:lineV aboveSubview:bigWhiteBg];
    
    UITextField *groupIntro = [[UITextField alloc]initWithFrame:CGRectMake(164*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+20*SCREENW_RATE, 60*SCREENW_RATE, 15*SCREENW_RATE)];
    groupIntro.font = [UIFont systemFontOfSize:12];
    [groupIntro     setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"社群简介" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view insertSubview:groupIntro aboveSubview:bigWhiteBg];
    
    UIView *lineV1 = [[UIView alloc]initWithFrame:CGRectMake(173*SCREENW_RATE, CGRectGetMaxY(groupIntro.frame)+10*SCREENW_RATE, 30*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV1.backgroundColor = RGB(204, 204, 204);
    [self.view insertSubview:lineV1 aboveSubview:bigWhiteBg];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(lineV1.frame)+12*SCREENW_RATE, 351*SCREENW_RATE, 169*SCREENW_RATE)];
    textView.layer.borderColor = RGB(221, 221, 221).CGColor;
    textView.layer.borderWidth = 0.3f;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view insertSubview:textView aboveSubview:bigWhiteBg];
    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)create
{
    GroupHomePageViewController *GHPVC = [[GroupHomePageViewController alloc]init];
    [self.navigationController pushViewController:GHPVC animated:YES];
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
