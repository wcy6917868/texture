//
//  MyTabBarController.m
//  texture
//
//  Created by 王澄宇 on 16/11/1.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "MyTabBarController.h"
#import "TabBarItem.h"
#import "PopViewController.h"
#import "AppDelegate.h"
#import "MyNavgationController.h"
#import <QuartzCore/QuartzCore.h>
#import "BusinessExpertController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface MyTabBarController ()
{
    NSArray *_titleArray;//标题
    UIImageView *centerIcon;
    UIView *popV;
    BOOL isClick;
}

@end

@implementation MyTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    [self hideTabBar];
    [self createTabBar];
    [self createItems];
    [self setViewControllerArray];
}

- (void)initData
{
    _titleArray = @[@"首页",@"社群",@"消息",@"个人中心"];
    isClick = NO;
}

- (void)hideTabBar
{
    self.tabBar.hidden = YES;
}

- (void)createTabBar
{
    _tabBarImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREENH - 49, SCREENH - 49, 49)];
    _tabBarImageV.userInteractionEnabled = YES;
    _tabBarImageV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabBarImageV];
}

- (void)createItems
{
    NSArray *imgArr = @[@"shouye0",@"haoyou0",@"xiaoxi0",@"gerenzhongxin0"];
    NSArray *selectImgArr = @[@"shouye1",@"haoyou1",@"xiaoxi1",@"gerenzhongxin1"];
    NSInteger count = _titleArray.count;
    CGFloat height = 49;
    CGFloat width = SCREENW/(count+1);
    
    UIView *centerView = [[UIView alloc]initWithFrame:CGRectMake(width * 2 + (width - 60)/2, -10, 56*SCREENW_RATE, 59*SCREENW_RATE)];
    centerView.backgroundColor = RGB(53, 195, 236);
    UIImageView *leftTriangle = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(centerView.frame)-12*SCREENW_RATE, centerView.frame.origin.y, 12*SCREENW_RATE, 9*SCREENW_RATE)];
    leftTriangle.image = [UIImage imageNamed:@"sanjiao_left0"];
    UIImageView *rightTriangle = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(centerView.frame), centerView.frame.origin.y, 12*SCREENW_RATE, 9*SCREENW_RATE)];
    rightTriangle.image = [UIImage imageNamed:@"sanjiao_right0"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressCenter)];
    [centerView addGestureRecognizer:tap];
    [_tabBarImageV addSubview:leftTriangle];
    [_tabBarImageV addSubview:rightTriangle];
    [_tabBarImageV addSubview:centerView];
    
    centerIcon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 24*SCREENW_RATE, 24*SCREENW_RATE)];
    centerIcon.center = CGPointMake(CGRectGetMidX(centerView.frame), CGRectGetMidY(centerView.frame));
    centerIcon.image = [UIImage imageNamed:@"++"];
    [_tabBarImageV addSubview:centerIcon];
    
    for (int i = 0; i < count; i ++)
    {
         TabBarItem *item = [[TabBarItem alloc]initWithFrame:CGRectMake(width * i, 5*SCREENW_RATE , width-10*SCREENW_RATE, height-5*SCREENW_RATE)];
            [item setTitle:_titleArray[i] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:selectImgArr[i]] forState:UIControlStateSelected];
            [_tabBarImageV addSubview:item];
            if (i == 0)
            {
                item.selected = YES;
            }
            if (i >= 2)
            {
                item.frame = CGRectMake(width * (i + 1), 5*SCREENW_RATE, width-10*SCREENW_RATE, height-5*SCREENW_RATE);
            }
            item.tag = 200 + i;
            [item addTarget:self action:@selector(touchTabBar:) forControlEvents:UIControlEventTouchUpInside];
        }
}

- (void)touchTabBar:(TabBarItem *)item
{
    NSInteger index = item.tag - 200;
    self.selectedIndex = index;
    
    for (UIView *view in _tabBarImageV.subviews)
    {
        if ([view isKindOfClass:[TabBarItem class]])
        {
            TabBarItem *tempBtn = (TabBarItem *)view;
            if ([tempBtn isEqual:item])
            {
                tempBtn.selected = YES;
            }
            else
            {
                tempBtn.selected = NO;
            }
        }
    }
}

- (void)setViewControllerArray
{
    NSArray *vcArray = @[@"HomePageViewController",@"AssociationViewController",@"MessageViewController",@"MycenterViewController"];
    NSMutableArray *navArray = [NSMutableArray array];
    
    NSInteger conunt = vcArray.count;
    for (int i = 0; i < conunt; i ++)
    {
        NSString *vcStr = vcArray[i];
        Class myClass = NSClassFromString(vcStr);
        UIViewController *vc = [[myClass alloc]init];
        vc.navigationItem.title = _titleArray[i];
        MyNavgationController *nav = [[MyNavgationController alloc]initWithRootViewController:vc];
        [navArray addObject:nav];
    }
    self.viewControllers = navArray;
}

