//
//  MyCollectCell.m
//  texture
//
//  Created by 王澄宇 on 16/12/16.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "MyCollectCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation MyCollectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 181*SCREENW_RATE)];
        view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:view];
        
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 10*SCREENW_RATE, 31*SCREENW_RATE, 31*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang6"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+10*SCREENW_RATE, 19*SCREENW_RATE, 200*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.font = [UIFont systemFontOfSize:13];
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.text = @"机械专家";
        [self.contentView addSubview:_titleL];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_headImg.frame)+12*SCREENW_RATE, 340*SCREENW_RATE, 15*SCREENW_RATE)];
        _textL.font = [UIFont systemFontOfSize:15];
        _textL.textColor = RGB(51, 51, 51);
        _textL.text = @"有哪些汽车零部件看起来很简单,但是设计起来很复杂繁琐";
        _textL.lineBreakMode = NSLineBreakByTruncatingTail;
        _textL.numberOfLines = 1;
        [self.contentView addSubview:_textL];
        
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_textL.frame)+7*SCREENW_RATE, 352*SCREENW_RATE, 1*SCREENW_RATE)];
        lineV.backgroundColor = RGB(221, 221, 221);
        [self.contentView addSubview:lineV];
        
        _answerL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+12*SCREENW_RATE, 342*SCREENW_RATE, 57*SCREENW_RATE)];
        _answerL.font = [UIFont systemFontOfSize:12];
        _answerL.textColor = RGB(102, 102, 102);
        _answerL.lineBreakMode = NSLineBreakByTruncatingTail;
        _answerL.numberOfLines = 3;
        _answerL.text = @"让我来告诉大家吧,22222333333335555666778889999977666997777799667997";
        [self.contentView addSubview:_answerL];
        
        _timeL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_answerL.frame)+12*SCREENW_RATE, 100*SCREENW_RATE, 12*SCREENW_RATE)];
        _timeL.font = [UIFont systemFontOfSize:12];
        _timeL.textColor = RGB(102, 102, 102);
        _timeL.textAlignment = NSTextAlignmentLeft;
        _timeL.text = @"36分钟前";
        [self.contentView addSubview:_timeL];
        
        UIImageView *conmentImg = [[UIImageView alloc]initWithFrame:CGRectMake(244*SCREENW_RATE, CGRectGetMaxY(_answerL.frame)+12*SCREENW_RATE, 11*SCREENW_RATE, 10*SCREENW_RATE)];
        conmentImg.image = [UIImage imageNamed:@"pinglun0"];
        [self.contentView addSubview:conmentImg];
        
        _conmentNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentImg.frame)+5*SCREENW_RATE, CGRectGetMaxY(_answerL.frame)+14*SCREENW_RATE, 40*SCREENW_RATE, 10*SCREENW_RATE)];
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
