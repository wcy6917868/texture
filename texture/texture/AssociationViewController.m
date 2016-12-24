//
//  AssociationViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/1.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "AssociationViewController.h"
#import "AssociationTableViewCell.h"
#import "CreateGroupViewController.h"
#import "AllGroupsViewController.h"
#import "AllCoursesViewController.h"
#import "AppDelegate.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface AssociationViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *tableHeadView;
}
@property (nonatomic,strong)UITableView *tableV;

@end

@implementation AssociationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
}

- (void)configNav
{
    self.navigationController.navigationBar.barTintColor = RGB(245, 245, 245);
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"sousuo0"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    
    self.navigationItem.title = @"社群";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"+ 创建" style:UIBarButtonItemStyleDone target:self action:@selector(create)];
       [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGB(102, 102, 102)} forState:UIControlStateNormal];
    
}

- (void)configUI
{
#pragma mark 热门社群
    tableHeadView = [[UIView alloc]init];
    UIView *hotAssociationV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 168*SCREENW_RATE)];
    hotAssociationV.backgroundColor = [UIColor whiteColor];
    UIImageView *hotAssociationImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 11*SCREENW_RATE, 12*SCREENW_RATE, 14*SCREENW_RATE)];
    hotAssociationImg.image = [UIImage imageNamed:@"remen0"];
    [hotAssociationV addSubview:hotAssociationImg];
    
    UILabel *hotAssociationL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(hotAssociationImg.frame)+10*SCREENW_RATE, hotAssociationImg.frame.origin.y, 71*SCREENW_RATE, 15*SCREENW_RATE)];
    hotAssociationL.textColor = RGB(51, 51, 51);
    hotAssociationL.font = [UIFont systemFontOfSize:15];
    hotAssociationL.text = @"热门社群";
    [hotAssociationV addSubview:hotAssociationL];
    
    UILabel *checkAllL = [[UILabel alloc]initWithFrame:CGRectMake(272*SCREENW_RATE, hotAssociationImg.frame.origin.y, 85*SCREENW_RATE, 15*SCREENW_RATE)];
    checkAllL.textColor = RGB(51,51,51);
    checkAllL.font = [UIFont systemFontOfSize:15];
    checkAllL.userInteractionEnabled = YES;
    UITapGestureRecognizer *checkAllTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkAll)];
    [checkAllL addGestureRecognizer:checkAllTap];
    checkAllL.text = @"查看全部 >>";
    [hotAssociationV addSubview:checkAllL];
    [tableHeadView addSubview:hotAssociationV];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(15*SCREENW_RATE, CGRectGetMaxY(checkAllL.frame)+11*SCREENW_RATE, 345*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV.backgroundColor = RGB(238, 238, 238);
    [hotAssociationV addSubview:lineV];
    
    for (int i = 0; i < 4; i ++)
    {
        UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(15+i*90,CGRectGetMaxY(lineV.frame)+10*SCREENW_RATE, 80*SCREENW_RATE, 80*SCREENW_RATE)];
        headImg.image = [UIImage imageNamed:@"touxiang8"];
        [hotAssociationV addSubview:headImg];
        UILabel *headL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80*SCREENW_RATE, 15*SCREENW_RATE)];
        headL.center = CGPointMake(CGRectGetMidX(headImg.frame), CGRectGetMaxY(headImg.frame)+20*SCREENW_RATE);
        headL.textColor = RGB(51, 51, 51);
        headL.font = [UIFont systemFontOfSize:13];
        headL.textAlignment = NSTextAlignmentCenter;
        headL.text = @"外星人中心";
        [hotAssociationV addSubview:headL];
    }
