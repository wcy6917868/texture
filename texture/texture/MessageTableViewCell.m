//
//  MessageTableViewCell.m
//  texture
//
//  Created by 王澄宇 on 16/11/7.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "MessageTableViewCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation MessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 50*SCREENW_RATE, 50*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang6"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+14*SCREENW_RATE, _headImg.frame.origin.y, 75*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.text  = @"stkFun";
        [self.contentView addSubview:_titleL];
        
        _dateL = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW - 84*SCREENW_RATE, _titleL.frame.origin.y, 72*SCREENW_RATE, 11*SCREENW_RATE)];
        _dateL.font = [UIFont systemFontOfSize:13];
        _dateL.textColor = RGB(102, 102, 102);
        _dateL.text = @"2016.10.17";
        [self.contentView addSubview:_dateL];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(_titleL.frame.origin.x, CGRectGetMaxY(_titleL.frame)+14*SCREENW_RATE, 210*SCREENW_RATE, 15*SCREENW_RATE)];
        _textL.font = [UIFont systemFontOfSize:13];
        _textL.textColor = RGB(102, 102, 102);
        _textL.text = @"啦啦啦啦啦啦啦,骚的不行";
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
