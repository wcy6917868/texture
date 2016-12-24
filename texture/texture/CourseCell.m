//
//  CourseCell.m
//  texture
//
//  Created by 王澄宇 on 16/11/10.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "CourseCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation CourseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 40*SCREENW_RATE, 40*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang8"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+12*SCREENW_RATE, _headImg.frame.origin.y, 200*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.text = @"不一样的节奏,一样的街头";
        [self.contentView addSubview:_titleL];
        
        _skillL = [[UILabel alloc]initWithFrame:CGRectMake(_titleL.frame.origin.x, CGRectGetMaxY(_titleL.frame)+11*SCREENW_RATE, 80*SCREENW_RATE, 15*SCREENW_RATE)];
        _skillL.textColor = RGB(102, 102, 102);
        _skillL.font = [UIFont systemFontOfSize:13];
        _skillL.text = @"摄影狂人";
        [self.contentView addSubview:_skillL];
        
        _timeL = [[UILabel alloc]initWithFrame:CGRectMake(250*SCREENW_RATE, CGRectGetMaxY(_titleL.frame)+12*SCREENW_RATE, 120*SCREENW_RATE, 13*SCREENW_RATE)];
        _timeL.font = [UIFont systemFontOfSize:13];
        _timeL.textColor = RGB(102, 102, 102);
        _timeL.text = @"2016.10.20 20:00";
        [self.contentView addSubview:_timeL];
        
        _statusL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_headImg.frame)+12*SCREENW_RATE,55,15)];
        _statusL.font = [UIFont systemFontOfSize:13];
        _statusL.textColor = RGB(102, 102, 102);
        _statusL.text = @"正在直播";
        [self.contentView addSubview:_statusL];
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