- (void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
{
    _tabBarImageV.hidden = hidesBottomBarWhenPushed;
}

- (void)pressCenter
{
    if (isClick == NO)
    {
        isClick = YES;
        
        popV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH - 49)];
        popV.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
        
        UIImageView *leftV = [[UIImageView alloc]initWithFrame:CGRectMake(145*SCREENW_RATE, popV.bounds.size.height - 9*SCREENW_RATE, 12*SCREENW_RATE, 9*SCREENW_RATE)];
        leftV.image  = [UIImage imageNamed:@"sanjiao_left0"];
        [popV addSubview:leftV];
        
        UIView *centerV = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftV.frame), popV.bounds.size.height - 10*SCREENW_RATE, 56*SCREENW_RATE, 10*SCREENW_RATE)];
        centerV.backgroundColor = RGB(53, 195, 236);
        [popV addSubview:centerV];
        
        UIImageView *rightV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(centerV.frame), popV.bounds.size.height - 9*SCREENW_RATE, 12*SCREENW_RATE, 9*SCREENW_RATE)];
        rightV.image = [UIImage imageNamed:@"sanjiao_right0"];
        [popV addSubview:rightV];
        
        [[UIApplication sharedApplication].keyWindow insertSubview:popV aboveSubview:self.view];
        
        NSArray *imgTitle = @[@"问答专区",@"话题专区",@"行业专家"];
        NSArray *imgArr = @[@"wendazhuanqu1",@"huatizhuanqu1",@"hangyezhuanjia1"];
        UITapGestureRecognizer *wendaTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wenDaZhanQu)];
        UITapGestureRecognizer *huaTiZhanQuTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GowenDaZhanqu)];
        UITapGestureRecognizer *hangYeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hangYeZhuanJia)];
        NSArray *tapArray = @[wendaTap,huaTiZhanQuTap,hangYeTap];
        
        for (int i = 0; i < 3; i ++)
        {
            UIView *suspensionView = [[UIView alloc]initWithFrame:CGRectMake(137*SCREENW_RATE,(465+i*51+300)*SCREENW_RATE, 104*SCREENW_RATE, 31*SCREENW_RATE)];
            suspensionView.layer.cornerRadius = 5.0f;
            suspensionView.layer.masksToBounds = YES;
            suspensionView.tag = 100+i;
            suspensionView.backgroundColor = RGB(53, 195, 236);
            UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(14*SCREENW_RATE, 11*SCREENW_RATE, 16*SCREENW_RATE, 11*SCREENW_RATE)];
            suspensionView.userInteractionEnabled = YES;
            [suspensionView addGestureRecognizer:tapArray[i]];
            imageV.image = [UIImage imageNamed:imgArr[i]];
            [suspensionView addSubview:imageV];
            if (i == 0)
            {
                [UIView animateWithDuration:1.0f animations:^{
                    [popV addSubview:suspensionView];
                }];
            }
            if (i == 1)
            {
                imageV.frame = CGRectMake(14*SCREENW_RATE, 11*SCREENW_RATE, 13*SCREENW_RATE, 13*SCREENW_RATE);
                [UIView animateWithDuration:2.0f animations:^{
                    [popV addSubview:suspensionView];
                }];
            }
            if (i == 2)
            {
                [UIView animateWithDuration:3.0f animations:^{
                    [popV addSubview: suspensionView];
                }];
            }
            
            UILabel *textL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageV.frame)+7*SCREENW_RATE, 10*SCREENW_RATE, 60*SCREENW_RATE, 13*SCREENW_RATE)];
            textL.text = imgTitle[i];
            textL.font = [UIFont systemFontOfSize:13];
            textL.textColor = RGB(255, 255, 255);
            [suspensionView addSubview:textL];
        }
        
        [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(createBtn:) userInfo:nil repeats:YES];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        
        animation.duration = 0.5f;
        animation.repeatCount = 0;
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        
        animation.fromValue = [NSNumber numberWithFloat:0.0];
        animation.toValue = [NSNumber numberWithFloat:0.75 * M_PI];
        
        [centerIcon.layer addAnimation:animation forKey:@"rotate-layer"];
        
    }
    else
    {

        isClick = NO;
        [popV removeFromSuperview];
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        
        animation.duration = 0.5f;
        animation.repeatCount = 0;
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        
        animation.fromValue = [NSNumber numberWithFloat:0.0];
        animation.toValue = [NSNumber numberWithFloat: M_PI];
        
        [centerIcon.layer addAnimation:animation forKey:@"rotate-layer"];
    }
}

- (void)createBtn:(NSTimer *)timer
{

        UIView *view = [popV viewWithTag:100];
        UIView *view1 = [popV viewWithTag:101];
        UIView *view2 = [popV viewWithTag:102];

    CGRect rect = view.frame;
    CGRect rect1 = view1.frame;
    CGRect rect2 = view2.frame;
    static int y = 1;
    rect.origin.y -= y;
    rect1.origin.y -= y;
    rect2.origin.y -= y;
    if (rect.origin.y && rect1.origin.y && rect2.origin.y >= SCREENH - 80 )
    {
        view.hidden = YES;
        view1.hidden = YES;
        view2.hidden = YES;
    }
    else
    {
        view.hidden = NO;
        view1.hidden = NO;
        view2.hidden = NO;
    }
    if (rect.origin.y <= 465 ) {
        [timer setFireDate:[NSDate distantFuture]];
    }
    view.frame = rect;
    view1.frame = rect1;
    view2.frame = rect2;

}

- (void)wenDaZhanQu
{
    
}

- (void)GowenDaZhanqu
{
    
}

- (void)hangYeZhuanJia
{
    isClick = NO;
    [popV removeFromSuperview];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    animation.duration = 0.5f;
    animation.repeatCount = 0;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat: M_PI];
    
    [centerIcon.layer addAnimation:animation forKey:@"rotate-layer"];
    
    BusinessExpertController *BEVC = [[BusinessExpertController alloc]init];
    UINavigationController *nav = self.viewControllers[self.selectedIndex];
    [nav pushViewController:BEVC animated:YES];
    
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
