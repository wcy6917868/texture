//
//  AllGroupsViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/14.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "AllGroupsViewController.h"
#import "AllGroupCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface AllGroupsViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView *scrollView;
}
@property (nonatomic,strong)UITableView *tableV;


@end

@implementation AllGroupsViewController

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
    
    self.navigationItem.title = @"全部社群";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"+ 创建" style:UIBarButtonItemStyleDone target:self action:@selector(create)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGB(102, 102, 102)} forState:UIControlStateNormal];
}

- (void)configUI
{
    self.view.backgroundColor = RGB(238, 238, 238);
    UITextField *searchTF = [[UITextField alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 74*SCREENW_RATE, 352*SCREENW_RATE, 31*SCREENW_RATE)];
    searchTF.delegate = self;
    searchTF.backgroundColor = [UIColor whiteColor];
    searchTF.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 0, 42*SCREENW_RATE, 30*SCREENW_RATE)];
    leftImg.image = [UIImage imageNamed:@"sousuo6"];
    searchTF.leftView = leftImg;
    searchTF.font = [UIFont systemFontOfSize:13];
    [searchTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@" 搜索话题、问题、人" attributes:@{NSForegroundColorAttributeName:RGB(153, 153, 153)}]];
    [self.view addSubview:searchTF];
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(searchTF.frame)+12*SCREENW_RATE, 300*SCREENW_RATE, 51*SCREENW_RATE)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.contentSize = CGSizeMake(85*5, 0);
    for (int i = 0; i < 5; i ++)
    {
        UIButton *tableViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tableViewBtn.frame = CGRectMake(85*i,0,85,51);
        tableViewBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [tableViewBtn setTitle:@"热门社群" forState:UIControlStateNormal];
        [tableViewBtn setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
        [tableViewBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateSelected];
        [tableViewBtn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tableViewBtn.frame)-1, 16*SCREENW_RATE, 2*SCREENW_RATE, 20*SCREENW_RATE)];
        if (i == 0)
        {
            tableViewBtn.selected = YES;
        }
        lineV.backgroundColor = RGB(204, 204, 204);
        [scrollView addSubview:tableViewBtn];
        [scrollView addSubview:lineV];
    }
    [self.view addSubview:scrollView];
    
    UIView *BtnView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(scrollView.frame), scrollView.frame.origin.y, 76*SCREENW_RATE, 51*SCREENW_RATE)];
    BtnView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:BtnView];
    
    UIView *lineV1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 51*SCREENW_RATE)];
    lineV1.backgroundColor = RGB(204, 204, 204);
    [BtnView addSubview:lineV1];
    
    UIView *lineV2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BtnView.bounds)-1, 76*SCREENW_RATE, 1*SCREENW_RATE)];
    lineV2.backgroundColor = RGB(204, 204, 204);
    [BtnView addSubview:lineV2];
    
    UIImageView *filtrateImg = [[UIImageView alloc]initWithFrame:CGRectMake(29*SCREENW_RATE, 16*SCREENW_RATE, 19*SCREENW_RATE, 20*SCREENW_RATE)];
    filtrateImg.image = [UIImage imageNamed:@"shaixuan0"];
    [BtnView addSubview:filtrateImg];
    
    UIView *fengeLine = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.bounds)-1, 85*5*SCREENW_RATE, 1)];
    fengeLine.backgroundColor = RGB(204, 204, 204);
    [scrollView addSubview:fengeLine];
    
    [self.view addSubview:self.tableV];
    
}

- (UITableView *)tableV
{
    if (!_tableV)
    {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.frame), SCREENW, SCREENH - CGRectGetMaxY(scrollView.frame) - 49) style:UITableViewStylePlain];
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
    return 94*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    AllGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[AllGroupCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)create
{

}

- (void)press:(UIButton *)selectedBtn
{
    for (UIView *view in scrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)view;
            if ([btn isEqual:selectedBtn]) {
                btn.selected = YES;
            }
            else
            {
                btn.selected = NO;
            }
        }
    }
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
