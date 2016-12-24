//
//  MycenterViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/1.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "MycenterViewController.h"
#import "FansViewController.h"
#import "AttentionViewController.h"
#import "PersonSetController.h"
#import "MyPublishController.h"
#import "ResponseController.h"
#import "MyCollectController.h"
#import "MyWalletController.h"
#import "QuizController.h"
#import "ExpertController.h"
#import "CourseController.h"
#import "SettingController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface MycenterViewController ()

@end

@implementation MycenterViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)configNav
{
    [self setNavgationController];
    self.navigationItem.title = @"个人中心";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(255, 255, 255)}];
}

- (void)configUI
{
#pragma mark 头像/关注/粉丝
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height);
//    self.view.backgroundColor = [UIColor whiteColor];
    scrollView.backgroundColor = RGB(238, 238, 238);
    [self.view addSubview:scrollView];
    
    UIImageView *backGroundView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, SCREENW, 236*SCREENW_RATE)];
    backGroundView.image = [UIImage imageNamed:@"bg3"];
    [scrollView addSubview:backGroundView];
    
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 96*SCREENW_RATE, 96*SCREENW_RATE)];
    headImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *infoTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeInfo)];
    [headImg addGestureRecognizer:infoTap];
    headImg.center = CGPointMake(CGRectGetMidX(self.view.frame), 50*SCREENW_RATE);
    headImg.image = [UIImage imageNamed:@"touxiang1"];
    [scrollView addSubview:headImg];
    
    UILabel *nameL = [[UILabel alloc]init];
    UIFont *nameTextFont = [UIFont systemFontOfSize:13];
    nameL.text = @"王强";
    nameL.font = nameTextFont;
    nameL.textColor = RGB(255, 255, 255);
    CGRect nameTextRect = [nameL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:nameTextFont,NSFontAttributeName, nil] context:nil];
    nameL.frame = CGRectMake(0, 0,nameTextRect.size.width, 15*SCREENW_RATE);
    nameL.center = CGPointMake(headImg.center.x, CGRectGetMaxY(headImg.frame)+20*SCREENW_RATE);
    [scrollView addSubview:nameL];
    
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    editBtn.frame = CGRectMake(CGRectGetMaxX(nameL.frame)+8*SCREENW_RATE, nameL.frame.origin.y , 12*SCREENW_RATE, 12*SCREENW_RATE);
    [editBtn setBackgroundImage:[UIImage imageNamed:@"xiugai0"] forState:UIControlStateNormal];
    [scrollView addSubview:editBtn];
    
    UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nameL.frame)+6*SCREENW_RATE, SCREENW, 41*SCREENW_RATE)];
    alphaView.backgroundColor = [UIColor colorWithRed:34/255 green:34/255 blue:34/255 alpha:0.4];
    [scrollView addSubview:alphaView];
    
    UIImageView *loveImg = [[UIImageView alloc]initWithFrame:CGRectMake(62*SCREENW_RATE, 15*SCREENW_RATE, 14*SCREENW_RATE, 12*SCREENW_RATE)];
    loveImg.image = [UIImage imageNamed:@"guanzhu0"];
    [alphaView addSubview:loveImg];
    
    UILabel *attentionL = [[UILabel alloc]init];
    UIFont *attentionFont = [UIFont systemFontOfSize:12];
    NSString *attentionNum = @"636";
    attentionL.userInteractionEnabled = YES;
    attentionL.text = [NSString stringWithFormat:@"关注%@",attentionNum];
    attentionL.font = nameTextFont;
    attentionL.textColor = RGB(255, 255, 255);
    CGRect attentionRect = [attentionL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:attentionFont,NSFontAttributeName, nil] context:nil];
    attentionL.frame = CGRectMake(CGRectGetMaxX(loveImg.frame)+6*SCREENW_RATE , loveImg.frame.origin.y - 3,attentionRect.size.width+20, 20*SCREENW_RATE);
    UITapGestureRecognizer *attentionTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(attention)];
    [attentionL addGestureRecognizer:attentionTap];
    [alphaView addSubview:attentionL];
    
    UIView *fengeLine = [[UIView alloc]initWithFrame:CGRectMake(SCREENW/2
, 11*SCREENW_RATE, 1, 19*SCREENW_RATE)];
    fengeLine.backgroundColor = RGB(221, 221, 221);
    [alphaView addSubview:fengeLine];
    
    UIImageView *fansImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(fengeLine.frame)+60*SCREENW_RATE, loveImg.frame.origin.y, 17*SCREENW_RATE, 14*SCREENW_RATE)];
    fansImg.image = [UIImage imageNamed:@"fensi0"];
    [alphaView addSubview:fansImg];
    
    UILabel *fansL = [[UILabel alloc]init];
    UIFont *fansFont = [UIFont systemFontOfSize:12];
    fansL.userInteractionEnabled = YES;
    NSString *fansNum = @"1665";
    fansL.text = [NSString stringWithFormat:@"粉丝%@",fansNum];
    fansL.font = fansFont;
    fansL.textColor = RGB(255, 255, 255);
    CGRect fansRect = [fansL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:fansFont,NSFontAttributeName, nil] context:nil];
    fansL.frame = CGRectMake(CGRectGetMaxX(fansImg.frame)+6*SCREENW_RATE , loveImg.frame.origin.y - 3,fansRect.size.width, 20*SCREENW_RATE);
    UITapGestureRecognizer *fansTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fans)];
    [fansL addGestureRecognizer:fansTap];
    [alphaView addSubview:fansL];
    
    NSArray *titleArr  = @[@"发布",@"提问",@"回答"];
    NSArray *numArr = @[@"357",@"35",@"60"];
    UITapGestureRecognizer *pubilshTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(publish)];
    UITapGestureRecognizer *askTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ask)];
    UITapGestureRecognizer *answerTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(answer)];
    NSArray *tapArray = @[pubilshTap,askTap,answerTap];
    for (int i = 0; i < 3; i ++)
    {
        UIView *functionView = [[UIView alloc]initWithFrame:CGRectMake(SCREENW/3*i, CGRectGetMaxY(backGroundView.frame), SCREENW/3, 48*SCREENW_RATE)];
        functionView.userInteractionEnabled = YES;
        functionView.backgroundColor = [UIColor whiteColor];
        [functionView addGestureRecognizer:tapArray[i]];
        functionView.tag = 100 + i;
        
        UILabel *numL = [[UILabel alloc]initWithFrame:CGRectMake(0, 11*SCREENW_RATE, functionView.bounds.size.width, 12*SCREENW_RATE)];
        numL.font = [UIFont systemFontOfSize:15];
        numL.textColor = RGB(52, 52, 52);
        numL.text = numArr[i];
        numL.textAlignment = NSTextAlignmentCenter;
        [functionView addSubview:numL];
        
        UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(numL.frame)+5*SCREENW_RATE, numL.frame.size.width, 12*SCREENW_RATE)];
        titleL.font = [UIFont systemFontOfSize:12];
        titleL.textColor = RGB(52, 52, 52);
        titleL.textAlignment = NSTextAlignmentCenter;
        titleL.text = titleArr[i];
        [functionView addSubview:titleL];
        
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(123*SCREENW_RATE, 7*SCREENW_RATE, 1, 34*SCREENW_RATE)];
        lineV.backgroundColor = RGB(221, 221, 221);
        [functionView addSubview:lineV];
        [scrollView addSubview:functionView];
}
#pragma mark 收藏/设置/钱包....
    UIView *fucV = [scrollView viewWithTag:100];
    UIView *myCollectView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(fucV.frame)+12*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    myCollectView.backgroundColor = [UIColor whiteColor];
    myCollectView.userInteractionEnabled = YES;
    UITapGestureRecognizer *collectTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myCollect)];
    [myCollectView addGestureRecognizer:collectTap];
    UIImageView *collectImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 16*SCREENW_RATE, 16*SCREENW_RATE)];
    collectImg.image = [UIImage imageNamed:@"wodeshoucang0"];
    [myCollectView addSubview:collectImg];
    
    UILabel *collectL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(collectImg.frame)+12*SCREENW_RATE, collectImg.frame.origin.y+2*SCREENW_RATE, 80*SCREENW_RATE, 15*SCREENW_RATE)];
    collectL.textColor = RGB(51, 51, 51);
    collectL.font = [UIFont systemFontOfSize:15];
    collectL.text = @"我的收藏";
    [myCollectView addSubview:collectL];
    
    UILabel *collectNum = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW/3*2, collectL.frame.origin.y, 100*SCREENW_RATE, 15)];
    collectNum.font = [UIFont systemFontOfSize:14];
    collectNum.textColor = RGB(102, 102, 102);
    collectNum.text = @"31个";
    collectNum.textAlignment = NSTextAlignmentRight;
    [myCollectView addSubview:collectNum];
    
    UIImageView *arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(collectNum.frame)+8*SCREENW_RATE, collectNum.frame.origin.y+2, 8*SCREENW_RATE, 15*SCREENW_RATE)];
    arrowImg.image = [UIImage imageNamed:@"arrow_right0"];
    [myCollectView addSubview:arrowImg];
    [scrollView addSubview:myCollectView];
    
    UIView *myWalletView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(myCollectView.frame)+1*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    myWalletView.backgroundColor = [UIColor whiteColor];
    myWalletView.userInteractionEnabled = YES;
    UITapGestureRecognizer *walletTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkMoney)];
    [myWalletView addGestureRecognizer:walletTap];
    UIImageView *walletImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 16*SCREENW_RATE, 16*SCREENW_RATE)];
    walletImg.image = [UIImage imageNamed:@"wodeqianbao0"];
    [myWalletView addSubview:walletImg];
    
    UILabel *walletL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(walletImg.frame)+12*SCREENW_RATE, walletImg.frame.origin.y+2*SCREENW_RATE, 80*SCREENW_RATE, 15*SCREENW_RATE)];
    walletL.textColor = RGB(51, 51, 51);
    walletL.font = [UIFont systemFontOfSize:15];
    walletL.text = @"我的钱包";
    [myWalletView addSubview:walletL];
    
    UILabel *walletNum = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW/3*2, walletL.frame.origin.y, 100*SCREENW_RATE, 15)];
    walletNum.font = [UIFont systemFontOfSize:14];
    walletNum.textColor = RGB(102, 102, 102);
    walletNum.text = @"¥250";
    walletNum.textAlignment = NSTextAlignmentRight;
    [myWalletView addSubview:walletNum];
    
    UIImageView *arrowImg1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(walletNum.frame)+8*SCREENW_RATE, walletNum.frame.origin.y+2, 8*SCREENW_RATE, 15*SCREENW_RATE)];
    arrowImg1.image = [UIImage imageNamed:@"arrow_right0"];
    [myWalletView addSubview:arrowImg1];
    [scrollView addSubview:myWalletView];
    
    UIView *myExpert = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(myWalletView.frame)+1*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    myExpert.backgroundColor = [UIColor whiteColor];
    myExpert.userInteractionEnabled = YES;
    UITapGestureRecognizer *expertTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myExpert)];
    [myExpert addGestureRecognizer:expertTap];
    UIImageView *expertImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 16*SCREENW_RATE, 16*SCREENW_RATE)];
    expertImg.image = [UIImage imageNamed:@"wodezhuanjia0"];
    [myExpert addSubview:expertImg];
    
    UILabel *expertL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(expertImg.frame)+12*SCREENW_RATE, expertImg.frame.origin.y+2*SCREENW_RATE, 80*SCREENW_RATE, 15*SCREENW_RATE)];
    expertL.textColor = RGB(51, 51, 51);
    expertL.font = [UIFont systemFontOfSize:15];
    expertL.text = @"我的专家";
    [myExpert addSubview:expertL];
    
    UIImageView *arrowImg2 = [[UIImageView alloc]initWithFrame:CGRectMake(355*SCREENW_RATE, expertL.frame.origin.y, 8*SCREENW_RATE, 15*SCREENW_RATE)];
    arrowImg2.image = [UIImage imageNamed:@"arrow_right0"];
    [myExpert addSubview:arrowImg2];
    [scrollView addSubview:myExpert];
    
    UIView *courseView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(myExpert.frame)+12*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    courseView.backgroundColor = [UIColor whiteColor];
    courseView.userInteractionEnabled = YES;
    UITapGestureRecognizer *courseTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkMyCourse)];
    [courseView addGestureRecognizer:courseTap];
    UIImageView *courseImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 16*SCREENW_RATE, 16*SCREENW_RATE)];
    courseImg.image = [UIImage imageNamed:@"ketang0"];
    [courseView addSubview:courseImg];
    
    UILabel *courseL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(courseImg.frame)+12*SCREENW_RATE, expertImg.frame.origin.y+2*SCREENW_RATE, 80*SCREENW_RATE, 15*SCREENW_RATE)];
    courseL.textColor = RGB(51, 51, 51);
    courseL.font = [UIFont systemFontOfSize:15];
    courseL.text = @"课堂";
    [courseView addSubview:courseL];
    
    UIImageView *arrowImg3 = [[UIImageView alloc]initWithFrame:CGRectMake(355*SCREENW_RATE, courseL.frame.origin.y, 8*SCREENW_RATE, 15*SCREENW_RATE)];
    arrowImg3.image = [UIImage imageNamed:@"arrow_right0"];
    [courseView addSubview:arrowImg3];
    [scrollView addSubview:courseView];
    
    UIView *settingView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(courseView.frame)+12*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    settingView.backgroundColor = [UIColor whiteColor];
    settingView.userInteractionEnabled = YES;
    UITapGestureRecognizer *setTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goSetting)];
    [settingView addGestureRecognizer:setTap];
    
    UIImageView *settingImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 16*SCREENW_RATE, 16*SCREENW_RATE)];
    settingImg.image = [UIImage imageNamed:@"shezhi0"];
    [settingView addSubview:settingImg];
    
    UILabel *settingL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(settingImg.frame)+12*SCREENW_RATE, settingImg.frame.origin.y+2*SCREENW_RATE, 80*SCREENW_RATE, 15*SCREENW_RATE)];
    settingL.textColor = RGB(51, 51, 51);
    settingL.font = [UIFont systemFontOfSize:15];
    settingL.text = @"设置";
    [settingView addSubview:settingL];
    
    UIImageView *arrowImg4 = [[UIImageView alloc]initWithFrame:CGRectMake(355*SCREENW_RATE, settingL.frame.origin.y, 8*SCREENW_RATE, 15*SCREENW_RATE)];
    arrowImg4.image = [UIImage imageNamed:@"arrow_right0"];
    [settingView addSubview:arrowImg4];
    [scrollView addSubview:settingView];
    
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