#pragma mark 课程专区
    UIView *courseView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(hotAssociationV.frame)+11*SCREENW_RATE, SCREENW, 97*SCREENW_RATE)];
    courseView.backgroundColor = [UIColor whiteColor];
    UILabel *courseL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 9*SCREENW_RATE, 71*SCREENW_RATE, 15*SCREENW_RATE)];
    courseL.textColor = RGB(51, 51, 51);
    courseL.font = [UIFont systemFontOfSize:15];
    courseL.text = @"课程专区";
    [courseView addSubview:courseL];
    [tableHeadView addSubview:courseView];
    
    UILabel *allCoursseL = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW - 65*SCREENW_RATE, courseL.frame.origin.y, 63*SCREENW_RATE, 13*SCREENW_RATE)];
    allCoursseL.textColor = RGB(102, 102, 102);
    allCoursseL.font = [UIFont systemFontOfSize:13];
    allCoursseL.text = @"全部课程";
    allCoursseL.userInteractionEnabled = YES;
    UITapGestureRecognizer *checkAllCourse = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkAllCourse)];
    [allCoursseL addGestureRecognizer:checkAllCourse];
    [courseView addSubview:allCoursseL];
    
    UIView *lineV1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(courseL.frame)+8*SCREENW_RATE, SCREENW, 1)];
    lineV1.backgroundColor = RGB(238, 238, 238);
    [courseView addSubview:lineV1];
    
    UIImageView *courseImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(lineV1.frame)+12*SCREENW_RATE, 41*SCREENW_RATE, 41*SCREENW_RATE)];
    courseImg.image = [UIImage imageNamed:@"touxiang8@2x"];
    [courseView addSubview:courseImg];
   
    UILabel *courseName = [[UILabel alloc]init];
    UIFont *courseFont = [UIFont systemFontOfSize:15];
    courseName.textColor = RGB(51, 51, 51);
    courseName.font = courseFont;
    courseName.text = @"如何更好的拍摄到美景";
    CGRect courseRect = [courseName.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:courseFont,NSFontAttributeName, nil] context:nil];
    courseName.frame = CGRectMake(CGRectGetMaxX(courseImg.frame)+12*SCREENW_RATE, courseImg.frame.origin.y, courseRect.size.width, 15);
    UILabel *courseStaus = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(courseName.frame), courseName.frame.origin.y, 60*SCREENW_RATE, 15*SCREENW_RATE)];
    courseStaus.text = @"(上课中)";
    courseStaus.textColor = RGB(53, 195, 236);
    courseStaus.font  = [UIFont systemFontOfSize:15];
    courseStaus.textAlignment = NSTextAlignmentLeft;
    [courseView addSubview:courseName];
    [courseView addSubview:courseStaus];
    
    UILabel *expertLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(courseImg.frame)+12*SCREENW_RATE, CGRectGetMaxY(courseName.frame)+11*SCREENW_RATE, 103*SCREENW_RATE, 13*SCREENW_RATE)];
    expertLabel.textColor = RGB(102, 102, 102);
    expertLabel.font = [UIFont systemFontOfSize:13];
    expertLabel.text = @"摄影达人";
    expertLabel.textAlignment = NSTextAlignmentLeft;
    [courseView addSubview:expertLabel];
    
    UILabel *courseDate = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW - 126*SCREENW_RATE, expertLabel.frame.origin.y+3*SCREENW_RATE, 113*SCREENW_RATE, 11*SCREENW_RATE)];
    courseDate.textColor  = RGB(102, 102, 102);
    courseDate.font = [UIFont systemFontOfSize:13];
    courseDate.text = @"2016.10.20 20:00";
    [courseView addSubview:courseDate];
    
#pragma mark 加入的社群

    UIButton *isJoinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    isJoinBtn.frame = CGRectMake(0, CGRectGetMaxY(courseView.frame)+12*SCREENW_RATE, SCREENW/2, 51*SCREENW_RATE);
    isJoinBtn.backgroundColor = [UIColor whiteColor];
    isJoinBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [isJoinBtn setTitle:@"我加入的 (0)" forState:UIControlStateNormal];
    [isJoinBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [isJoinBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateSelected];
    isJoinBtn.selected = YES;
    [tableHeadView addSubview:isJoinBtn];
    
    UIView *fengeLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(isJoinBtn.frame), 10*SCREENW_RATE, 1*SCREENW_RATE, 31*SCREENW_RATE)];
    fengeLine.backgroundColor = RGB(221, 221, 221);
    [isJoinBtn addSubview:fengeLine];
    
    UIButton *isCreateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    isCreateBtn.frame = CGRectMake(CGRectGetMaxX(fengeLine.frame), isJoinBtn.frame.origin.y, SCREENW/2, 51*SCREENW_RATE);
    isCreateBtn.backgroundColor  = [UIColor whiteColor];
    isCreateBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [isCreateBtn setTitle:@"我创建的 (2)" forState:UIControlStateNormal];
    [isCreateBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [isCreateBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateSelected];
    [tableHeadView addSubview:isCreateBtn];
    
    UIView *cutLine = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(isJoinBtn.frame), SCREENW, 1*SCREENW_RATE)];
    cutLine.backgroundColor = RGB(221, 221, 221);
    [tableHeadView addSubview:cutLine];

    tableHeadView.frame = CGRectMake(0, 0, SCREENW, CGRectGetMaxY(isCreateBtn.frame));
    [self.view addSubview:self.tableV];
    
}

- (UITableView *)tableV
{
    if (!_tableV)
    {
        _tableV  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH - 49) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.backgroundColor = RGB(238, 238, 238);
        _tableV.tableHeaderView = tableHeadView;
        _tableV.separatorInset = UIEdgeInsetsZero;
    }
    return _tableV;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 94*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellid";
    AssociationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[AssociationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)create
{
    CreateGroupViewController *CGVC = [[CreateGroupViewController alloc]init];
    [self.navigationController pushViewController:CGVC animated:YES];
}

- (void)checkAll
{
    AllGroupsViewController *AGVC = [[AllGroupsViewController alloc]init];
    [self.navigationController pushViewController:AGVC animated:YES];
}

- (void)checkAllCourse
{
    AllCoursesViewController *ACVC = [[AllCoursesViewController alloc]init];
    [self.navigationController pushViewController:ACVC animated:YES];
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
