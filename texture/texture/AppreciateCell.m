//
//  AppreciateCell.m
//  texture
//
//  Created by 王澄宇 on 16/11/17.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "AppreciateCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation AppreciateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 10*SCREENW_RATE, 31*SCREENW_RATE, 31*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang4"];
        [self.contentView addSubview:_headImg];
        
        _nameL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+10*SCREENW_RATE, 19*SCREENW_RATE, 100*SCREENW_RATE, 15*SCREENW_RATE)];
        _nameL.font = [UIFont systemFontOfSize:13];
        _nameL.textColor = RGB(51, 51, 51);
        NSString *nameStr = @"一夜风流";
        NSString *allStr = [NSString stringWithFormat:@"%@赞了你",nameStr];
        NSMutableAttributedString *theStr = [[NSMutableAttributedString alloc]initWithString:allStr];
        NSRange blueRange = NSMakeRange([[theStr string]rangeOfString:nameStr].location, [[theStr string]rangeOfString:nameStr].length);
        [theStr addAttribute:NSForegroundColorAttributeName value:RGB(53, 195, 236) range:blueRange];
        _nameL.attributedText = theStr;
        [self.contentView addSubview:_nameL];
        
        _timeL = [[UILabel alloc]initWithFrame:CGRectMake(263*SCREENW_RATE, 20*SCREENW_RATE, 100*SCREENW_RATE, 13*SCREENW_RATE)];
        _timeL.font = [UIFont systemFontOfSize:13];
        _timeL.textColor = RGB(102, 102, 102);
        _timeL.text = @"14 : 39";
        _timeL.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeL];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_headImg.frame)+12*SCREENW_RATE, 340*SCREENW_RATE, 15*SCREENW_RATE)];
        _textL.textColor = RGB(51, 51, 51);
        _textL.font = [UIFont systemFontOfSize:15];
        _textL.text = @"有哪些汽车零部件看起来很简单,但是设计起来非常的复杂困难,需要难度";
        _textL.lineBreakMode = NSLineBreakByTruncatingTail;
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
