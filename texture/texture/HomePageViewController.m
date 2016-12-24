//
//  HomePageViewController.m
//  texture
//
//  Created by 王澄宇 on 16/11/1.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "HomePageViewController.h"
#import "TopicTableViewCell.h"
#import "PublishViewController.h"
#import <SDCycleScrollView.h>
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface HomePageViewController ()<UITextFieldDelegate,SDCycleScrollViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableV;
@property (nonatomic,strong)UIView *tableHeadV;

@end

@implementation HomePageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configNav];
    [self configUI];
}

- (void)configNav
{
    self.view.backgroundColor = RGB(255, 255, 255);
    self.navigationController.navigationBar.barTintColor = RGB(255, 255, 255);
    UITextField *searchTF = [[UITextField alloc]initWithFrame:CGRectMake(54*SCREENW_RATE, 20, 309*SCREENW_RATE, 31*SCREENW_RATE)];
    searchTF.delegate = self;
    searchTF.backgroundColor = RGB(221, 221, 221);
    searchTF.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 0, 42*SCREENW_RATE, 30*SCREENW_RATE)];
    leftImg.image = [UIImage imageNamed:@"sousuo3"];
    searchTF.leftView = leftImg;
    [searchTF setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@" 搜索话题、问题、人" attributes:@{NSForegroundColorAttributeName:RGB(255, 255, 255)}]];
    self.navigationItem.titleView = searchTF;
}

- (void)configUI
{
#pragma mark 创建头滑动视图
    _tableHeadV = [[UIView alloc]init];
    self.view.backgroundColor = RGB(238, 238, 238);
    SDCycleScrollView *headScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREENW, 158*SCREENW_RATE) delegate:self placeholderImage:[UIImage imageNamed:@"banner0"]];
    
    headScrollView.localizationImageNamesGroup = @[@"banner0",@"banner0",@"banner0"];
    headScrollView.autoScrollTimeInterval = 3.0f;
    headScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
    [_tableHeadV addSubview:headScrollView];
    
