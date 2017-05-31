//
//  YYPlayerModel.m
//  GAME_STATS
//
//  Created by 董知樾 on 2017/5/31.
//  Copyright © 2017年 董知樾. All rights reserved.
//

#import "YYPlayerModel.h"

@implementation YYTeamModel

+ (instancetype)teamModelWithDict:(NSDictionary *)dict {
    YYTeamModel *model = [[YYTeamModel alloc] init];
    
    model.team_id = dict[@"team_id"];
    model.team_name_cn = dict[@"team_name_cn"];
    model.on = [YYPlayerModel playerModelsWithArray:dict[@"on"]];
    model.titles = @[@"时间",@"得分",@"篮板",@"助攻",@"抢断",@"盖帽",@"投篮",@"三分",@"罚球",@"前场篮板",@"后场篮板",@"失误",@"犯规"];
    
    return model;
}

@end

@implementation YYPlayerModel

+ (instancetype)playerModelWithDict:(NSDictionary *)dict {
    YYPlayerModel *model = [[YYPlayerModel alloc] init];
    
    model.player_id = dict[@"player_id"];
    model.player_name_cn = dict[@"player_name_cn"];
    model.player_logo = dict[@"player_logo"];
    model.position = dict[@"position"];
    model.minutes = dict[@"minutes"];
    model.field = dict[@"field"];
    model.three = dict[@"three"];
    model.free = dict[@"free"];
    model.off = dict[@"off"];
    model.def = dict[@"def"];
    model.off_def = dict[@"off+def"];
    model.ass = dict[@"ass"];
    model.ste = dict[@"ste"];
    model.blo = dict[@"blo"];
    model.turn = dict[@"turn"];
    model.fouls = dict[@"fouls"];
    model.points = dict[@"points"];
    
    [model sortStats];
    
    return model;
}

- (void)sortStats {
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self.minutes ?: @""];
    [array addObject:self.points ?: @""];
    [array addObject:self.off_def ?: @""];
    [array addObject:self.ass ?: @""];
    [array addObject:self.ste ?: @""];
    [array addObject:self.blo ?: @""];
    [array addObject:self.field ?: @""];
    [array addObject:self.three ?: @""];
    [array addObject:self.free ?: @""];
    [array addObject:self.off ?: @""];
    [array addObject:self.def ?: @""];
    [array addObject:self.turn ?: @""];
    [array addObject:self.fouls ?: @""];
    
    self.statsArray = array;
}

+ (NSArray <YYPlayerModel *>*)playerModelsWithArray:(NSArray *)array {
    NSMutableArray *m_array = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [m_array addObject:[YYPlayerModel playerModelWithDict:dict]];
    }
    
    return m_array;
}

@end
