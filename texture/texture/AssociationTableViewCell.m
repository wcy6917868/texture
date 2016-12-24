//
//  AssociationTableViewCell.m
//  texture
//
//  Created by 王澄宇 on 16/11/4.
//  Copyright © 2016年 henry. All rights reserved.
//

#import "AssociationTableViewCell.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW_RATE SCREENW/375
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

@implementation AssociationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(12*SCREENW_RATE, 12*SCREENW_RATE, 46*SCREENW_RATE, 46*SCREENW_RATE)];
        _headImage.image = [UIImage imageNamed:@"touxiang8"];
        [self.contentView addSubview:_headImage];
        
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImage.frame)+12*SCREENW_RATE, _headImage.frame.origin.y+3*SCREENW_RATE, 100*SCREENW_RATE, 14*SCREENW_RATE)];
        _titleL.textAlignment = NSTextAlignmentLeft;
        _titleL.textColor = RGB(51, 51, 51);
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.text = @"沙滩美人";
        [self.contentView addSubview:_titleL];
        
        _dateL = [[UILabel alloc]initWithFrame:CGRectMake(302*SCREENW_RATE, _titleL.frame.origin.y+4*SCREENW_RATE, 61*SCREENW_RATE, 10*SCREENW_RATE)];
        _dateL.font = [UIFont systemFontOfSize:11];
        _dateL.textColor = RGB(102, 102, 102);
        _dateL.text = @"2016.10.18";
        [self.contentView addSubview:_dateL];
        
        UIImageView *usrImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImage.frame)+13*SCREENW_RATE, CGRectGetMaxY(_titleL.frame)+13*SCREENW_RATE, 8*SCREENW_RATE, 11*SCREENW_RATE)];
        usrImg.image = [UIImage imageNamed:@"yonghuming0@3x"];
        [self.contentView addSubview:usrImg];
        
        _userNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(usrImg.frame), CGRectGetMaxY(_titleL.frame)+13*SCREENW_RATE, 44*SCREENW_RATE, 10*SCREENW_RATE)];
        _userNumL.textColor = RGB(102, 102, 102);
        _userNumL.font = [UIFont systemFontOfSize:12];
        _userNumL.text = @"365";
        _userNumL.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_userNumL];
        
        UIImageView *bookImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_userNumL.frame), usrImg.frame.origin.y, 11*SCREENW_RATE, 11*SCREENW_RATE)];
        bookImg.image = [UIImage imageNamed:@"read0"];
        [self.contentView addSubview:bookImg];
        
        _scanNumL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(bookImg.frame), bookImg.frame.origin.y, 50*SCREENW_RATE, 10*SCREENW_RATE)];
        _scanNumL.font = [UIFont systemFontOfSize:12];
        _scanNumL.textColor = RGB(102, 102, 102);
        _scanNumL.text = @"1365";
        _scanNumL.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_scanNumL];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(13*SCREENW_RATE, CGRectGetMaxY(_headImage.frame)+12*SCREENW_RATE, SCREENW - 13*SCREENW_RATE, 13*SCREENW_RATE)];
        _textL.font = [UIFont systemFontOfSize:13];
        _textL.textColor = RGB(102, 102, 102);
        _textL.text = @"夜空中最亮的星";
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
