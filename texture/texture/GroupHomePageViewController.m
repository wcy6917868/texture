//
//  GroupHomePageViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/8.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "GroupHomePageViewController.h"
#import "InvitationDetailViewController.h"
#import "AssociationHomePageCell.h"
#import "CreateClassViewController.h"
#import "GroupTalkCell.h"
#import "CourseCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
typedef NS_ENUM(NSInteger,tableViewStaus)
{
   topicStatus = 0,
   groupTalkStatus = 1,
   courseStatus = 2,
    
};

@interface GroupHomePageViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *buttonView;
    UIView *moveLine;
    UIView *tableHeadView;
    UIView *littleHeadView;
}
@property (nonatomic,strong)UITableView *tableV;
@property (nonatomic,assign)NSInteger tableVStatus;

@end

@implementation GroupHomePageViewController


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
    
    self.navigationItem.title = @"社群主页";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(255, 255, 255)}];
    
    UIButton *rightBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn1.frame = CGRectMake(0, 0, 51*SCREENW_RATE, 21*SCREENW_RATE);
    rightBtn1.titleLabel.font = [UIFont systemFontOfSize:10];
    [rightBtn1 setTitle:@"发帖子" forState:UIControlStateNormal];
    [rightBtn1 setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    rightBtn1.layer.cornerRadius = 5.0f;
    rightBtn1.layer.masksToBounds = YES;
    rightBtn1.layer.borderWidth = 0.2f;
    rightBtn1.layer.borderColor = RGB(255, 255, 255).CGColor;
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
    self.view.backgroundColor  = RGB(51, 51, 51);
    tableHeadView = [[UIView alloc]init];
    tableHeadView.backgroundColor = RGB(238, 238, 238);
    
    UIImageView *headBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 189*SCREENW_RATE)];
    headBg.image = [UIImage imageNamed:@"bg1"];
    [tableHeadView addSubview:headBg];
    
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(13*SCREENW_RATE, 65*SCREENW_RATE, 46*SCREENW_RATE, 46*SCREENW_RATE)];
    headImg.image = [UIImage imageNamed:@"touxiang7"];
    [headBg addSubview:headImg];
    
    UILabel *titleL = [[UILabel alloc]init];
    UIFont *titleFont = [UIFont systemFontOfSize:15];
    titleL.textColor = RGB(255, 255, 255);
    titleL.font = titleFont;
    titleL.text = @"自然景象";
    CGRect titleRect = [titleL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:titleFont,NSFontAttributeName, nil] context:nil];
    titleL.frame = CGRectMake(CGRectGetMaxX(headImg.frame)+13*SCREENW_RATE, headImg.frame.origin.y + 10*SCREENW_RATE, titleRect.size.width, 15*SCREENW_RATE);
    [headBg addSubview:titleL];
    
    UIButton *joinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    joinBtn.frame = CGRectMake(SCREENW - 51*SCREENW_RATE, titleL.frame.origin.y+3*SCREENW_RATE, 39*SCREENW_RATE, 15*SCREENW_RATE);
    joinBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [joinBtn setTitle:@"+ 加入" forState:UIControlStateNormal];
    [joinBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    [headBg addSubview:joinBtn];
    
    UILabel *textL = [[UILabel alloc]initWithFrame:CGRectMake(13*SCREENW_RATE, CGRectGetMaxY(headImg.frame)+14*SCREENW_RATE, SCREENW - 13*SCREENW_RATE, 12)];
    textL.font = [UIFont systemFontOfSize:12];
    textL.textColor = RGB(255, 255, 255);
    textL.text = @"美丽的大自然,您赐予我们充足的阳光,使我们温暖";
    [headBg addSubview:textL];
    
    NSArray *littleHeadArr = @[@"xiaotouxiang0",@"xiaotouxiang1",@"xiaotouxiang2",@"xiaotouxiang3",@"xiaotouxiang4"];
    for (int i = 0; i < 5; i ++)
    {
        UIImageView *memberImg = [[UIImageView alloc]initWithFrame:CGRectMake(13 + 20*i, CGRectGetMaxY(textL.frame)+12*SCREENW_RATE, 25*SCREENW_RATE, 25*SCREENW_RATE)];
        memberImg.image = [UIImage imageNamed:littleHeadArr[i]];
        memberImg.tag = 10 + i;
        [headBg addSubview:memberImg];
    }
    
    UIImageView *lastImg = [tableHeadView viewWithTag:14];
    UILabel *memberNumL = [[UILabel alloc]init];
    UIFont *memberNumFont = [UIFont systemFontOfSize:12];
    memberNumL.textColor = RGB(255, 255, 255);
    memberNumL.font = memberNumFont;
    NSString *memberNum = @"352";
    memberNumL.text = [NSString stringWithFormat:@"%@ 成员 >>",memberNum];
    CGRect memberNumRect = [memberNumL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:memberNumFont,NSFontAttributeName, nil] context:nil];
    memberNumL.frame = CGRectMake(CGRectGetMaxX(lastImg.frame)+11*SCREENW_RATE,CGRectGetMaxY(textL.frame)+18*SCREENW_RATE, memberNumRect.size.width, 12*SCREENW_RATE);
    [headBg addSubview:memberNumL];
    
    UIImageView *bookImg = [[UIImageView alloc]initWithFrame:CGRectMake(313*SCREENW_RATE, memberNumL.frame.origin.y, 13*SCREENW_RATE, 13*SCREENW_RATE)];
    bookImg.image = [UIImage imageNamed:@"dianjishu0"];
    [headBg addSubview:bookImg];
    
    UILabel *numL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(bookImg.frame), bookImg.frame.origin.y, 49*SCREENW_RATE, 13*SCREENW_RATE)];
    numL.textColor = [UIColor whiteColor];
    numL.font = [UIFont systemFontOfSize:12];
    numL.textAlignment = NSTextAlignmentCenter;
    numL.text = @"2.9K";
    [headBg addSubview:numL];
    
    buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headBg.frame)+12*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    buttonView.backgroundColor = [UIColor whiteColor];
    [tableHeadView addSubview:buttonView];
    
    NSArray *btnTitleArr = @[@"话题",@"群聊",@"课堂"];
    for (int i = 0 ; i < 3; i ++) {
        UIButton *tableViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tableViewBtn.tag = 20 + i;
        tableViewBtn.frame = CGRectMake(99*i*SCREENW_RATE, 0, 99*SCREENW_RATE, 51*SCREENW_RATE);
        [tableViewBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
        [tableViewBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateSelected];
        [tableViewBtn setTitle:btnTitleArr[i] forState:UIControlStateNormal];
        tableViewBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tableViewBtn.frame), 13*SCREENW_RATE, 2*SCREENW_RATE, 25*SCREENW_RATE)];
        [tableViewBtn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0)
        {
            tableViewBtn.selected = YES;
        }
        if (i == 2)
        {
            lineV.frame = CGRectMake(CGRectGetMaxX(tableViewBtn.frame), 0*SCREENW_RATE, 1*SCREENW_RATE, 51*SCREENW_RATE);
        }
        lineV.backgroundColor  = RGB(221, 221, 221);
        [buttonView addSubview:lineV];
        [buttonView addSubview:tableViewBtn];
    }
    UIButton *btn = [buttonView viewWithTag:22];
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(CGRectGetMaxX(btn.frame)+1, 0, 76*SCREENW_RATE, 51*SCREENW_RATE);
    UIImageView *searchImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 18*SCREENW_RATE, 18*SCREENW_RATE)];
    searchImg.center = CGPointMake(CGRectGetMidX(searchBtn.frame), CGRectGetMidY(searchBtn.frame));
    searchImg.image = [UIImage imageNamed:@"sousuo0"];
    
    UIView *fengeline = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame)-1*SCREENW_RATE, SCREENW, 1*SCREENW_RATE)];
    fengeline.backgroundColor = RGB(221, 221, 221);
    [buttonView addSubview:fengeline];
    
    moveLine = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame)-1*SCREENW_RATE, 99*SCREENW_RATE, 1*SCREENW_RATE)];
    moveLine.backgroundColor = RGB(53, 195, 236);
    [buttonView addSubview:moveLine];
    [buttonView addSubview:searchImg];
    [buttonView addSubview:searchBtn];
    tableHeadView.frame = CGRectMake(0, 0, SCREENW, CGRectGetMaxY(buttonView.frame));
    [self.view addSubview:tableHeadView];
    [self.view addSubview:self.tableV];
    
}

