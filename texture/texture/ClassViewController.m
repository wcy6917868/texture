//
//  ClassViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/15.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "ClassViewController.h"
#import "RewardViewController.h"
#import "ShareViewController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface ClassViewController ()

@end

@implementation ClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)configNav
{
    [self setNavgationController];
    self.navigationController.navigationBar.barTintColor = RGB(245, 245, 245);
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10*SCREENW_RATE, 18*SCREENW_RATE)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left2"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.title = @"课堂 (上课中)";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(255, 255, 255)}];
    
    UIButton *rightBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn1.frame = CGRectMake(0, 0, 14*SCREENW_RATE, 14*SCREENW_RATE);
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"fenxiang"] forState:UIControlStateNormal];
    [rightBtn1 addTarget:self action:@selector(post) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn1];
    
}

- (void)configUI
{
    self.view.backgroundColor = RGB(245, 245, 245);
    
    UIImageView *blueBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 207*SCREENW_RATE)];
    blueBg.image = [UIImage imageNamed:@"bg4"];
    [self.view addSubview:blueBg];
    
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(167*SCREENW_RATE, 93*SCREENW_RATE, 41*SCREENW_RATE, 41*SCREENW_RATE)];
    headImg.image = [UIImage imageNamed:@"touxiang6"];
    [blueBg addSubview:headImg];
    
    UILabel *userNameL = [[UILabel alloc]init];
    UIFont *nameFont = [UIFont systemFontOfSize:15];
    userNameL.font = nameFont;
    userNameL.textColor = RGB(255, 255, 255);
    userNameL.text = @"豆浆油条";
    CGRect nameRect = [userNameL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:nameFont,NSFontAttributeName, nil] context:nil];
    userNameL.frame = CGRectMake(0, 0, nameRect.size.width, nameRect.size.height);
     userNameL.center = CGPointMake(CGRectGetMidX(blueBg.bounds), CGRectGetMaxY(headImg.frame)+20*SCREENW_RATE);
    [blueBg addSubview:userNameL];
    
    UIImageView *picImg = [[UIImageView alloc]initWithFrame:CGRectMake(345*SCREENW_RATE, blueBg.bounds.size.height - 24*SCREENW_RATE, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    picImg.image = [UIImage imageNamed:@"tupian1"];
    [blueBg addSubview:picImg];
    
    
    for (int i = 0; i < 6; i ++)
    {
        UILabel *courseL = [[UILabel alloc]init];
        courseL.backgroundColor = [UIColor whiteColor];
        UIFont *courseFont = [UIFont systemFontOfSize:13];
        courseL.textColor = RGB(53, 195, 236);
        courseL.font = courseFont;
        courseL.text = @"亲爱的小伙伴们,再过五分钟就要开课了,准备好哦~";
        CGRect courseRect = [courseL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:courseFont,NSFontAttributeName, nil] context:nil];
        courseL.frame = CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(blueBg.frame)+12+(i*(courseRect.size.height+12)), courseRect.size.width, courseRect.size.height);
        [self.view addSubview:courseL];
    }
    
    UILabel *rewardL = [[UILabel alloc]initWithFrame:CGRectMake(167*SCREENW_RATE, 604*SCREENW_RATE, 41*SCREENW_RATE, 41*SCREENW_RATE)];
    rewardL.backgroundColor = RGB(53, 195, 236);
    rewardL.font = [UIFont systemFontOfSize:17];
    rewardL.textColor = RGB(255, 255, 255);
    rewardL.userInteractionEnabled = YES;
    rewardL.text = @"赏";
    rewardL.textAlignment = NSTextAlignmentCenter;
    rewardL.layer.cornerRadius = 20.0f;
    rewardL.layer.masksToBounds = YES;
    UITapGestureRecognizer *rewardTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reward)];
    [rewardL addGestureRecognizer:rewardTap];
    [self.view addSubview:rewardL];
    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)post
{
    ShareViewController *shareVC = [[ShareViewController alloc]init];
    shareVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
    shareVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:shareVC animated:YES completion:nil];
}

- (void)reward
{
    RewardViewController *rewardVC = [[RewardViewController alloc]init];
    rewardVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
    rewardVC.modalPresentationStyle= UIModalPresentationOverFullScreen;
    [self presentViewController:rewardVC animated:YES completion:nil];
    
}

- (void)setNavgationController
{
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTranslucent:YES];
}

- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
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
