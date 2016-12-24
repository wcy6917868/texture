//
//  ConmentTableViewCell.m
//  texture
//
//  Created by 王澄宇 on 16/11/17.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "ConmentTableViewCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation ConmentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 10*SCREENW_RATE, 31*SCREENW_RATE, 31*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang6"];
        [self.contentView addSubview:_headImg];
        
        _nameL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+10*SCREENW_RATE, 11*SCREENW_RATE, 100*SCREENW_RATE, 15*SCREENW_RATE)];
        _nameL.textColor = RGB(51, 51, 51);
        _nameL.textAlignment = NSTextAlignmentLeft;
        _nameL.font = [UIFont systemFontOfSize:15];
        _nameL.text = @"机械专家";
        [self.contentView addSubview:_nameL];
        
        _timeL = [[UILabel alloc]initWithFrame:CGRectMake(_nameL.frame.origin.x, CGRectGetMaxY(_nameL.frame)+5*SCREENW_RATE, 100*SCREENW_RATE, 11*SCREENW_RATE)];
        _timeL.font = [UIFont systemFontOfSize:13];
        _timeL.textColor = RGB(102, 102, 102);
        _timeL.text = @"14 : 39";
        _timeL.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_timeL];
        
        _conmentTextL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_headImg.frame)+12*SCREENW_RATE, 300*SCREENW_RATE, 15*SCREENW_RATE)];
        _conmentTextL.font = [UIFont systemFontOfSize:15];
        _conmentTextL.textColor = RGB(51, 51, 51);
        _conmentTextL.text = @"哎哟不错,小伙子你很棒奥";
        [self.contentView addSubview:_conmentTextL];
        
        UIButton *replyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        replyBtn.frame = CGRectMake(335*SCREENW_RATE, 30*SCREENW_RATE, 33*SCREENW_RATE, 15*SCREENW_RATE);
        replyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [replyBtn setTitle:@"回复" forState:UIControlStateNormal];
        [replyBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateNormal];
        [self.contentView addSubview:replyBtn];
        
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_conmentTextL.frame)+12*SCREENW_RATE, 351*SCREENW_RATE, 1*SCREENW_RATE)];
        lineV.backgroundColor = RGB(221, 221, 221);
        [self.contentView addSubview:lineV];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+12*SCREENW_RATE, 295*SCREENW_RATE, 13*SCREENW_RATE)];
        _textL.font = [UIFont systemFontOfSize:13];
        _textL.textColor = RGB(102, 102, 102);
        _textL.text = @"有哪些汽车零部件看起来非常的简单,但是设计起来却是极度苦难";
        _textL.lineBreakMode =  NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_textL];
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
