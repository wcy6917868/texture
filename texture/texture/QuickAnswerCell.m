//
//  QuickAnswerCell.m
//  texture
//
//  Created by 王澄宇 on 16/12/16.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "QuickAnswerCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation QuickAnswerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
        {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 119*SCREENW_RATE)];
            view.backgroundColor = [UIColor whiteColor];
            [self.contentView addSubview:view];
            
            _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 10*SCREENW_RATE, 31*SCREENW_RATE, 31*SCREENW_RATE)];
            _headImg.image = [UIImage imageNamed:@"touxiang6"];
            [self.contentView addSubview:_headImg];
            
            _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+10*SCREENW_RATE, 22*SCREENW_RATE, 200*SCREENW_RATE, 15*SCREENW_RATE)];
            _titleL.font = [UIFont systemFontOfSize:13];
            _titleL.textColor = RGB(51, 51, 51);
            _titleL.text = @": 看天空的美";
            [self.contentView addSubview:_titleL];
            
            _timeL = [[UILabel alloc]initWithFrame:CGRectMake(297*SCREENW_RATE, 25*SCREENW_RATE, 66*SCREENW_RATE, 12*SCREENW_RATE)];
            _timeL.font = [UIFont systemFontOfSize:12];
            _timeL.textColor = RGB(102, 102, 102);
            _timeL.textAlignment = NSTextAlignmentRight;
            _timeL.text = @"2016.11.22";
            [self.contentView addSubview:_timeL];
            
            _textL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_headImg.frame)+12*SCREENW_RATE, 340*SCREENW_RATE, 15*SCREENW_RATE)];
            _textL.font = [UIFont systemFontOfSize:15*SCREENW_RATE];
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
            introL.text = @"很抱歉奥,这个我也不知道...";
            [self.contentView addSubview:introL];
            
        }
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
