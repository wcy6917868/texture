//
//  MyCollectController.m
//  texture
//
//  Created by 王澄宇 on 16/12/16.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "MyCollectController.h"
#import "MyCollectCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface MyCollectController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableV;

@end

@implementation MyCollectController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
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
    
    self.navigationItem.title = @"我的收藏";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18*SCREENW_RATE],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
}

- (void)configUI
{
    self.view.backgroundColor = RGB(245, 245, 245);
    UIButton *tipicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tipicBtn.frame = CGRectMake(0, 0, SCREENW/2, 50*SCREENW_RATE);
    tipicBtn.tag = 100;
    tipicBtn.backgroundColor = [UIColor whiteColor];
    [tipicBtn setTitle:@"话题" forState:UIControlStateNormal];
    [tipicBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [tipicBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateSelected];
    [self.view addSubview:tipicBtn];
    
    UIButton *professionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    professionBtn.frame = CGRectMake(CGRectGetMaxX(tipicBtn.frame), 0, SCREENW/2, 50*SCREENW_RATE);
    professionBtn.backgroundColor = [UIColor whiteColor];
    [professionBtn setTitle:@"专家" forState:UIControlStateNormal];
    [professionBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [professionBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateSelected];
    [self.view addSubview:professionBtn];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(professionBtn.frame)-1, SCREENW, 1)];
    lineV.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:lineV];
    
    UIView *fengeV = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tipicBtn.frame), 16*SCREENW_RATE, 2*SCREENW_RATE, 20*SCREENW_RATE)];
    fengeV.backgroundColor = RGB(204, 204, 204);
    [self.view addSubview:fengeV];
    
    [self.view addSubview:self.tableV];
}

- (UITableView *)tableV
{
    UIButton *topicBtn = [self.view viewWithTag:100];
    if (!_tableV)
    {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topicBtn.frame), SCREENW, SCREENH - 114*SCREENW_RATE) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.backgroundColor = RGB(245, 245, 245);
    }
    return _tableV;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 194*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    MyCollectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[MyCollectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

- (void)back
{
    self.navigationController.navigationBar.translucent = YES;
    self.tabBarController.hidesBottomBarWhenPushed = NO;
    [self.navigationController popViewControllerAnimated:YES];
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
