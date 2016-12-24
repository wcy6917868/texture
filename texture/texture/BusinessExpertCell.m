//
//  BusinessExpertCell.m
//  texture
//
//  Created by 王澄宇 on 16/12/19.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "BusinessExpertCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation BusinessExpertCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 31*SCREENW_RATE, 31*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang4"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]init];
        UIFont *titleFont = [UIFont systemFontOfSize:13];
        _titleL.text = @"ssssssss";
        CGRect titleRect = [_titleL.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 15*SCREENW_RATE) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:titleFont,NSFontAttributeName, nil] context:nil];
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+8*SCREENW_RATE, 14*SCREENW_RATE, titleRect.size.width*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.text = @"ssssssss";
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.font = titleFont;
        _titleL.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleL];
        
        UIImageView *doctorialHat = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_titleL.frame), _titleL.frame.origin.y, 15*SCREENW_RATE, 11*SCREENW_RATE)];
        doctorialHat.image = [UIImage imageNamed:@"boshimao1"];
        [self.contentView addSubview:doctorialHat];
        
        _publishNum = [[UILabel alloc]initWithFrame:CGRectMake(_titleL.frame.origin.x, CGRectGetMaxY(_titleL.frame)+5*SCREENW_RATE, 55*SCREENW_RATE, 15*SCREENW_RATE)];
        _publishNum.textColor = RGB(102, 102, 102);
        _publishNum.font = [UIFont systemFontOfSize:12];
        _publishNum.text = @"发布 999";
        [self.contentView addSubview:_publishNum];
        
        UIView *fengeLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_publishNum.frame)+15*SCREENW_RATE, _publishNum.frame.origin.y+5*SCREENW_RATE, 1, 8*SCREENW_RATE)];
        fengeLine.backgroundColor = RGB(221, 221, 221);
        [self.contentView addSubview:fengeLine];
        
        _answerNum = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(fengeLine.frame)+15*SCREENW_RATE, _publishNum.frame.origin.y, 130*SCREENW_RATE, 15*SCREENW_RATE)];
        _answerNum.textColor = RGB(102, 102, 102);
        _answerNum.font = [UIFont systemFontOfSize:12];
        _answerNum.text = @"回答 354 (采纳 268)";
        _answerNum.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_answerNum];
        
        UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, CGRectGetMaxY(_answerNum.frame)+7*SCREENW_RATE, 351*SCREENW_RATE, 1)];
        lineV.backgroundColor = RGB(221, 221, 221);
        [self.contentView addSubview:lineV];
        
        NSArray *tagArray = @[@"专家",@"标签",@"自然生态"];
        for (int i = 0; i < 3; i ++)
        {
            UILabel *tagLabel = [[UILabel alloc]initWithFrame:CGRectMake((12+72*i)*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+10*SCREENW_RATE, 61*SCREENW_RATE, 20*SCREENW_RATE)];
            tagLabel.layer.cornerRadius = 5.0f;
            tagLabel.layer.masksToBounds = YES;
            tagLabel.backgroundColor = RGB(44, 155, 226);
            tagLabel.font = [UIFont systemFontOfSize:10];
            tagLabel.textColor = RGB(255, 255, 255);
            tagLabel.text = tagArray[i];
            tagLabel.textAlignment = NSTextAlignmentCenter;
            if (i == 2)
            {
                tagLabel.frame = CGRectMake((12 + 72 *2 )*SCREENW_RATE, CGRectGetMaxY(lineV.frame)+10*SCREENW_RATE, 86*SCREENW_RATE, 20*SCREENW_RATE);
            }
            [self.contentView addSubview:tagLabel];
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