- (UITableView *)tableV
{
    if (!_tableV)
    {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tableHeadView.frame), SCREENW, SCREENH-tableHeadView.frame.size.height) style:UITableViewStylePlain];
        _tableV.dataSource = self;
        _tableV.delegate = self;
        _tableV.backgroundColor = RGB(238, 238, 238);
        _tableV.separatorInset = UIEdgeInsetsZero;
    }
    return _tableV;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.tableVStatus == topicStatus)
    {
        return 6;
    }
    else if (self.tableVStatus == groupTalkStatus)
    {
        return 7;
    }
    else if (self.tableVStatus == courseStatus)
    {
        return 8;
    }
    else
    {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tableVStatus == topicStatus)
    {
        return 182*SCREENW_RATE;
    }
    else if (self.tableVStatus == groupTalkStatus)
    {
        return 78*SCREENW_RATE;
    }
    else if (self.tableVStatus == courseStatus)
    {
        return 89*SCREENW_RATE;
    }
    else
    {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tableVStatus == topicStatus)
    {
        static NSString *cellID = @"cellid";
        AssociationHomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell)
        {
            cell = [[AssociationHomePageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (self.tableVStatus == groupTalkStatus)
    {
        static NSString *cellID1 = @"cellid1";
         GroupTalkCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellID1];
        if (!cell1)
        {
            cell1 = [[GroupTalkCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID1];
        }
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
    }
    else if (self.tableVStatus == courseStatus)
    {
        static NSString *cellID2 = @"cellid2";
        CourseCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellID2];
        if (!cell2)
        {
            cell2 = [[CourseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID2];
        }
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell2;
    }
    
    return nil;
}

- (void)back
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:RGB(51, 51, 51)}];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)post
{
    
}

