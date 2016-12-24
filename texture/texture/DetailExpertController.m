//
//  DetailExpertController.m
//  texture
//
//  Created by 王澄宇 on 16/12/19.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "DetailExpertController.h"
#import "DetailExpertCell.h"
#import "ExpertAnswerController.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@interface DetailExpertController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *topicBtn;
}
@property (nonatomic,strong)UITableView *tableV;

@end

@implementation DetailExpertController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI
{
    self.view.backgroundColor = RGB(245, 245, 245);
    
    UIImageView *bigBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 282*SCREENW_RATE)];
    bigBack.image = [UIImage imageNamed:@"bg4"];
    [self.view addSubview:bigBack];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(12*SCREENW_RATE, 25*SCREENW_RATE, 10*SCREENW_RATE, 18*SCREENW_RATE);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"arrow_left2"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UIButton *addFriendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addFriendBtn.frame  = CGRectMake(350*SCREENW_RATE, backBtn.frame.origin.y+3*SCREENW_RATE, 13*SCREENW_RATE, 14*SCREENW_RATE);
    [addFriendBtn setBackgroundImage:[UIImage imageNamed:@"jiahaoyou0"] forState:UIControlStateNormal];
    [self.view addSubview:addFriendBtn];
    
    UIButton *attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    attentionBtn.frame = CGRectMake(313*SCREENW_RATE, CGRectGetMaxY(addFriendBtn.frame)+22*SCREENW_RATE, 51*SCREENW_RATE, 16*SCREENW_RATE);
    [attentionBtn setTitle:@"+关注" forState:UIControlStateNormal];
    [attentionBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    attentionBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    attentionBtn.layer.borderColor = RGB(255, 255, 255).CGColor;
    attentionBtn.layer.cornerRadius = 5.0f;
    attentionBtn.layer.masksToBounds = YES;
    attentionBtn.layer.borderWidth = 0.5f;
    [self.view addSubview:attentionBtn];
    
    UIButton *awardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    awardBtn.frame = CGRectMake(313*SCREENW_RATE, CGRectGetMaxY(attentionBtn.frame)+10*SCREENW_RATE, 51*SCREENW_RATE, 16*SCREENW_RATE);
    [awardBtn setTitle:@"打赏" forState:UIControlStateNormal];
    [awardBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    awardBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    awardBtn.layer.borderColor = RGB(255, 255, 255).CGColor;
    awardBtn.layer.cornerRadius = 5.0f;
    awardBtn.layer.masksToBounds = YES;
    awardBtn.layer.borderWidth = 0.5f;
    [self.view addSubview:awardBtn];
    
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(162*SCREENW_RATE, CGRectGetMaxY(awardBtn.frame), 51*SCREENW_RATE, 51*SCREENW_RATE)];
    headImg.image = [UIImage imageNamed:@"touxiang6"];
    [self.view addSubview:headImg];
    
    UILabel *nameL = [[UILabel alloc]init];
    UIFont *nameFont = [UIFont systemFontOfSize:15];
    nameL.font = nameFont;
    nameL.textColor = RGB(255, 255, 255);
    nameL.text = @"豆浆油条";
    CGRect nameRect = [nameL.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 15*SCREENW_RATE) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:nameFont,NSFontAttributeName, nil] context:nil];
    nameL.frame = CGRectMake(0, 0, nameRect.size.width, 15*SCREENW_RATE);
    nameL.center = CGPointMake(SCREENW/2, CGRectGetMaxY(headImg.frame)+18*SCREENW_RATE);
    [self.view addSubview:nameL];
    
    UIImageView *boshimao = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameL.frame)+6*SCREENW_RATE, nameL.frame.origin.y+2*SCREENW_RATE, 15*SCREENW_RATE, 11*SCREENW_RATE)];
    boshimao.image = [UIImage imageNamed:@"boshimao0"];
    [self.view addSubview:boshimao];
    
    NSArray *titleArray = @[@"专家",@"标签",@"自然生态"];
    for (int i = 0; i < titleArray.count; i ++)
    {
        UILabel *tagL = [[UILabel alloc]initWithFrame:CGRectMake((73 + 73*i)*SCREENW_RATE, CGRectGetMaxY(nameL.frame)+12*SCREENW_RATE, 61*SCREENW_RATE, 20*SCREENW_RATE)];
        tagL.tag = 100 + i;
        if ([titleArray[i] length] > 2)
        {
            tagL.frame = CGRectMake((73 + 73*i)*SCREENW_RATE, CGRectGetMaxY(nameL.frame)+12*SCREENW_RATE, 81*SCREENW_RATE, 20*SCREENW_RATE);
        }
        tagL.textColor = RGB(255, 255, 255);
        tagL.font = [UIFont systemFontOfSize:12];
        tagL.textAlignment = NSTextAlignmentCenter;
        tagL.text = titleArray[i];
        tagL.layer.borderWidth = 0.3f;
        tagL.layer.borderColor = RGB(255, 255, 255).CGColor;
        tagL.layer.cornerRadius = 5.0f;
        tagL.layer.masksToBounds = YES;
        [self.view addSubview:tagL];
    }
    
    NSArray *tagArray = @[@"话题",@"粉丝",@"关注"];
    NSArray *numArray = @[@"354",@"2.7k",@"931"];
    UILabel *label = [self.view viewWithTag:100];
    for (int i = 0; i < tagArray.count; i ++)
    {
        UILabel *numberL = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW/3*i, CGRectGetMaxY(label.frame)+14*SCREENW_RATE, SCREENW/3, 62*SCREENW_RATE)];
        numberL.textColor = RGB(255, 255, 255);
        numberL.font = [UIFont systemFontOfSize:13];
        numberL.textAlignment = NSTextAlignmentCenter;
        numberL.numberOfLines = 2;
        numberL.text = [NSString stringWithFormat:@"%@\n%@",numArray[i],tagArray[i]];
        [self.view addSubview:numberL];
    }
    
    UIView *introView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bigBack.frame)+13*SCREENW_RATE, SCREENW, 100)];
    introView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:introView];
    
    UILabel *expertIntroL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 13*SCREENW_RATE, 65*SCREENW_RATE, 15*SCREENW_RATE)];
    expertIntroL.font = [UIFont systemFontOfSize:15];
    expertIntroL.textColor = RGB(51, 51, 51);
    expertIntroL.text = @"专家介绍";
    [introView addSubview:expertIntroL];
    
    UILabel *textL = [[UILabel alloc]init];
    UIFont *textFont = [UIFont systemFontOfSize:13];
    textL.font = textFont;
    textL.numberOfLines = 0;
    textL.textColor = RGB(102, 102, 102);
    textL.text = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈";
    CGRect textRect = [textL.text boundingRectWithSize:CGSizeMake(348*SCREENW_RATE, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName, nil] context:nil];
    textL.frame = CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(expertIntroL.frame)+12*SCREENW_RATE, 348*SCREENW_RATE, textRect.size.height);
    [introView addSubview:textL];
    
    CGRect introFrame  =  introView.frame;
    introFrame.size.height = CGRectGetMaxY(textL.frame)+12*SCREENW_RATE;
    introView.frame = introFrame;
    
    topicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    topicBtn.frame = CGRectMake(0, CGRectGetMaxY(introView.frame)+12*SCREENW_RATE, SCREENW/2, 51*SCREENW_RATE);
    topicBtn.backgroundColor = [UIColor whiteColor];
    [topicBtn setTitle:@"话题" forState:UIControlStateNormal];
    topicBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [topicBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [topicBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateSelected];
    [self.view addSubview:topicBtn];
    
    UIButton *answerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    answerBtn.backgroundColor = [UIColor whiteColor];
    answerBtn.frame = CGRectMake(CGRectGetMaxX(topicBtn.frame),
    CGRectGetMaxY(introView.frame)+12*SCREENW_RATE, SCREENW/2, 51*SCREENW_RATE);
    answerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [answerBtn setTitle:@"回答" forState:UIControlStateNormal];
    [answerBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [answerBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateSelected];
    [self.view addSubview:answerBtn];
    
    UIView *fengeline = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(topicBtn.frame), topicBtn.frame.origin.y + 10*SCREENW_RATE, 2*SCREENW_RATE, 31*SCREENW_RATE)];
    fengeline.backgroundColor = RGB(221, 221, 211);
    [self.view addSubview:fengeline];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topicBtn.frame) - 2, SCREENW, 1)];
    lineV.backgroundColor = RGB(238, 238, 238);
    [self.view addSubview:lineV];
    [self.view addSubview:self.tableV];
    
    UIView *contactView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREENH - 51*SCREENW_RATE, SCREENW, 51*SCREENW_RATE)];
    contactView.backgroundColor = RGB(53, 195, 236);
    [self.view addSubview:contactView];
    
    UIView *contactOnline = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 5*SCREENW_RATE, 170*SCREENW_RATE, 41*SCREENW_RATE)];
    contactOnline.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.3f];
    contactOnline.layer.cornerRadius = 5.0f;
    contactOnline.layer.masksToBounds = YES;
    [contactView addSubview:contactOnline];
    
    UIImageView *chatImg = [[UIImageView alloc]initWithFrame:CGRectMake(45*SCREENW_RATE, 12*SCREENW_RATE, 18*SCREENW_RATE, 17*SCREENW_RATE)];
    chatImg.image = [UIImage imageNamed:@""];
    [contactOnline addSubview:chatImg];
    
    UILabel *contactL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(chatImg.frame)+12*SCREENW_RATE, 15*SCREENW_RATE, 55*SCREENW_RATE, 15*SCREENW_RATE)];
    contactL.textColor = RGB(255, 255, 255);
    contactL.font = [UIFont systemFontOfSize:13];
    contactL.text = @"在线沟通";
    [contactOnline addSubview:contactL];
    
    UIView *quickAnswer = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(contactOnline.frame)+5*SCREENW_RATE, 5*SCREENW_RATE, 170*SCREENW_RATE, 41*SCREENW_RATE)];
    quickAnswer.userInteractionEnabled = YES;
    UITapGestureRecognizer *answerTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quickAnswer)];
    [quickAnswer addGestureRecognizer:answerTap];
    quickAnswer.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.3f];
    quickAnswer.layer.cornerRadius = 5.0f;
    quickAnswer.layer.masksToBounds = YES;
    [contactView addSubview:quickAnswer];
    
    UIImageView *askImg = [[UIImageView alloc]initWithFrame:CGRectMake(45*SCREENW_RATE, 12*SCREENW_RATE, 18*SCREENW_RATE, 17*SCREENW_RATE)];
    askImg.image = [UIImage imageNamed:@""];
    [quickAnswer addSubview:askImg];
    
    UILabel *askL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(askImg.frame)+12*SCREENW_RATE, 15*SCREENW_RATE, 55*SCREENW_RATE, 15*SCREENW_RATE)];
    askL.textColor = RGB(255, 255, 255);
    askL.font = [UIFont systemFontOfSize:13];
    askL.text = @"快速提问";
    [quickAnswer addSubview:askL];

}

- (UITableView *)tableV
{
    if (!_tableV)
    {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topicBtn.frame), SCREENW, SCREENH - 440*SCREENW_RATE) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.separatorInset = UIEdgeInsetsZero;
        _tableV.backgroundColor = RGB(238, 238, 238);
  }
    return _tableV;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 182*SCREENW_RATE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    DetailExpertCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[DetailExpertCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = NO;
    self.navigationController.navigationBar.hidden = NO;
}

- (void)quickAnswer
{
    ExpertAnswerController *EAVC = [[ExpertAnswerController alloc]init];
    [self.navigationController pushViewController:EAVC animated:YES];
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
