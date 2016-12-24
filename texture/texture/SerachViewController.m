//
//  SerachViewController.m
//  texture
//
//  Created by 王澄宇 on 16/12/10.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "SerachViewController.h"
#import "SearchCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface SerachViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableV;


@end

@implementation SerachViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI
{
    self.view.backgroundColor = RGB(238, 238, 238);
    
    UIView *searchV = [[UIView alloc]initWithFrame:CGRectMake(0, 20, SCREENW, 45*SCREENW_RATE)];
    searchV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:searchV];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 10*SCREENW_RATE, 18*SCREENW_RATE);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left0"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [searchV addSubview:backBtn];
    
    UIImageView *searchImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(backBtn.frame)+25*SCREENW_RATE, 14*SCREENW_RATE, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    searchImg.image = [UIImage imageNamed:@"sousuo0"];
    [searchV addSubview:searchImg];
    
    UITextField *searchTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(searchImg.frame)+12*SCREENW_RATE, 8*SCREENW_RATE, 228*SCREENW_RATE, 31*SCREENW_RATE)];
    searchTF.delegate = self;
    searchTF.backgroundColor = RGB(255, 255, 255);
    searchTF.font = [UIFont systemFontOfSize:13];
    [searchTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"搜索" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [searchV addSubview:searchTF];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(34*SCREENW_RATE, CGRectGetMaxY(searchTF.frame), 289*SCREENW_RATE, 1)];
    lineV.backgroundColor = RGB(221, 221, 221);
    [searchV addSubview:lineV];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(CGRectGetMaxX(lineV.frame)+12*SCREENW_RATE, 16*SCREENW_RATE, 33*SCREENW_RATE, 15*SCREENW_RATE);
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:15*SCREENW_RATE];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [searchV addSubview:searchBtn];
    
    _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(searchV.frame)+13*SCREENW_RATE, SCREENW, SCREENH - 58*SCREENW_RATE) style:UITableViewStylePlain];
    _tableV.dataSource = self;
    _tableV.delegate = self;
    _tableV.backgroundColor = RGB(238, 238, 238);
    _tableV.tableFooterView = [UIView new];
    [self.view addSubview:_tableV];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellid";
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[SearchCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = NO;
    self.navigationController.navigationBar.hidden = NO;
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
