//
//  YYGameStatsHeader.h
//  GAME_STATS
//
//  Created by 董知樾 on 2017/5/31.
//  Copyright © 2017年 董知樾. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYTeamModel;
@interface YYGameStatsHorizontalHeader : UIView

@property (assign, nonatomic) CGFloat offX;

@property (assign, nonatomic) CGSize itemSize;

@end

@interface YYGameStatsVerticalHeader : UIView

@property (assign, nonatomic) CGFloat offY;

@property (assign, nonatomic) CGSize itemSize;

@property (strong, nonatomic) YYTeamModel *teamModel;

@end
