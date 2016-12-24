//
//  MyTabBarController.h
//  texture
//
//  Created by 王澄宇 on 16/11/1.
//  Copyright © 2016年 henry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarController : UITabBarController
@property (nonatomic,copy)void(^Block)(NSString *);
@property (nonatomic,strong)UIImageView *tabBarImageV;

@end
