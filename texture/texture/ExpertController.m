//
//  ExpertController.m
//  texture
//
//  Created by 王澄宇 on 16/12/16.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "ExpertController.h"
#import "SelfIntroductionController.h"
#import "QuickAnswerController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface ExpertController ()

@end

@implementation ExpertController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)configNav
{
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10*SCREENW_RATE, 18*SCREENW_RATE)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left2"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
}

- (void)configUI
{

    self.view.backgroundColor = RGB(238, 238, 238);
    
    UIImageView *backGroundImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 243*SCREENW_RATE)];
    backGroundImg.image = [UIImage imageNamed:@"bg4@2x"];
    [self.view addSubview:backGroundImg];
    
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(162*SCREENW_RATE, 63*SCREENW_RATE, 51*SCREENW_RATE, 51*SCREENW_RATE)];
    headImg.image = [UIImage imageNamed:@"touxiang4"];
    [backGroundImg addSubview:headImg];
    
    UILabel *nameL = [[UILabel alloc]init];
    UIFont *nameFont = [UIFont systemFontOfSize:15];
    nameL.font = nameFont;
    nameL.textColor = RGB(255, 255, 255);
    nameL.text = @"豆浆油条";
    CGRect nameText = [nameL.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 15*SCREENW_RATE) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:nameFont,NSFontAttributeName, nil] context:nil];
    nameL.frame = CGRectMake(0, 0, nameText.size.width, 15*SCREENW_RATE);
    nameL.center = CGPointMake(SCREENW/2, CGRectGetMaxY(headImg.frame)+18*SCREENW_RATE);
    [backGroundImg addSubview:nameL];
    
    UIImageView *iconImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameL.frame)+3*SCREENW_RATE, nameL.frame.origin.y+2,15*SCREENW_RATE,11*SCREENW_RATE)];
    iconImg.image = [UIImage imageNamed:@"boshimao0"];
    [backGroundImg addSubview:iconImg];
    
    UILabel *textL = [[UILabel alloc]initWithFrame:CGRectMake(73*SCREENW_RATE, CGRectGetMaxY(nameL.frame)+16*SCREENW_RATE, 61*SCREENW_RATE, 20*SCREENW_RATE)];
    textL.textColor = RGB(255, 255, 255);
    textL.layer.borderColor = RGB(255, 255, 255).CGColor;
    textL.layer.borderWidth = 0.5f;
    textL.textAlignment = NSTextAlignmentCenter;
    textL.text = @"专家";
    [backGroundImg addSubview:textL];
    
    UILabel *textL1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(textL.frame)+12*SCREENW_RATE, CGRectGetMaxY(nameL.frame)+16*SCREENW_RATE, 61*SCREENW_RATE, 20*SCREENW_RATE)];
    textL1.textColor = RGB(255, 255, 255);
    textL1.layer.borderColor = RGB(255, 255, 255).CGColor;
    textL1.layer.borderWidth = 0.5f;
    textL1.textAlignment = NSTextAlignmentCenter;
    textL1.text = @"标签";
    [backGroundImg addSubview:textL1];
    
    UILabel *textL2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(textL1.frame)+12*SCREENW_RATE, CGRectGetMaxY(nameL.frame)+16*SCREENW_RATE, 86*SCREENW_RATE, 20*SCREENW_RATE)];
    textL2.textColor = RGB(255, 255, 255);
    textL2.layer.borderColor = RGB(255, 255, 255).CGColor;
    textL2.layer.borderWidth = 0.5f;
    textL2.text = @"自然生态";
    textL2.textAlignment = NSTextAlignmentCenter;
    [backGroundImg addSubview:textL2];
    
    UIImageView *editImg = [[UIImageView alloc]initWithFrame:CGRectMake(157*SCREENW_RATE, CGRectGetMaxY(headImg.frame)+78*SCREENW_RATE, 12*SCREENW_RATE, 12*SCREENW_RATE)];
    editImg.image = [UIImage imageNamed:@"xiugai"];
    [backGroundImg addSubview:editImg];
    
    UILabel *editL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(editImg.frame)+8*SCREENW_RATE, editImg.frame.origin.y, 41*SCREENW_RATE, 12*SCREENW_RATE)];
    editL.textColor = RGB(255, 255, 255);
    editL.text = @"编辑标签";
    editL.font = [UIFont systemFontOfSize:10];
    [backGroundImg addSubview:editL];
    
    UIView *personIntroV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(backGroundImg.frame)+13*SCREENW_RATE, SCREENW, 44*SCREENW_RATE)];
    personIntroV.userInteractionEnabled = YES;
    UITapGestureRecognizer *selfIntroTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selfIntro)];
    [personIntroV addGestureRecognizer:selfIntroTap];
    personIntroV.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:personIntroV];
    
    UILabel *introL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 15*SCREENW_RATE, 70*SCREENW_RATE, 15*SCREENW_RATE)];
    introL.textColor = RGB(51, 51, 51);
    introL.text = @"个人介绍";
    introL.font = [UIFont systemFontOfSize:15];
    [personIntroV addSubview:introL];
    
    UIImageView *arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(353*SCREENW_RATE, 13*SCREENW_RATE, 11*SCREENW_RATE, 18*SCREENW_RATE)];
    arrowImg.image = [UIImage imageNamed:@"arrow_right1"];
    [personIntroV addSubview:arrowImg];
    
    UIView *quickAnswer = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(personIntroV.frame)+13*SCREENW_RATE, SCREENW, 44*SCREENW_RATE)];
    quickAnswer.backgroundColor = RGB(255, 255, 255);
    quickAnswer.userInteractionEnabled = YES;
    UITapGestureRecognizer *quickTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quickAnswer)];
    [quickAnswer addGestureRecognizer:quickTap];
    [self.view addSubview:quickAnswer];
    
    UILabel *quickL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 15*SCREENW_RATE, 70*SCREENW_RATE, 15*SCREENW_RATE)];
    quickL.textColor = RGB(51, 51, 51);
    quickL.text = @"快速回答";
    quickL.font = [UIFont systemFontOfSize:15];
    [quickAnswer addSubview:quickL];
    
    UIImageView *arrowImg1 = [[UIImageView alloc]initWithFrame:CGRectMake(353*SCREENW_RATE, 13*SCREENW_RATE, 11*SCREENW_RATE, 18*SCREENW_RATE)];
    arrowImg1.image = [UIImage imageNamed:@"arrow_right1"];
    [quickAnswer addSubview:arrowImg1];
}

- (void)selfIntro
{
    SelfIntroductionController *introVC = [[SelfIntroductionController alloc]init];
    [self.navigationController pushViewController:introVC animated:YES];
}

- (void)quickAnswer
{
    QuickAnswerController *quickVC = [[QuickAnswerController alloc]init];
    [self.navigationController pushViewController:quickVC animated:YES];
}

- (void)back
{
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
