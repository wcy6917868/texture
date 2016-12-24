//
//  GroupTableViewCell.m
//  texture
//
//  Created by 王澄宇 on 16/11/18.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "GroupTableViewCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation GroupTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 41*SCREENW_RATE, 41*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang7@2x"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+12*SCREENW_RATE, 12*SCREENW_RATE, 200*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.textAlignment = NSTextAlignmentLeft;
        _titleL.text = @"极光爱好者";
        [self.contentView addSubview:_titleL];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+12*SCREENW_RATE, CGRectGetMaxY(_titleL.frame)+11*SCREENW_RATE, 293*SCREENW_RATE, 28*SCREENW_RATE)];
        _textL.numberOfLines = 0;
        _textL.textColor = RGB(102, 102, 102);
        _textL.font = [UIFont systemFontOfSize:13];
        _textL.text = @"彩虹又称之为美丽的天虹,是气象中的一种光学气象,非常的漂亮,非常的美丽";
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
