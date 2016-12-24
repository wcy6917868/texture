//
//  CourseDetailViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/15.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "ClassViewController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface CourseDetailViewController ()

@end

@implementation CourseDetailViewController

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
    
    UIButton *rightBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn1.frame = CGRectMake(0, 0, 14*SCREENW_RATE, 14*SCREENW_RATE);
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"fenxiang"] forState:UIControlStateNormal];
    [rightBtn1 addTarget:self action:@selector(post) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"diandiandian1"] forState:UIControlStateNormal];
    rightBtn2.frame = CGRectMake(0, 0, 3*SCREENW_RATE, 18*SCREENW_RATE);
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn1];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn2];
    UIBarButtonItem *fix = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fix.width = 20;
    NSArray *rightButtons = @[item2,fix,item1];
    self.navigationItem.rightBarButtonItems = rightButtons;

}

- (void)configUI
{
    self.view.backgroundColor = RGB(255, 255, 255);
    
    UIImageView *blueBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 150*SCREENW_RATE)];
    blueBg.image = [UIImage imageNamed:@"bg4@2x"];
    [ self.view addSubview:blueBg];
    
    UILabel *courseTitleL = [[UILabel alloc]init];
    UIFont *titleFont = [UIFont systemFontOfSize:15];
    courseTitleL.font = titleFont;
    courseTitleL.text = @"如何更好的拍摄到美景";
    courseTitleL.textColor = RGB(255, 255, 255);
    CGRect titleRect = [courseTitleL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:titleFont,NSFontAttributeName, nil] context:nil];
    courseTitleL.frame = CGRectMake(0, 0, titleRect.size.width, titleRect.size.height);
    courseTitleL.center = CGPointMake(CGRectGetMidX(blueBg.bounds), 78*SCREENW_RATE);
    [blueBg addSubview:courseTitleL];
    
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(139*SCREENW_RATE, CGRectGetMaxY(courseTitleL.frame)+32*SCREENW_RATE, 24*SCREENW_RATE, 24*SCREENW_RATE)];
    headImg.image = [UIImage imageNamed:@"touxiang4"];
    [blueBg addSubview:headImg];
    
    UILabel *userNameL = [[UILabel alloc]init];
    UIFont *userFont = [UIFont systemFontOfSize:15];
    userNameL.font = titleFont;
    userNameL.text = @"豆浆油条";
    userNameL.textColor = RGB(255, 255, 255);
    CGRect userRect = [courseTitleL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:userFont,NSFontAttributeName, nil] context:nil];
    userNameL.frame = CGRectMake(CGRectGetMaxX(headImg.frame)+13*SCREENW_RATE, headImg.frame.origin.y + 3, userRect.size.width, userRect.size.height);
    [blueBg addSubview:userNameL];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(blueBg.frame), SCREENW, SCREENH)];
    //scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height*2    );
    scrollView.backgroundColor = RGB(238, 238, 238);
    [self.view addSubview:scrollView];
    
    UIView *classTimeV = [[UIView alloc]initWithFrame:CGRectMake(0, 13*SCREENW_RATE, SCREENW, 45*SCREENW_RATE)];
    classTimeV.backgroundColor = RGB(255, 255, 255);
    [scrollView addSubview:classTimeV];
    
    UIImageView *clockImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 16*SCREENW_RATE, 14*SCREENW_RATE, 14*SCREENW_RATE)];
    clockImg.image = [UIImage imageNamed:@"read0"];
    [classTimeV addSubview:clockImg];
    
    UILabel *colckL  = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(clockImg.frame)+10*SCREENW_RATE, 16*SCREENW_RATE, 70*SCREENW_RATE, 15*SCREENW_RATE)];
    colckL.textColor = RGB(51, 51, 51);
    colckL.font = [UIFont systemFontOfSize:15];
    colckL.text = @"开课时间";
    [classTimeV addSubview:colckL];
    
    UILabel *timeL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(colckL.frame)+92*SCREENW_RATE, 17*SCREENW_RATE, 180*SCREENW_RATE, 15*SCREENW_RATE)];
    timeL.font = [UIFont systemFontOfSize:13];
    timeL.text = @"2016.10.22  20:00  (进行中)";
    timeL.textColor = RGB(53, 195, 236);
    [classTimeV addSubview:timeL];
    
    UIView *introduceV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(classTimeV.frame)+12*SCREENW_RATE, SCREENW, 87*SCREENW_RATE)];
    introduceV.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:introduceV];
    
    UILabel *expertIntroL = [[UILabel alloc]initWithFrame:CGRectMake(158*SCREENW_RATE, 13*SCREENW_RATE, 65*SCREENW_RATE, 15*SCREENW_RATE)];
    expertIntroL.font = [UIFont systemFontOfSize:15];
    expertIntroL.textColor = RGB(51, 51, 51);
    expertIntroL.text = @"专家介绍";
    [introduceV addSubview:expertIntroL];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(172*SCREENW_RATE, CGRectGetMaxY(expertIntroL.frame)+6*SCREENW_RATE, 31*SCREENW_RATE, 2*SCREENW_RATE)];
    lineV.backgroundColor = RGB(53, 195, 236);
    [introduceV addSubview:lineV];
    
    UILabel *textL = [[UILabel alloc]init];
    UIFont *textFont = [UIFont systemFontOfSize:13];
    textL.font = textFont;
    textL.textColor = RGB(102, 102, 102);
    textL.numberOfLines = 0;
    textL.text = @"本人于12年初开始从事摄像,摄影,4年以上互联网运营推广经验,丰富的实战经验.现负责运营推广工作.";
    CGRect textRect = [textL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName, nil] context:nil];
    textL.frame = CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+12*SCREENW_RATE, 345*SCREENW_RATE, textRect.size.height);
    [introduceV addSubview:textL];
    
    introduceV.frame = CGRectMake(0, CGRectGetMaxY(classTimeV.frame)+12*SCREENW_RATE, SCREENW, CGRectGetMaxY(textL.frame)+12*SCREENW_RATE);
    
    UIView *classIntroduceV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(introduceV.frame)+12*SCREENW_RATE, SCREENW, 800*SCREENW_RATE)];
    classIntroduceV.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:classIntroduceV];
    
    UILabel *classIntroL = [[UILabel alloc]initWithFrame:CGRectMake(158*SCREENW_RATE, 13*SCREENW_RATE, 65*SCREENW_RATE, 15*SCREENW_RATE)];
    classIntroL.font = [UIFont systemFontOfSize:15];
    classIntroL.textColor = RGB(51, 51, 51);
    classIntroL.text = @"专家介绍";
    [classIntroduceV addSubview:classIntroL];
    
    UIView *lineV1 = [[UIView alloc]initWithFrame:CGRectMake(172*SCREENW_RATE, CGRectGetMaxY(classIntroL.frame)+6*SCREENW_RATE, 31*SCREENW_RATE, 2*SCREENW_RATE)];
    lineV1.backgroundColor = RGB(53, 195, 236);
    [classIntroduceV addSubview:lineV1];
    
    UILabel *textL1 = [[UILabel alloc]init];
    UIFont *text1Font = [UIFont systemFontOfSize:13];
    textL1.font = textFont;
    textL1.textColor = RGB(102, 102, 102);
    textL1.numberOfLines = 0;
    textL1.lineBreakMode = NSLineBreakByCharWrapping;
    textL1.text = @"本次摄影展由中国文化部、卡塔尔博物馆管理局共同主办，云南省文化厅承办，是2016中卡文化年系列活动之一。展出4位中国摄影家和2位卡塔尔摄影家的作品共90幅。                其中，      中国摄影家的作品是3月访问卡塔尔时拍摄而成，主题涉及历史古迹、民风民俗、体育生活、现代化城市等。他们用手中的相机记录下卡塔尔这个历史和现代交融的神秘国度，展现卡塔尔人民的真实生活状态和浓郁民俗风情。  卡塔尔摄影家的作品则拍摄于7月。他们选择与卡塔尔文化有着紧密联系的内蒙古牧民及马、广西漓江鸬鹚与渔夫为主题，进行跟踪拍摄。漓江捕鱼技术与卡塔尔猎隼训练术都是两国古老的民间传统技艺，卡塔尔摄影家用异国视角捕捉渔民们的生活状态，探讨现代技术对中国传统生活方式的影响。中国蒙古族和卡塔尔文化之间因为马有着紧密联系。卡塔尔摄影家到不同的牧民家拍摄，并记录他们与马的关系，展现了这个“马背上的民族”的生活方式aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss.";
    CGRect text1Rect = [textL1.text boundingRectWithSize:CGSizeMake(345, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:text1Font,NSFontAttributeName, nil] context:nil];
    textL1.frame = CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(lineV1.frame)+12*SCREENW_RATE, 345*SCREENW_RATE, text1Rect.size.height);
    [classIntroduceV addSubview:textL1];
    scrollView.contentSize = CGSizeMake(0,CGRectGetMaxY(textL1.frame)+400*SCREENW_RATE);
   
    UIButton *joinClassBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    joinClassBtn.frame = CGRectMake(0, SCREENH - 51*SCREENW_RATE, SCREENW, 51*SCREENW_RATE);
    joinClassBtn.backgroundColor = RGB(53, 195, 236);
    [joinClassBtn setTitle:@"进入课堂" forState:UIControlStateNormal];
    [joinClassBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    [joinClassBtn addTarget:self action:@selector(joinClass) forControlEvents:UIControlEventTouchUpInside];
    joinClassBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:joinClassBtn];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)post
{
    
}

- (void)joinClass
{
    ClassViewController *classVC = [[ClassViewController alloc]init];
    [self.navigationController pushViewController:classVC animated:YES];
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
