//
//  SystemMesTableViewCell.m
//  texture
//
//  Created by 王澄宇 on 16/11/17.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "SystemMesTableViewCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation SystemMesTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(13*SCREENW_RATE, 11*SCREENW_RATE, 100*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.text = @"系统消息更新";
        _titleL.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleL];
        
        _timeL = [[UILabel alloc]initWithFrame:CGRectMake(263*SCREENW_RATE, 15*SCREENW_RATE, 100*SCREENW_RATE, 13*SCREENW_RATE)];
        _timeL.textColor = RGB(102, 102, 102);
        _timeL.font = [UIFont systemFontOfSize:13];
        _timeL.text = @"15 : 33";
        _timeL.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeL];
        
        _textL  = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_titleL.frame)+12*SCREENW_RATE, 351*SCREENW_RATE, 43*SCREENW_RATE)];
        _textL.textColor = RGB(102, 102, 102);
        _textL.font = [UIFont systemFontOfSize:13];
        _textL.text = @"   系统更新升级,通过硬件或者软件的手段,提高电脑的性能速度和增加功能,系统升级两个方面的升级 硬件升级和软件的一起升级,来加强APP的运行体验";
        _textL.numberOfLines = 0;
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
