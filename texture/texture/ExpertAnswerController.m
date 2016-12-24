//
//  ExpertAnswerController.m
//  texture
//
//  Created by 王澄宇 on 16/12/22.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "ExpertAnswerController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface ExpertAnswerController ()<UITextViewDelegate>
{
    UITextField *titleTF;
    UITextView *textTV;
    UILabel *placeholderL;
}

@end

@implementation ExpertAnswerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)configNav
{
    self.navigationController.navigationBar.barTintColor = RGB(245, 245, 245);
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10*SCREENW_RATE, 18*SCREENW_RATE)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left0"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.title = @"发布";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];

}

- (void)configUI
{
    self.view.backgroundColor = RGB(238, 238, 238);
    
    UIView *textView = [[UIView alloc]initWithFrame:CGRectMake(0, 76*SCREENW_RATE, SCREENW, 155*SCREENW_RATE)];
    textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textView];
    
    titleTF = [[UITextField alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 0, SCREENW - 12*SCREENW_RATE, 40*SCREENW_RATE)];
    titleTF.font = [UIFont systemFontOfSize:13];
    titleTF.textColor = RGB(102, 102, 102);
    titleTF.placeholder = @"请输入标题";
    [textView addSubview:titleTF];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(titleTF.frame), 352*SCREENW_RATE, 1)];
    lineV.backgroundColor = RGB(221, 221, 221);
    [textView addSubview:lineV];
    
    textTV = [[UITextView alloc]initWithFrame:CGRectMake(10*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+ 10*SCREENW_RATE, SCREENW - 12*SCREENW_RATE, 61*SCREENW_RATE)];
    textTV.backgroundColor = [UIColor whiteColor];
    textTV.delegate = self;
    textTV.font = [UIFont systemFontOfSize:13];
    self.automaticallyAdjustsScrollViewInsets = NO;
    placeholderL = [[UILabel alloc]initWithFrame:CGRectMake(10*SCREENW_RATE,  CGRectGetMaxY(lineV.frame)+ 10*SCREENW_RATE, 200*SCREENW_RATE, 12*SCREENW_RATE)];
    placeholderL.text = @"请输入内容,严禁不良信息和广告";
    placeholderL.textColor = RGB(153, 153, 153);
    placeholderL.font = [UIFont systemFontOfSize:13];
    [textView addSubview:textTV];
    [textView addSubview:placeholderL];
    
    UIView *lineV1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(textTV.frame), SCREENW, 1)];
    lineV1.backgroundColor = RGB(221, 221, 221);
    [textView addSubview:lineV1];
    
    UIImageView *picImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(lineV1.frame)+13*SCREENW_RATE, 15*SCREENW_RATE, 15*SCREENW_RATE)];
    picImg.image = [UIImage imageNamed:@"tupian0"];
    [textView addSubview:picImg];
    
    UIButton *inputVoiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    inputVoiceBtn.frame = CGRectMake(290*SCREENW_RATE, CGRectGetMaxY(lineV1.frame)+15*SCREENW_RATE, 80*SCREENW_RATE, 15*SCREENW_RATE);
    [inputVoiceBtn setTitle:@"切换语音输入" forState:UIControlStateNormal];
    [inputVoiceBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateNormal];
    inputVoiceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [textView addSubview:inputVoiceBtn];
    
    UIImageView *addMore = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(textView.frame)+12*SCREENW_RATE, 71*SCREENW_RATE, 71*SCREENW_RATE)];
    addMore.image = [UIImage imageNamed:@"tianjiagengduo1"];
    [self.view addSubview:addMore];
    
    UIView *surePayView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(addMore.frame)+12*SCREENW_RATE, SCREENW, 45*SCREENW_RATE)];
    surePayView.backgroundColor = [UIColor whiteColor];
    UILabel *surePayL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 0, 100*SCREENW_RATE, 45*SCREENW_RATE)];
    surePayL.textColor = RGB(51, 51, 51);
    surePayL.font = [UIFont systemFontOfSize:15];
    surePayL.text = @"时限";
    surePayL.textAlignment = NSTextAlignmentLeft;
    [surePayView addSubview:surePayL];
    [self.view addSubview:surePayView];
    UILabel *freeL = [[UILabel alloc]initWithFrame:CGRectMake(318*SCREENW_RATE, 15*SCREENW_RATE, 50*SCREENW_RATE, 15*SCREENW_RATE)];
    ;
    freeL.text = @"请选择";
    freeL.textColor = RGB(102, 102, 102);
    freeL.font = [UIFont systemFontOfSize:13];
    [surePayView addSubview:freeL];
    
    UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    publishBtn.frame = CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(surePayView.frame)+179*SCREENW_RATE, 352*SCREENW_RATE, 45*SCREENW_RATE);
    publishBtn.backgroundColor = RGB(53, 195, 236);
    [publishBtn setTitle:@"支付并提问" forState:UIControlStateNormal];
    [publishBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    publishBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    publishBtn.layer.cornerRadius = 5.0f;
    publishBtn.layer.masksToBounds = YES;
    [self.view addSubview:publishBtn];

}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    placeholderL.text = @"";
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length == 0)
    {
        placeholderL.text = @"请输入内容,严禁不良信息和广告";
    }
    else
    {
        placeholderL.text = @"";
    }
}


- (void)back
{
    self.navigationController.navigationBar.hidden = YES;
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
