//
//  ChatGroupViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/17.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "ChatGroupViewController.h"
#import "GroupTableViewCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface ChatGroupViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITextField *searchTF;
}
@property (nonatomic,strong)UITableView *tableV;

@end

@implementation ChatGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

- (void)configNav
{
    self.navigationController.navigationBar.barTintColor = RGB(255, 255, 255);
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10*SCREENW_RATE, 18*SCREENW_RATE)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left0"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.title = @"消息";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"创建社群" style:UIBarButtonItemStyleDone target:self action:@selector(createGroup)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGB(102, 102, 102)} forState:UIControlStateNormal];
    
    
}

- (void)configUI
{
    self.view.backgroundColor = RGB(245, 245, 245);
    searchTF = [[UITextField alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 74*SCREENW_RATE, 352*SCREENW_RATE, 31*SCREENW_RATE)];
    searchTF.delegate = self;
    searchTF.backgroundColor = [UIColor whiteColor];
    searchTF.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 0, 42*SCREENW_RATE, 30*SCREENW_RATE)];
    leftImg.image = [UIImage imageNamed:@"sousuo6"];
    searchTF.leftView = leftImg;
    searchTF.font = [UIFont systemFontOfSize:13];
    [searchTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@" 搜索社群" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view addSubview:searchTF];
    [self.view addSubview:self.tableV];
    
}

- (void)createGroup
{
    
}

- (UITableView *)tableV
{
    if (!_tableV)
    {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(searchTF.frame)+12*SCREENW_RATE, SCREENW, SCREENH - 104*SCREENW_RATE) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.separatorInset = UIEdgeInsetsZero;
    }
    return _tableV;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    GroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[GroupTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
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