- (void)changeInfo
{
    PersonSetController *PEC = [[PersonSetController alloc]init];
    [self.navigationController pushViewController:PEC animated:YES];
}

- (void)attention
{
    AttentionViewController *attentionVC = [[AttentionViewController alloc]init];
    [self.navigationController pushViewController:attentionVC animated:YES];
}

- (void)fans
{
    FansViewController *fansVC = [[FansViewController alloc]init];
    [self.navigationController pushViewController:fansVC animated:YES];
}

- (void)publish
{
    MyPublishController *publicVC = [[MyPublishController alloc]init];
    [self.navigationController pushViewController:publicVC animated:YES];
}

- (void)ask
{
    QuizController *quizVC = [[QuizController alloc]init];
    [self.navigationController pushViewController:quizVC animated:YES];
}

- (void)answer
{
    ResponseController *responseVC = [[ResponseController alloc]init];
    [self.navigationController pushViewController:responseVC animated:YES];
}

- (void)myCollect
{
    MyCollectController *collectVC = [[MyCollectController alloc]init];
    [self.navigationController pushViewController:collectVC animated:YES];
}

- (void)checkMoney
{
    MyWalletController *walletVC = [[MyWalletController alloc]init];
    [self.navigationController pushViewController:walletVC animated:YES];
}

- (void)myExpert
{
    ExpertController *expertVC = [[ExpertController alloc]init];
    [self.navigationController pushViewController:expertVC animated:YES];
}

- (void)checkMyCourse
{
    CourseController *courseVC = [[CourseController alloc]init];
    [self.navigationController pushViewController:courseVC animated:YES];
}

- (void)goSetting
{
    
    SettingController *setVC = [[SettingController alloc]init];
    [self.navigationController pushViewController:setVC animated:YES];
    
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