#pragma mark 创建话题图标
    UIView *topicView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headScrollView.frame)+12*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    topicView.backgroundColor = [UIColor whiteColor];
    [_tableHeadV addSubview:topicView];
    
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 15*SCREENW_RATE, 3*SCREENW_RATE, 21*SCREENW_RATE)];
    blueView.backgroundColor = RGB(49, 152, 240);
    [topicView addSubview:blueView];
    
    UILabel *hotTopic = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(blueView.frame)+11*SCREENW_RATE, 19*SCREENW_RATE, 70*SCREENW_RATE, 15*SCREENW_RATE)];
    hotTopic.font = [UIFont systemFontOfSize:15];
    hotTopic.textColor = RGB(51, 51, 51);
    hotTopic.text = @"热门话题";
    [topicView addSubview:hotTopic];
    
    UIView *changeTopicView = [[UIView alloc]initWithFrame:CGRectMake(220*SCREENW_RATE, 10*SCREENW_RATE, 70*SCREENW_RATE, 30*SCREENW_RATE)];
    UIImageView *changeImg = [[UIImageView alloc]initWithFrame:CGRectMake(2, 10*SCREENW_RATE, 13*SCREENW_RATE, 12*SCREENW_RATE)];
    changeImg.image = [UIImage imageNamed:@"huan0@2x"];
    [changeTopicView addSubview:changeImg];
    [topicView addSubview:changeTopicView];
    
    UILabel *changeTopicL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(changeImg.frame)+7*SCREENW_RATE, 6*SCREENW_RATE, 45*SCREENW_RATE, 20*SCREENW_RATE)];
    changeTopicL.font = [UIFont systemFontOfSize:13];
    changeTopicL.textColor = RGB(106, 106, 106);
    changeTopicL.text = @"换一题";
    [changeTopicView addSubview:changeTopicL];
    
    UIButton *checkAll = [UIButton buttonWithType:UIButtonTypeCustom];
    checkAll.frame = CGRectMake(312*SCREENW_RATE, 16*SCREENW_RATE, 60*SCREENW_RATE, 20*SCREENW_RATE);
    checkAll.titleLabel.font = [UIFont systemFontOfSize:13];
    [checkAll setTitle:@"查看全部" forState:UIControlStateNormal];
    [checkAll setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
    [topicView addSubview:checkAll];
    
    UIView *detailTopic = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topicView.frame)+1, SCREENW, 90*SCREENW_RATE)];
    detailTopic.backgroundColor = [UIColor whiteColor];
    [_tableHeadV addSubview:detailTopic];
    
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 31*SCREENW_RATE, 31*SCREENW_RATE)];
    headImg.image = [UIImage imageNamed:@"touxiang3"];
    [detailTopic addSubview:headImg];
    
    NSString *textStr = @"发起者 : 看天空的美";
    UIFont *titleFont = [UIFont systemFontOfSize:13];
    CGRect titleRect = [textStr boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:titleFont,NSFontAttributeName, nil] context:nil];
    UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(headImg.frame)+11*SCREENW_RATE, 22*SCREENW_RATE,titleRect.size.width, 20*SCREENW_RATE)];
    titleL.font = titleFont;
    titleL.textColor = RGB(102, 102, 102);
    titleL.text = textStr;
    [detailTopic addSubview:titleL];
    
    NSString *topicStr = @"等闲识得东风面,万紫千红总是春";
    UIFont *topicFont = [UIFont systemFontOfSize:13];
    CGRect topicRect = [topicStr boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:topicFont,NSFontAttributeName, nil] context:nil];
    UILabel *topicL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(headImg.frame)+10*SCREENW_RATE, topicRect.size.width, topicRect.size.height)];
    topicL.text = topicStr;
       topicL.font = topicFont;
    topicL.textColor = RGB(51, 51, 51);
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(topicL.frame)+8*SCREENW_RATE, 352*SCREENW_RATE, 1)];
    lineV.backgroundColor = RGB(221, 221, 221);
    topicView.frame = CGRectMake(0, CGRectGetMaxY(headScrollView.frame)+12*SCREENW_RATE, SCREENW, CGRectGetMaxY(lineV.frame)+5*SCREENW_RATE);
    [detailTopic addSubview:topicL];
    [detailTopic addSubview:lineV];
    
    UIView *topicTextView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(detailTopic.frame), SCREENW, 150*SCREENW_RATE)];
    topicTextView.backgroundColor = [UIColor whiteColor];
    [_tableHeadV addSubview:topicTextView];
    
    UILabel *topicTextL = [[UILabel alloc]init];
    UIFont *topicTextFont = [UIFont systemFontOfSize:12];
    topicTextL.text = @"此处应该为正文";
    topicTextL.font = topicTextFont;
    topicTextL.textColor = RGB(102, 102, 102);
    CGRect topicTextRect = [topicTextL.text boundingRectWithSize:CGSizeMake(SCREENW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:topicTextFont,NSFontAttributeName, nil] context:nil];
    topicTextL.frame = CGRectMake(12*SCREENW_RATE, 0, 347*SCREENW_RATE, topicTextRect.size.height);
    [topicTextView addSubview:topicTextL];
    [_tableHeadV addSubview:topicTextView];
    
    topicTextView.frame = CGRectMake(0, CGRectGetMaxY(detailTopic.frame), SCREENW, CGRectGetMaxY(topicTextL.frame)+30);
    
    UILabel *dateL = [[UILabel alloc]initWithFrame:CGRectMake(13*SCREENW_RATE, CGRectGetMaxY(topicTextL.frame)+5, 56*SCREENW_RATE, 12*SCREENW_RATE)];
    dateL.font = [UIFont systemFontOfSize:10];
    dateL.textColor = RGB(102, 102, 102);
    dateL.text = @"2016.11.3";
    [topicTextView addSubview:dateL];
    
    UIView *conmentView = [[UIView alloc]initWithFrame:CGRectMake(241*SCREENW_RATE, CGRectGetMaxY(topicTextL.frame)+5, 45*SCREENW_RATE, 15*SCREENW_RATE)];
    UIImageView *conmentImg = [[UIImageView alloc]initWithFrame:CGRectMake(2*SCREENW_RATE, 2*SCREENW_RATE, 11*SCREENW_RATE, 10*SCREENW_RATE)];
    conmentImg.image = [UIImage imageNamed:@"pinglun0"];
    [conmentView addSubview:conmentImg];
    [topicTextView addSubview:conmentView];
    
    UILabel *conmentL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentImg.frame)+9*SCREENW_RATE, conmentImg.frame.origin.y, 22*SCREENW_RATE, 10*SCREENW_RATE)];
    conmentL.font = [UIFont systemFontOfSize:10];
    conmentL.textColor = RGB(102, 102, 102);
    conmentL.text = @"357";
    [conmentView addSubview:conmentL];
    
    UIView *admireView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentView.frame)+33*SCREENW_RATE, conmentView.frame.origin.y, 45*SCREENW_RATE, 15*SCREENW_RATE)];
    UIImageView *admireImg = [[UIImageView alloc]initWithFrame:CGRectMake(2*SCREENW_RATE, 2*SCREENW_RATE, 10*SCREENW_RATE, 10*SCREENW_RATE)];
    admireImg.image = [UIImage imageNamed:@"dianzan0"];
    [admireView addSubview:admireImg];
    
    UILabel *admireL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(admireImg.frame)+9*SCREENW_RATE, admireImg.frame.origin.y, 31*SCREENW_RATE, 10*SCREENW_RATE)];
    admireL.font = [UIFont systemFontOfSize:10];
    admireL.textColor = RGB(102, 102, 102);
    admireL.text = @"9999";
    [admireView addSubview:admireL];
    [topicTextView addSubview:admireView];
    
