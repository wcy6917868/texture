//
//  CreateGroupViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/8.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "CreateGroupViewController.h"
#import "CreateGroupNextStepVC.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface CreateGroupViewController ()
{
    BOOL isChoose;
}

@end

@implementation CreateGroupViewController

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
    self.navigationController.navigationBar.barTintColor = RGB(245, 245, 245);
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10*SCREENW_RATE, 18*SCREENW_RATE)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left0"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.title = @"创建社群";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(nextStep)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGB(102, 102, 102)} forState:UIControlStateNormal];
}

- (void)configUI
{
    self.view.backgroundColor = RGB(238, 238, 238);
    isChoose = NO;
    
    NSArray *titleArray = @[@"科技",@"情感",@"诗词歌赋",@"互联网",@"军事",@"生物",@"出国留学",@"3D技术",@"虚拟现实",@"智能家居",@"人文",@"vr"];
    NSInteger count = titleArray.count;
    for (int i = 0; i < count; i ++)
    {
        NSInteger x = i % 4;
        NSInteger y = i / 4;
        UIButton *labelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        labelBtn.frame = CGRectMake(12+92*x, 76+37*y, 78*SCREENW_RATE, 25*SCREENW_RATE);
        labelBtn.backgroundColor = [UIColor whiteColor];
        labelBtn.layer.cornerRadius = 5.0f;
        labelBtn.layer.masksToBounds = YES;
        [labelBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [labelBtn setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        labelBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [labelBtn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:labelBtn];
    }
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}

- (void)press:(UIButton *)selectedBtn
{
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)view;
            if ([btn isEqual:selectedBtn]) {
                btn.selected = YES;
                btn.backgroundColor = RGB(53, 195, 236);
            }
            else
            {
                btn.selected = NO;
                btn.backgroundColor = [UIColor whiteColor];
            }
        }
    }
}

- (void)nextStep
{
    CreateGroupNextStepVC *VC = [[CreateGroupNextStepVC alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
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
