//
//  MessageViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/1.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "AppreciateViewController.h"
#import "ConmentViewController.h"
#import "SystemMesViewController.h"
#import "ChatGroupViewController.h"
#import "GroupTalkController.h"
#import "SerachViewController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *tableHeadView;
}
@property (nonatomic,strong)UITableView *tableV;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)configNav
{
    self.navigationController.navigationBar.barTintColor = RGB(255, 255, 255);
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"sousuo0"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchUser) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    
    self.navigationItem.title = @"消息";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    
    UIButton *rightBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn1.frame = CGRectMake(0, 0, 13*SCREENW_RATE, 13*SCREENW_RATE);
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"haoyouliebiao0"] forState:UIControlStateNormal];
    [rightBtn1 addTarget:self action:@selector(friendList) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"+"] forState:UIControlStateNormal];
    rightBtn2.frame = CGRectMake(0, 0, 14*SCREENW_RATE, 14*SCREENW_RATE);
    [rightBtn2 addTarget:self action:@selector(addGroupTalk) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn1];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn2];
    UIBarButtonItem *fix = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fix.width = 20;
    NSArray *rightButtons = @[item2,fix,item1];
    self.navigationItem.rightBarButtonItems = rightButtons;
    
}

- (void)configUI
{
    
    tableHeadView = [[UIView alloc]init];
    
    UIView *appreciateView = [[UIView alloc]initWithFrame:CGRectMake(0, 12*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    appreciateView.backgroundColor = [UIColor whiteColor];
    appreciateView.userInteractionEnabled  = YES;
    UITapGestureRecognizer *appreciateTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(appreciate)];
    [appreciateView addGestureRecognizer:appreciateTap];
    [tableHeadView addSubview:appreciateView];
    
    UIImageView *appreciateImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    appreciateImg.image = [UIImage imageNamed:@"dianzan1"];
    [appreciateView addSubview:appreciateImg];
    
    UILabel *appreciateL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(appreciateImg.frame)+12*SCREENW_RATE, appreciateImg.frame.origin.y+1*SCREENW_RATE, 14*SCREENW_RATE, 14*SCREENW_RATE)];
    appreciateL.textColor = RGB(51, 51, 51);
    appreciateL.font = [UIFont systemFontOfSize:15];
    appreciateL.text = @"赞";
    [appreciateView addSubview:appreciateL];
    
    UIImageView *roundnessImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENW - 35*SCREENW_RATE, appreciateImg.frame.origin.y, 19*SCREENW_RATE, 19*SCREENW_RATE)];
    roundnessImg.image = [UIImage imageNamed:@"yuan0"];
    [appreciateView addSubview:roundnessImg];
    
    UILabel *numL = [[UILabel alloc]initWithFrame:roundnessImg.frame];
    numL.textColor = RGB(255, 255, 255);
    numL.text = @"32";
    numL.font = [UIFont systemFontOfSize:10];
    numL.textAlignment = NSTextAlignmentCenter;
    [appreciateView insertSubview:numL aboveSubview:roundnessImg];
    
    UIView *conmentView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(appreciateView.frame)+1*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    conmentView.userInteractionEnabled = YES;
    UITapGestureRecognizer *conmentTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(conment)];
    [conmentView addGestureRecognizer:conmentTap];
    conmentView.backgroundColor = [UIColor whiteColor];
    [tableHeadView addSubview:conmentView];
    
    UIImageView *conmentImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    conmentImg.image = [UIImage imageNamed:@"pinglunghuifu0"];
    [conmentView addSubview:conmentImg];
    
    UILabel *conmentL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentImg.frame)+12*SCREENW_RATE, conmentImg.frame.origin.y+1*SCREENW_RATE, 70*SCREENW_RATE, 15*SCREENW_RATE)];
    conmentL.textColor = RGB(51, 51, 51);
    conmentL.font = [UIFont systemFontOfSize:15];
    conmentL.text = @"评论回复";
    [conmentView addSubview:conmentL];
    
    UIImageView *roundnessImg1 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENW - 35*SCREENW_RATE, conmentImg.frame.origin.y, 19*SCREENW_RATE, 19*SCREENW_RATE)];
    roundnessImg1.image = [UIImage imageNamed:@"yuan0"];
    [conmentView addSubview:roundnessImg1];
    
    UILabel *numL1 = [[UILabel alloc]initWithFrame:roundnessImg.frame];
    numL1.textColor = RGB(255, 255, 255);
    numL1.text = @"99";
    numL1.font = [UIFont systemFontOfSize:10];
    numL1.textAlignment = NSTextAlignmentCenter;
    [conmentView insertSubview:numL1 aboveSubview:roundnessImg1];
    
    UIView *systemView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(conmentView.frame)+1*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    systemView.backgroundColor = [UIColor whiteColor];
    systemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *systemTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(systemMes)];
    [systemView addGestureRecognizer:systemTap];
    [tableHeadView addSubview:systemView];
    
    UIImageView *systemImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    systemImg.image = [UIImage imageNamed:@"xitonghuifu0"];
    [systemView addSubview:systemImg];
    
    UILabel *systemL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(systemImg.frame)+12*SCREENW_RATE, systemImg.frame.origin.y+1*SCREENW_RATE, 70*SCREENW_RATE, 15*SCREENW_RATE)];
    systemL.textColor = RGB(51, 51, 51);
    systemL.font = [UIFont systemFontOfSize:15];
    systemL.text = @"系统回复";
    [systemView addSubview:systemL];
    
    UIView *groupView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(systemView.frame)+12*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    groupView.userInteractionEnabled = YES;
    UITapGestureRecognizer *groupTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkGroup)];
    [groupView addGestureRecognizer:groupTap];
    groupView.backgroundColor = [UIColor whiteColor];
    [tableHeadView addSubview:groupView];
    
    UIImageView *groupImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 17*SCREENW_RATE, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    groupImg.image = [UIImage imageNamed:@"qunzu0"];
    [groupView addSubview:groupImg];
    
    UILabel *groupL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(systemImg.frame)+12*SCREENW_RATE, systemImg.frame.origin.y+1*SCREENW_RATE, 70*SCREENW_RATE, 15*SCREENW_RATE)];
    groupL.textColor = RGB(51, 51, 51);
    groupL.font = [UIFont systemFontOfSize:15];
    groupL.text = @"群组";
    [groupView addSubview:groupL];
    
    tableHeadView.frame = CGRectMake(0, 0, SCREENW, CGRectGetMaxY(groupView.frame)+12*SCREENW_RATE);
    [self.view addSubview:self.tableV];
    
}

