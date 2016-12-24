//
//  TopicTableViewCell.m
//  texture
//
//  Created by 王澄宇 on 16/11/4.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "TopicTableViewCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation TopicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 50*SCREENW_RATE, 50*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang3"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+14*SCREENW_RATE, _headImg.frame.origin.y, 75*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.text  = @"IT狂人";
        [self.contentView addSubview:_titleL];
        
        _dateL = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW - 84*SCREENW_RATE, _titleL.frame.origin.y, 72*SCREENW_RATE, 11*SCREENW_RATE)];
        _dateL.font = [UIFont systemFontOfSize:13];
        _dateL.textColor = RGB(102, 102, 102);
        _dateL.text = @"2016.10.17";
        [self.contentView addSubview:_dateL];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(_titleL.frame.origin.x, CGRectGetMaxY(_titleL.frame)+14*SCREENW_RATE, 210*SCREENW_RATE, 15*SCREENW_RATE)];
        _textL.font = [UIFont systemFontOfSize:15];
        _textL.textColor = RGB(102, 102, 102);
        _textL.text = @"只想做一个安静的标题党";
        [self.contentView addSubview:_textL];
        
        UIView *conmentView = [[UIView alloc]initWithFrame:CGRectMake(241*SCREENW_RATE, CGRectGetMaxY(_textL.frame)+20*SCREENW_RATE, 45*SCREENW_RATE, 15*SCREENW_RATE)];
        UIImageView *conmentImg = [[UIImageView alloc]initWithFrame:CGRectMake(2*SCREENW_RATE, 2*SCREENW_RATE, 11*SCREENW_RATE, 10*SCREENW_RATE)];
        conmentImg.image = [UIImage imageNamed:@"pinglun0"];
        [conmentView addSubview:conmentImg];
        [self.contentView addSubview:conmentView];
        
        _conmentL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentImg.frame)+9*SCREENW_RATE, conmentImg.frame.origin.y, 22*SCREENW_RATE, 10*SCREENW_RATE)];
        _conmentL.font = [UIFont systemFontOfSize:10];
        _conmentL.textColor = RGB(102, 102, 102);
        _conmentL.text = @"357";
        [conmentView addSubview:_conmentL];
        
        UIView *admireView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(conmentView.frame)+33*SCREENW_RATE, conmentView.frame.origin.y, 45*SCREENW_RATE, 15*SCREENW_RATE)];
        UIImageView *admireImg = [[UIImageView alloc]initWithFrame:CGRectMake(2*SCREENW_RATE, 2*SCREENW_RATE, 10*SCREENW_RATE, 10*SCREENW_RATE)];
        admireImg.image = [UIImage imageNamed:@"dianzan0"];
        [admireView addSubview:admireImg];
        
        UILabel *admireL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(admireImg.frame)+9*SCREENW_RATE, admireImg.frame.origin.y, 31*SCREENW_RATE, 10*SCREENW_RATE)];
        admireL.font = [UIFont systemFontOfSize:10];
        admireL.textColor = RGB(102, 102, 102);
        admireL.text = @"9999";
        [admireView addSubview:admireL];
        [self.contentView addSubview:admireView];
        
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