#pragma mark 专家人数查看
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topicTextView.frame)+12*SCREENW_RATE, SCREENW, 259*SCREENW_RATE)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.contentSize = CGSizeMake(12+6*158, 0);
    for (int i = 0; i < 5; i ++)
    {
        UIView *expertView = [[UIView alloc]initWithFrame:CGRectMake(12 + i*158, 12*SCREENW_RATE, 146*SCREENW_RATE, 235*SCREENW_RATE)];
        expertView.layer.borderWidth = 0.3;
        expertView.layer.borderColor = RGB(221, 221, 211).CGColor;
        UIImageView *expertImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 146*SCREENW_RATE, 146*SCREENW_RATE)];
        expertImg.image = [UIImage imageNamed:@"jixieshi0"];
        [expertView addSubview:expertImg];
        
        UILabel *expertL = [[UILabel alloc]initWithFrame:CGRectMake(13*SCREENW_RATE, CGRectGetMaxY(expertImg.frame)+12*SCREENW_RATE, 60*SCREENW_RATE, 14*SCREENW_RATE)];
        expertL.font = [UIFont systemFontOfSize:15];
        expertL.textColor = RGB(51, 51, 51);
        expertL.text = @"机械师";
        [expertView addSubview:expertL];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(11*SCREENW_RATE, CGRectGetMaxY(expertL.frame)+10*SCREENW_RATE, 61*SCREENW_RATE, 16*SCREENW_RATE)];
        label1.backgroundColor = RGB(44, 155, 226);
        label1.font = [UIFont systemFontOfSize:10];
        label1.textColor = RGB(255, 255, 255);
        label1.layer.masksToBounds = YES;
        label1.layer.cornerRadius = 5.0f;
        label1.text = @"专家";
        label1.textAlignment = NSTextAlignmentCenter;
        [expertView addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label1.frame)+6*SCREENW_RATE,label1.frame.origin.y, 61*SCREENW_RATE, 16*SCREENW_RATE)];
        label2.backgroundColor = RGB(44, 155, 226);
        label2.font = [UIFont systemFontOfSize:10];
        label2.textColor = RGB(255, 255, 255);
        label2.layer.masksToBounds = YES;
        label2.layer.cornerRadius = 5.0f;
        label2.text = @"标签";
        label2.textAlignment = NSTextAlignmentCenter;
        [expertView addSubview:label2];
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(11*SCREENW_RATE, CGRectGetMaxY(label1.frame)+10*SCREENW_RATE, 86*SCREENW_RATE, 16*SCREENW_RATE)];
        label3.backgroundColor = RGB(44, 155, 226);
        label3.font = [UIFont systemFontOfSize:10];
        label3.textColor = RGB(255, 255, 255);
        label3.layer.masksToBounds = YES;
        label3.layer.cornerRadius = 5.0f;
        label3.text = @"自然生态";
        label3.textAlignment = NSTextAlignmentCenter;
        [expertView addSubview:label3];
        [scrollView addSubview:expertView];
        
    }
    UIScrollView *topicBtnScroV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.frame)+12*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    topicBtnScroV.showsHorizontalScrollIndicator = NO;
    topicBtnScroV.backgroundColor = [UIColor whiteColor];
    topicBtnScroV.contentSize = CGSizeMake(85*6, 0);
    for (int i = 0; i < 5; i ++)
    {
        UIButton *topicBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
        [topicBtn setTitle:@"话题分类" forState:UIControlStateNormal];
        [topicBtn setTitleColor:RGB(102, 102, 102)
                       forState:UIControlStateNormal];
        [topicBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateSelected];
        topicBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        topicBtn.frame = CGRectMake(85*i, 0, 85*SCREENW_RATE, 51*SCREENW_RATE);
        [topicBtnScroV addSubview:topicBtn];
        UIView *cutLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(topicBtn.frame), 16*SCREENW_RATE, 2*SCREENW_RATE, 20*SCREENW_RATE)];
        cutLine.backgroundColor = RGB(204, 204, 204);
        [topicBtnScroV addSubview:cutLine];
    }
    UIView *cutLine  = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topicBtnScroV.frame), topicBtnScroV.frame.size.width, 1)];
    cutLine.backgroundColor = RGB(221, 221, 221);
    [_tableHeadV addSubview:cutLine];
    
    [_tableHeadV addSubview:scrollView];
    [_tableHeadV addSubview:topicBtnScroV];
    _tableHeadV.frame = CGRectMake(0, 57, SCREENW, CGRectGetMaxY(topicBtnScroV.frame));
    [self.view addSubview:self.tableV];
    
#pragma mark 发布按钮
    UIImageView *publishImg = [[UIImageView alloc]initWithFrame:CGRectMake(285*SCREENW_RATE, 429*SCREENW_RATE, 61*SCREENW_RATE, 61*SCREENW_RATE)];
    publishImg.image = [UIImage imageNamed:@"fabu0"];
    UITapGestureRecognizer *publishTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(publish)];
    [publishImg addGestureRecognizer:publishTap];
    publishImg.userInteractionEnabled = YES;
    [self.view addSubview:publishImg];
    
}

- (UITableView *)tableV
{
    if (!_tableV)
    {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.backgroundColor = RGB(238, 238, 238);
        _tableV.tableHeaderView = _tableHeadV;
        _tableV.separatorInset = UIEdgeInsetsZero;
    }
    return _tableV;

}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellid";
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[TopicTableViewCell alloc]initWithStyle:  UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)publish
{
    PublishViewController *publishVC = [[PublishViewController alloc]init];
    [self.navigationController pushViewController:publishVC animated:YES];
    [self setHidesBottomBarWhenPushed:YES];
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