- (void)press:(UIButton *)selectedBtn
{
    for (UIView *view in buttonView.subviews)
    {
        if ([view isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)view;
            if ([btn isEqual:selectedBtn])
            {
                btn.selected = YES;
            }
            else
            {
                btn.selected = NO;
            }
        }
    }
    [UIView animateWithDuration:0.3f animations:^{
        moveLine.frame = CGRectMake((99*(selectedBtn.tag-20))*SCREENW_RATE, CGRectGetMaxY(selectedBtn.frame)-1, 99*SCREENW_RATE, 1*SCREENW_RATE);
    }];
    if (selectedBtn.tag == 20)
    {
        [self.tableV.tableHeaderView removeFromSuperview];
        self.tableV.tableHeaderView.frame = CGRectZero;
        self.tableVStatus = topicStatus;
        [self.tableV reloadData];
    }
    else if (selectedBtn.tag == 21)
    {
        self.tableVStatus = groupTalkStatus;
        UIView *createGroupV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 45*SCREENW_RATE)];
        UIButton *createGroupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        createGroupBtn.frame = CGRectMake(0, 0, 80*SCREENW_RATE, 45*SCREENW_RATE);
        createGroupBtn.center = CGPointMake(CGRectGetMidX(createGroupV.frame), CGRectGetMidY(createGroupV.frame));
        [createGroupBtn setTitle:@"+创建群聊" forState:UIControlStateNormal];
        [createGroupBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateNormal];
        [createGroupBtn addTarget:self action:@selector(CreateTalkGroup) forControlEvents:UIControlEventTouchUpInside];
        [createGroupV addSubview:createGroupBtn];
        createGroupBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        createGroupV.backgroundColor = [UIColor whiteColor];
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(createGroupV.frame) - 1*SCREENW_RATE, SCREENW, 1*SCREENW_RATE)];
        lineV.backgroundColor = RGB(221, 221, 221);
        [createGroupV addSubview:lineV];
        self.tableV.tableHeaderView = createGroupV;
        [self.tableV reloadData];
    }
    else if (selectedBtn.tag == 22)
    {
        self.tableVStatus = courseStatus;
        UIView *joinCourseV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 45*SCREENW_RATE)];
        joinCourseV.backgroundColor = [UIColor whiteColor];
        self.tableV.tableHeaderView = joinCourseV;
        UIView *jointClassV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80*SCREENW_RATE, 45*SCREENW_RATE)];
        jointClassV.center = CGPointMake(CGRectGetMidX(joinCourseV.frame), CGRectGetMidY(joinCourseV.frame));
        UIImageView *computerImg = [[UIImageView alloc]initWithFrame:CGRectMake(3*SCREENW_RATE, 14*SCREENW_RATE, 15*SCREENW_RATE, 16*SCREENW_RATE)];
        computerImg.image = [UIImage imageNamed:@"weiketang@2x"];
        [jointClassV addSubview:computerImg];
        UILabel *publicCourse = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(computerImg.frame)+7*SCREENW_RATE, 15*SCREENW_RATE, 65*SCREENW_RATE, 15*SCREENW_RATE)];
        publicCourse.textColor = RGB(53, 195, 236);
        publicCourse.font = [UIFont systemFontOfSize:15];
        publicCourse.text = @"发布课程";
        [jointClassV addSubview:publicCourse];
        [joinCourseV addSubview:jointClassV];
        UIView *lineV1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(joinCourseV.frame) - 1*SCREENW_RATE, SCREENW, 1*SCREENW_RATE)];
        lineV1.backgroundColor = RGB(221, 221, 221);
        [joinCourseV addSubview:lineV1];
        [self.tableV reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InvitationDetailViewController *IDVC = [[InvitationDetailViewController alloc]init];
    [self.navigationController pushViewController:IDVC animated:YES];
}

- (void)CreateTalkGroup
{
    CreateClassViewController *CCVC = [[CreateClassViewController alloc]init];
    [self.navigationController pushViewController:CCVC animated:YES];
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
