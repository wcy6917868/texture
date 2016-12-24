//
//  InvitationDetailCell.m
//  texture
//
//  Created by 王澄宇 on 16/11/11.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "InvitationDetailCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]


@implementation InvitationDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 50*SCREENW_RATE, 50*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang8"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+14*SCREENW_RATE, _headImg.frame.origin.y+2*SCREENW_RATE, 100*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.font = [UIFont systemFontOfSize:13];
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.text = @"叫我可爱逼";
        [self.contentView addSubview:_titleL];
        
        _dateL = [[UILabel alloc]initWithFrame:CGRectMake(292*SCREENW_RATE, _titleL.frame.origin.y+1, 80*SCREENW_RATE, 13*SCREENW_RATE)];
        _dateL.font = [UIFont systemFontOfSize:13];
        _dateL.textColor = RGB(102, 102, 102);
        _dateL.text = @"2016.10.20";
        [self.contentView addSubview:_dateL];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+13*SCREENW_RATE, CGRectGetMaxY(_titleL.frame)+15*SCREENW_RATE, 200*SCREENW_RATE, 15*SCREENW_RATE)];
        _textL.font = [UIFont systemFontOfSize:15];
        _textL.textColor = RGB(51, 51, 51);
        _textL.textAlignment = NSTextAlignmentLeft;
        _textL.text = @"终于抢到一个沙发~~";
        [self.contentView addSubview:_textL];
        
        UIImageView *conmentImg = [[UIImageView alloc]initWithFrame:CGRectMake(242*SCREENW_RATE,CGRectGetMaxY(_textL.frame)+19*SCREENW_RATE, 11*SCREENW_RATE, 10*SCREENW_RATE)];
        conmentImg.image = [UIImage imageNamed:@"pinglun0"];
        [self.contentView addSubview:conmentImg];
        
        _conmentNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentImg.frame)+5*SCREENW_RATE, conmentImg.frame.origin.y+2*SCREENW_RATE, 40*SCREENW_RATE, 10*SCREENW_RATE)];
        _conmentNumL.textColor = RGB(102, 102, 102);
        _conmentNumL.font = [UIFont systemFontOfSize:10];
        _conmentNumL.textAlignment = NSTextAlignmentCenter;
        _conmentNumL.text = @"352";
        [self.contentView addSubview:_conmentNumL];
        
        UIImageView *appreciateImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentImg.frame)+59*SCREENW_RATE, conmentImg.frame.origin.y, 10*SCREENW_RATE, 10*SCREENW_RATE)];
        appreciateImg.image = [UIImage imageNamed:@"dianzan0"];
        [self.contentView addSubview:appreciateImg];
        
        _adimireNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(appreciateImg.frame)+9*SCREENW_RATE, _conmentNumL.frame.origin.y+2, 40*SCREENW_RATE, 10*SCREENW_RATE)];
        _adimireNumL.textColor = RGB(102, 102, 102);
        _adimireNumL.font = [UIFont systemFontOfSize:10];
        _adimireNumL.text = @"9999+";
        [self.contentView addSubview:_adimireNumL];
        
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(62*SCREENW_RATE, CGRectGetMaxY(conmentImg.frame)+18*SCREENW_RATE, SCREENW - 62*SCREENW_RATE, 1)];
        lineV.backgroundColor = RGB(221, 221, 221);
        [self.contentView addSubview:lineV];
        
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
