//
//  SearchCell.m
//  texture
//
//  Created by 王澄宇 on 16/12/10.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "SearchCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation SearchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 40*SCREENW_RATE, 40*SCREENW_RATE)];
        _headImg.image = [UIImage imageNamed:@"touxiang6"];
        [self.contentView addSubview:_headImg];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+12*SCREENW_RATE, 17*SCREENW_RATE, 150*SCREENW_RATE, 15*SCREENW_RATE)];
        _titleL.font = [UIFont systemFontOfSize:15*SCREENW_RATE];
        _titleL.text = @"秋意正浓";
        _titleL.textColor = RGB(51, 51, 51);
        [self.contentView addSubview:_titleL];
        
        UILabel *topicL = [[UILabel alloc]initWithFrame:CGRectMake(_titleL.frame.origin.x, CGRectGetMaxY(_titleL.frame)+10*SCREENW_RATE, 30*SCREENW_RATE, 13*SCREENW_RATE)];
        topicL.font = [UIFont systemFontOfSize:12];
        topicL.textColor = RGB(102, 102, 102);
        topicL.text = @"话题";
        [self.contentView addSubview:topicL];
        
        _topicNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(topicL.frame), CGRectGetMaxY(_titleL.frame)+10*SCREENW_RATE, 40*SCREENW_RATE, 13*SCREENW_RATE)];
        _topicNumL.textAlignment = NSTextAlignmentCenter;
        _topicNumL.text = @"254";
        _topicNumL.font = [UIFont systemFontOfSize:12];
        _topicNumL.textColor = RGB(102, 102, 102);
        [self.contentView addSubview:_topicNumL];
        
        UILabel *fansL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_topicNumL.frame), _topicNumL.frame.origin.y, 30*SCREENW_RATE, 13*SCREENW_RATE)];
        fansL.font = [UIFont systemFontOfSize:12];
        fansL.textColor = RGB(102, 102, 102);
        fansL.text = @"粉丝";
        [self.contentView addSubview:fansL];
        
        _fansNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(fansL.frame), fansL.frame.origin.y, 40*SCREENW_RATE, 13*SCREENW_RATE)];
        _fansNumL.textAlignment = NSTextAlignmentCenter;
        _fansNumL.text = @"2.7K";
        _fansNumL.font = [UIFont systemFontOfSize:12];
        _fansNumL.textColor = RGB(102, 102, 102);
        [self.contentView addSubview:_fansNumL];
        
        _addFriendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addFriendBtn.frame = CGRectMake(273*SCREENW_RATE, 0, 90*SCREENW_RATE, 63*SCREENW_RATE);
        _addFriendBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_addFriendBtn setTitle:@"+加为好友" forState:UIControlStateNormal];
        [_addFriendBtn setTitleColor:RGB(53, 195, 236) forState:UIControlStateNormal];
        [self.contentView addSubview:_addFriendBtn];
        
        
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