- (UITableView *)tableV
{
    if (!_tableV)
    {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH - 49) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.backgroundColor = RGB(238, 238, 238);
        _tableV.tableHeaderView = tableHeadView;
        _tableV.separatorInset =  UIEdgeInsetsZero;
    }
    return _tableV;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellid";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[MessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)appreciate
{
    AppreciateViewController *avc = [[AppreciateViewController alloc]init];
    [self.navigationController pushViewController:avc animated:YES];
}

- (void)conment
{
    ConmentViewController *conmentVC = [[ConmentViewController alloc]init];
    [self.navigationController pushViewController:conmentVC animated:YES];
}

- (void)systemMes
{
    SystemMesViewController *sysVC = [[SystemMesViewController alloc]init];
    [self.navigationController pushViewController:sysVC animated:YES];
}

- (void)checkGroup
{
    ChatGroupViewController *CGVC = [[ChatGroupViewController alloc]init];
    [self.navigationController pushViewController:CGVC animated:YES];
}

- (void)friendList
{
    
}

- (void)addGroupTalk
{
    GroupTalkController *GTVC = [[GroupTalkController alloc]init];
    [self.navigationController pushViewController:GTVC animated:YES];
}

- (void)searchUser
{
    SerachViewController *searchVC = [[SerachViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
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
