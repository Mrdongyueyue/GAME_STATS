//
//  YYPlayerModel.h
//  GAME_STATS
//
//  Created by 董知樾 on 2017/5/31.
//  Copyright © 2017年 董知樾. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YYPlayerModel;
@interface YYTeamModel : NSObject

@property (copy, nonatomic) NSString *team_id;
@property (copy, nonatomic) NSString *team_name_cn;
@property (strong, nonatomic) NSArray<YYPlayerModel *> *on;

+ (instancetype)teamModelWithDict:(NSDictionary *)dict;

@end

@interface YYPlayerModel : NSObject

@property (copy, nonatomic) NSString *player_id;

///名字
@property (copy, nonatomic) NSString *player_name_cn;
///头像
@property (copy, nonatomic) NSString *player_logo;

///位置（中锋后卫）
@property (copy, nonatomic) NSString *position;

///上场时间
@property (copy, nonatomic) NSString *minutes;

///投篮 命中-出手
@property (copy, nonatomic) NSString *field;

///三分球 命中-出手
@property (copy, nonatomic) NSString *three;

///罚球 命中-出手
@property (copy, nonatomic) NSString *free;

///前场篮板
@property (copy, nonatomic) NSString *off;

///后场篮板
@property (copy, nonatomic) NSString *def;

///篮板数
@property (copy, nonatomic) NSString *off_def;

///助攻
@property (copy, nonatomic) NSString *ass;

///抢断
@property (copy, nonatomic) NSString *ste;

///盖帽
@property (copy, nonatomic) NSString *blo;

///失误
@property (copy, nonatomic) NSString *turn;

///犯规
@property (copy, nonatomic) NSString *fouls;

///得分
@property (copy, nonatomic) NSString *points;

///数据按顺序排列成数组
@property (strong, nonatomic) NSArray *statsArray;

+ (instancetype)playerModelWithDict:(NSDictionary *)dict;

+ (NSArray <YYPlayerModel *>*)playerModelsWithArray:(NSArray *)array;

@end
