//
//  QuizCell.m
//  texture
//
//  Created by 王澄宇 on 16/12/15.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "QuizCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation QuizCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 10*SCREENW_RATE, 31*SCREENW_RATE, 31*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang6"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+10*SCREENW_RATE, 22*SCREENW_RATE, 200*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.font = [UIFont systemFontOfSize:13];
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.text = @"提问者: 看天空的美";
        [self.contentView addSubview:_titleL];
        
        _timeL = [[UILabel alloc]initWithFrame:CGRectMake(297*SCREENW_RATE, 25*SCREENW_RATE, 66*SCREENW_RATE, 12*SCREENW_RATE)];
        _timeL.font = [UIFont systemFontOfSize:12];
        _timeL.textColor = RGB(102, 102, 102);
        _timeL.textAlignment = NSTextAlignmentRight;
        _timeL.text = @"2016.11.22";
        [self.contentView addSubview:_timeL];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_headImg.frame)+12*SCREENW_RATE, 340*SCREENW_RATE, 15*SCREENW_RATE)];
        _textL.font = [UIFont systemFontOfSize:15];
        _textL.textColor = RGB(51, 51, 51);
        _textL.text = @"等闲识得春风面,万紫千红总是春";
        _textL.lineBreakMode = NSLineBreakByTruncatingTail;
        _textL.numberOfLines = 1;
        [self.contentView addSubview:_textL];
        
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_textL.frame)+7*SCREENW_RATE, 352*SCREENW_RATE, 1*SCREENW_RATE)];
        lineV.backgroundColor = RGB(221, 221, 221);
        [self.contentView addSubview:lineV];
        
        UILabel *introL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+12*SCREENW_RATE, 208*SCREENW_RATE, 13*SCREENW_RATE)];
        introL.textColor = RGB(102, 102, 102);
        introL.font = [UIFont systemFontOfSize:12];
        introL.text = @"我来凑凑热闹说说自己的观点吧..";
        [self.contentView addSubview:introL];
        
        _answerMoneyL = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW - 30*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+14*SCREENW_RATE, 30*SCREENW_RATE, 12*SCREENW_RATE)];
        _answerMoneyL.textColor = RGB(102, 102, 102);
        _answerMoneyL.font = [UIFont systemFontOfSize:13];
        _answerMoneyL.text = @"¥ 5";
        [self.contentView addSubview:_answerMoneyL];
        
        _anserUserName = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(introL.frame)+10*SCREENW_RATE, 220*SCREENW_RATE, 14*SCREENW_RATE)];
        _anserUserName.textColor = RGB(102, 102, 102);
        _anserUserName.font = [UIFont systemFontOfSize:12];
        _anserUserName.text = @"来自 大自然搬运工 的回答";
        [self.contentView addSubview:_anserUserName];
        
        UIImageView *conmentImg = [[UIImageView alloc]initWithFrame:CGRectMake(244*SCREENW_RATE, _anserUserName.frame.origin.y, 11*SCREENW_RATE, 10*SCREENW_RATE)];
        conmentImg.image = [UIImage imageNamed:@"pinglun0"];
        [self.contentView addSubview:conmentImg];
        
        _conmentNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentImg.frame)+5*SCREENW_RATE, CGRectGetMaxY(introL.frame)+10*SCREENW_RATE, 40*SCREENW_RATE, 10*SCREENW_RATE)];
        _conmentNumL.textColor = RGB(102, 102, 102);
        _conmentNumL.font = [UIFont systemFontOfSize:10];
        _conmentNumL.textAlignment = NSTextAlignmentCenter;
        _conmentNumL.text = @"352";
        [self.contentView addSubview:_conmentNumL];
        
        UIImageView *appreciateImg = [[UIImageView alloc]initWithFrame:CGRectMake(314*SCREENW_RATE, conmentImg.frame.origin.y, 10*SCREENW_RATE, 10*SCREENW_RATE)];
        appreciateImg.image = [UIImage imageNamed:@"dianzan0"];
        [self.contentView addSubview:appreciateImg];
        
        _appreciateNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(appreciateImg.frame)+9*SCREENW_RATE, _conmentNumL.frame.origin.y, 40*SCREENW_RATE, 10*SCREENW_RATE)];
        _appreciateNumL.textColor = RGB(102, 102, 102);
        _appreciateNumL.font = [UIFont systemFontOfSize:10];
        _appreciateNumL.text = @"9999+";
        [self.contentView addSubview:_appreciateNumL];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
