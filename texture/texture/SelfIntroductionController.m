//
//  SelfIntroductionController.m
//  texture
//
//  Created by 王澄宇 on 16/12/12.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "SelfIntroductionController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface SelfIntroductionController ()<UITextViewDelegate>
{
    UILabel *placeholderL;
    UITextView *textV;
}

@end

@implementation SelfIntroductionController

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
    
    self.navigationItem.title = @"个人介绍";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18*SCREENW_RATE],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStyleDone target:self action:@selector(sure)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15*SCREENW_RATE],NSForegroundColorAttributeName:RGB(102, 102, 102)} forState:UIControlStateNormal];
}

- (void)configUI
{
    self.view.backgroundColor = RGB(245,245, 245);
    textV = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 198*SCREENW_RATE)];
    textV.delegate = self;
    textV.backgroundColor = [UIColor whiteColor];
    textV.font = [UIFont systemFontOfSize:13*SCREENW_RATE];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    placeholderL = [[UILabel alloc]initWithFrame:CGRectMake(11*SCREENW_RATE, 0, 75*SCREENW_RATE, 15*SCREENW_RATE)];
    placeholderL.textColor = RGB(136, 136, 136);
    placeholderL.font = textV.font;
    placeholderL.text = @"请输入内容";
    [self.view addSubview:textV];
    [self.view addSubview:placeholderL];
    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = NO;
    self.navigationController.navigationBar.translucent = YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    placeholderL.text = @"";
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length == 0)
    {
        placeholderL.text = @"请输入内容";
    }
    else
    {
        placeholderL.text = @"";
    }
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
