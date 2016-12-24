//
//  InvitationDetailViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/11.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "InvitationDetailViewController.h"
#import "InvitationDetailCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]


@interface InvitationDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *tableHeadView;
}
@property (nonatomic,strong)UITableView *tableV;
@end

@implementation InvitationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)configNav
{
    [self setNavgationController];
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10*SCREENW_RATE, 18*SCREENW_RATE)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left2"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.title = @"社群主页";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(255, 255, 255)}];
    
    UIButton *rightBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn1.frame = CGRectMake(0, 0, 15*SCREENW_RATE, 15*SCREENW_RATE);
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"wujiaoxing--notouch"] forState:UIControlStateNormal];
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"wujiaoxing--touch"] forState:UIControlStateSelected];
    [rightBtn1 addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"fenxiang"] forState:UIControlStateNormal];
    rightBtn2.frame = CGRectMake(0, 0, 14*SCREENW_RATE, 14*SCREENW_RATE);
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn1];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn2];
    UIBarButtonItem *fix = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fix.width = 20;
    NSArray *rightButtons = @[item2,fix,item1];
    self.navigationItem.rightBarButtonItems = rightButtons;
    
    
}

- (void)configUI
{
    self.view.backgroundColor = RGB(238, 238, 238);
    
    tableHeadView = [[UIView alloc]init];
    
    UIImageView *blueBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, SCREENW, 140*SCREENW_RATE)];
    blueBg.image = [UIImage imageNamed:@"bg1"];
    [tableHeadView addSubview:blueBg];
    
    UILabel *textL = [[UILabel alloc]init];
    UIFont *textFont = [UIFont systemFontOfSize:15];
    textL.textColor = RGB(255, 255, 255);
    textL.numberOfLines = 0;
    textL.text = @"等闲识得东风面,万紫千红总是春";
    textL.font = textFont;
    CGRect textRect = [textL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName, nil] context:nil];
    textL.frame = CGRectMake(12*SCREENW_RATE, 70*SCREENW_RATE, textRect.size.width, textRect.size.height);
    [blueBg addSubview:textL];
    
    UILabel *dateL = [[UILabel alloc]initWithFrame:CGRectMake(291*SCREENW_RATE, CGRectGetMaxY(textL.frame)+6*SCREENW_RATE, 80*SCREENW_RATE, 13*SCREENW_RATE)];
    dateL.textColor = RGB(255, 255, 255);
    dateL.font = [UIFont systemFontOfSize:13*SCREENW_RATE];
    dateL.text = @"2016.10.16";
    [blueBg addSubview:dateL];
    
    UIView *bigTextBg = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 65*SCREENW_RATE, 352*SCREENW_RATE, 300*SCREENW_RATE)];
    bigTextBg.backgroundColor = [UIColor whiteColor];
    bigTextBg.layer.cornerRadius = 5.0f;
    bigTextBg.layer.masksToBounds = YES;
    [tableHeadView addSubview:bigTextBg];
    
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 46*SCREENW_RATE, 46*SCREENW_RATE)];
    headImg.center = CGPointMake(CGRectGetMidX(self.view.frame), bigTextBg.frame.origin.y);
    headImg.image = [UIImage imageNamed:@"touxiang8"];
    [tableHeadView addSubview:headImg];
    
    UILabel *topicTitleL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200*SCREENW_RATE, 15*SCREENW_RATE)];
    topicTitleL.textColor = RGB(51, 51, 51);
    topicTitleL.font = [UIFont systemFontOfSize:13*SCREENW_RATE];
    topicTitleL.center = CGPointMake(CGRectGetMidX(bigTextBg.bounds), 40*SCREENW_RATE);
    topicTitleL.textAlignment = NSTextAlignmentCenter;
    topicTitleL.text = @"最长的电影";
    [bigTextBg addSubview:topicTitleL];
    
    UILabel *articleL = [[UILabel alloc]init];
    UIFont *articleFont = [UIFont systemFontOfSize:13*SCREENW_RATE];
    articleL.font = articleFont;
    articleL.numberOfLines = 0;
    articleL.textColor = RGB(102, 102, 102);
    articleL.text = @"这首七言诗是宋 朱熹所作,其中万紫千红总是春一句为名句";
    CGRect articleRect = [articleL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:articleFont,NSFontAttributeName, nil] context:nil];
    articleL.frame = CGRectMake(13*SCREENW_RATE, CGRectGetMaxY(topicTitleL.frame)+13*SCREENW_RATE, bigTextBg.frame.size.width - 26*SCREENW_RATE, articleRect.size.height);
    [bigTextBg addSubview:articleL];
    
    UIButton *unfoldBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unfoldBtn.frame = CGRectMake(154*SCREENW_RATE, 280*SCREENW_RATE, 40*SCREENW_RATE, 14*SCREENW_RATE);
    unfoldBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [unfoldBtn setTitle:@"展开 " forState:UIControlStateNormal];
    [unfoldBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateNormal];
    [bigTextBg addSubview:unfoldBtn];
    
    UIImageView *admireImg = [[UIImageView alloc]initWithFrame:CGRectMake(290*SCREENW_RATE, 278*SCREENW_RATE, 13*SCREENW_RATE, 13*SCREENW_RATE)];
    admireImg.image = [UIImage imageNamed:@"dianzan1@2x"];
    [bigTextBg addSubview:admireImg];
    
    UILabel *admireNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(admireImg.frame)+11*SCREENW_RATE, admireImg.frame.origin.y+2*SCREENW_RATE, 30*SCREENW_RATE, 13*SCREENW_RATE)];
    admireNumL.textColor = RGB(51, 51, 51);
    admireNumL.font = [UIFont systemFontOfSize:13];
    admireNumL.text = @"3.5K";
    [bigTextBg addSubview:admireNumL];
    
    UIImageView *rewardBg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(bigTextBg.frame)+12*SCREENW_RATE, 352*SCREENW_RATE, 90*SCREENW_RATE)];
    rewardBg.image = [UIImage imageNamed:@"bg0"];
    [tableHeadView addSubview:rewardBg];
    
    UIImageView *admireV = [[UIImageView alloc]initWithFrame:CGRectMake(154*SCREENW_RATE, 10*SCREENW_RATE, 41*SCREENW_RATE, 41*SCREENW_RATE)];
    admireV.image = [UIImage imageNamed:@"tuoyuan0"];
    [rewardBg addSubview:admireV];
    UILabel *admireL = [[UILabel alloc]initWithFrame:CGRectMake(154*SCREENW_RATE, 10*SCREENW_RATE, 41*SCREENW_RATE, 41*SCREENW_RATE)];
    admireL.font = [UIFont systemFontOfSize:20*SCREENW_RATE];
    admireL.textColor = RGB(53, 195, 236);
    admireL.text = @"赏";
    admireL.textAlignment = NSTextAlignmentCenter;
    [rewardBg addSubview:admireL];
    
    NSArray *littleHeadArr = @[@"xiaotouxiang0",@"xiaotouxiang1",@"xiaotouxiang2",@"xiaotouxiang3",@"xiaotouxiang4"];
    for (int i = 0; i < 5; i ++)
    {
        UIImageView *memberImg = [[UIImageView alloc]initWithFrame:CGRectMake(122 + 12*i, CGRectGetMaxY(admireV.frame)+10*SCREENW_RATE, 16*SCREENW_RATE, 16*SCREENW_RATE)];
        memberImg.image = [UIImage imageNamed:littleHeadArr[i]];
        memberImg.tag = 10 + i;
        [rewardBg addSubview:memberImg];
    }
    
    UIImageView *imageV = [rewardBg viewWithTag:14];
    UILabel *memberNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageV.frame)+10*SCREENW_RATE, CGRectGetMaxY(admireV.frame)+13*SCREENW_RATE, 100*SCREENW_RATE, 10)];
    memberNumL.font = [UIFont systemFontOfSize:10*SCREENW_RATE];
    memberNumL.textColor = RGB(255, 255, 255);
    memberNumL.textAlignment = NSTextAlignmentLeft;
    memberNumL.text = @"342 成员 >>";
    [rewardBg addSubview:memberNumL];
    
    UIView *conmentView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(rewardBg.frame)+12*SCREENW_RATE, SCREENW, 45*SCREENW_RATE)];
    conmentView.backgroundColor = [UIColor whiteColor];
    [tableHeadView addSubview:conmentView];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 13*SCREENW_RATE, 2*SCREENW_RATE, 21*SCREENW_RATE)];
    lineV.backgroundColor = RGB(53, 195, 236);
    [conmentView addSubview:lineV];
    
    UILabel *conmentL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lineV.frame)+12*SCREENW_RATE, 16*SCREENW_RATE, 40*SCREENW_RATE, 15*SCREENW_RATE)];
    conmentL.textColor = RGB(51, 51, 51);
    conmentL.font = [UIFont systemFontOfSize:15*SCREENW_RATE];
    conmentL.text = @"评论";
    [conmentView addSubview:conmentL];
    
    UILabel *conmentNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentL.frame)+12*SCREENW_RATE, conmentL.frame.origin.y, 80*SCREENW_RATE, 15*SCREENW_RATE)];
    conmentNumL.textAlignment = NSTextAlignmentLeft;
    conmentNumL.textColor = RGB(102, 102, 102);
    conmentNumL.text = @"(566)";
    [conmentView addSubview:conmentNumL];
    
    UIView *fengeLine = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(conmentView.frame)-1 , SCREENW,1 )];
    fengeLine.backgroundColor = RGB(221, 221, 221);
    [tableHeadView addSubview:fengeLine];
    
    tableHeadView.frame = CGRectMake(0, -64, SCREENW, CGRectGetMaxY(conmentView.frame));
    self.tableV.tableHeaderView = tableHeadView;
    [self.view addSubview:self.tableV];
    
}

- (UITableView *)tableV
{
    if (!_tableV)
    {
        _tableV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.separatorStyle = NO;
        _tableV.backgroundColor = RGB(238, 238, 238);
    }
    return _tableV;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 113*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellid";
    InvitationDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[InvitationDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)collect:(UIButton *)selectedBtn
{
    
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
