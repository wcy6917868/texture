//
//  FansCell.m
//  texture
//
//  Created by 王澄宇 on 16/12/11.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "FansCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation FansCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 40*SCREENW_RATE, 40*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang4"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+12*SCREENW_RATE, 17*SCREENW_RATE, 150*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.textAlignment = NSTextAlignmentLeft;
        _titleL.font = [UIFont systemFontOfSize:15*SCREENW_RATE];
        _titleL.text = @"一江春水";
        [self.contentView addSubview:_titleL];
        
        UILabel *topicL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+12*SCREENW_RATE, CGRectGetMaxY(_titleL.frame)+10*SCREENW_RATE, 30*SCREENW_RATE, 13*SCREENW_RATE)];
        topicL.textColor = RGB(102, 102, 102);
        //topicL.textAlignment = NSTextAlignmentLeft;
        topicL.font = [UIFont systemFontOfSize:12*SCREENW_RATE];
        topicL.text = @"话题";
        [self.contentView addSubview:topicL];
        
        _topicNum = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(topicL.frame)+12*SCREENW_RATE, topicL.frame.origin.y, 50*SCREENW_RATE, 13*SCREENW_RATE)];
        _topicNum.textColor = RGB(102, 102, 102);
        _topicNum.textAlignment = NSTextAlignmentLeft;
        _topicNum.font = [UIFont systemFontOfSize:12*SCREENW_RATE];
        _topicNum.text = @"324";
        [self.contentView addSubview:_topicNum];
        
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_topicNum.frame)+12*SCREENW_RATE, 351*SCREENW_RATE, 1)];
        lineV.backgroundColor = RGB(221, 221, 221);
        [self.contentView addSubview:lineV];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+12*SCREENW_RATE, 300*SCREENW_RATE, 15*SCREENW_RATE)];
        _textL.textColor = RGB(51, 51, 51);
        _textL.textAlignment = NSTextAlignmentLeft;
        _textL.font = [UIFont systemFontOfSize:15*SCREENW_RATE];
        _textL.text = @"等闲识得东风面,万紫千红总是春";
        [self.contentView addSubview:_textL];
        
        _timeL = [[UILabel alloc]initWithFrame:CGRectMake(320*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+14*SCREENW_RATE, 50*SCREENW_RATE, 12*SCREENW_RATE)];
        _timeL.font = [UIFont systemFontOfSize:13*SCREENW_RATE];
        _timeL.textColor = RGB(102, 102, 102);
        _timeL.text = @"16 : 38";
        [self.contentView addSubview:_timeL];
        
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
