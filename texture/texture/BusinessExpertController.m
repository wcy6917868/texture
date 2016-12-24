//
//  BusinessExpertController.m
//  texture
//
//  Created by 王澄宇 on 16/12/19.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "BusinessExpertController.h"
#import "BusinessExpertCell.h"
#import "DetailExpertController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface BusinessExpertController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITextField *searchTF;
}
@property (nonatomic,strong)UITableView *tableV;
@end

@implementation BusinessExpertController

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
    
    self.navigationItem.title = @"行业专家";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18*SCREENW_RATE],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    
    UIButton *rightBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn1.frame = CGRectMake(0, 0, 13*SCREENW_RATE, 14*SCREENW_RATE);
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"shaixuan0"] forState:UIControlStateNormal];
    [rightBtn1 addTarget:self action:@selector(filtrate) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn1];
    
}

- (void)configUI
{
    self.view.backgroundColor = RGB(238, 238, 238);
    
    UIView *searchV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 76*SCREENW_RATE, 41*SCREENW_RATE, 31*SCREENW_RATE)];
    searchV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:searchV];
    
    UIImageView *searchImg = [[UIImageView alloc]initWithFrame:CGRectMake(13*SCREENW_RATE, 7*SCREENW_RATE, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    searchImg.image = [UIImage imageNamed:@"sousuo0"];
    [searchV addSubview:searchImg];
    
    searchTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(searchV.frame), searchV.frame.origin.y, 312*SCREENW_RATE, 31*SCREENW_RATE)];
    searchTF.delegate = self;
    searchTF.backgroundColor = RGB(255, 255, 255);
    searchTF.font = [UIFont systemFontOfSize:13];
    [searchTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"搜索话题 问题 人" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view addSubview:searchTF];
    [self.view addSubview:self.tableV];
}

- (UITableView *)tableV
{
    if (!_tableV)
    {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(searchTF.frame)+12*SCREENW_RATE, SCREENW, SCREENH - 120*SCREENW_RATE) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.backgroundColor = RGB(238, 238, 238);
        _tableV.separatorInset = UIEdgeInsetsZero;
    }
    return _tableV;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 97*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    BusinessExpertCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[BusinessExpertCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailExpertController *DEVC = [[DetailExpertController alloc]init];
    [self.navigationController pushViewController:DEVC animated:YES];
}

- (void)filtrate
{
    
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
