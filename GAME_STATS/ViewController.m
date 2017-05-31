//
//  ViewController.m
//  GAME_STATS
//
//  Created by 董知樾 on 2017/5/31.
//  Copyright © 2017年 董知樾. All rights reserved.
//

#import "ViewController.h"
#import "YYPlayerModel.h"
#import "YYGameStatsView.h"

@interface ViewController ()

@property (strong, nonatomic) YYTeamModel *host;
@property (strong, nonatomic) YYTeamModel *guest;

@property (strong, nonatomic) YYGameStatsView *hostGameStatsView;
@property (strong, nonatomic) YYGameStatsView *guestGameStatsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"nba" ofType:@"json"];
    NSData *j_data = [NSData dataWithContentsOfFile:jsonPath];
    NSDictionary *nbaJson = [NSJSONSerialization JSONObjectWithData:j_data options:NSJSONReadingAllowFragments error:nil];
    NSDictionary *result = nbaJson[@"result"];
    NSDictionary *data = result[@"data"];
    NSDictionary *host = data[@"host"];
    NSDictionary *guest = data[@"guest"];
    
    _host = [YYTeamModel teamModelWithDict:host];
    _guest = [YYTeamModel teamModelWithDict:guest];
    
    ///主队
    _hostGameStatsView = [[YYGameStatsView alloc] init];
    [self.view addSubview:_hostGameStatsView];
    
    _hostGameStatsView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *h_leading = [_hostGameStatsView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
    NSLayoutConstraint *h_trailing = [_hostGameStatsView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor];
    NSLayoutConstraint *h_top = [_hostGameStatsView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20];
    
    [NSLayoutConstraint activateConstraints:@[h_leading, h_trailing, h_top]];
    _hostGameStatsView.teamModel = _host;
    
    ///客队
    _guestGameStatsView = [[YYGameStatsView alloc] init];
    [self.view addSubview:_guestGameStatsView];
    
    _guestGameStatsView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *g_leading = [_guestGameStatsView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
    NSLayoutConstraint *g_trailing = [_guestGameStatsView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor];
    NSLayoutConstraint *g_top = [_guestGameStatsView.topAnchor constraintEqualToAnchor:_hostGameStatsView.bottomAnchor constant:20];
    NSLayoutConstraint *g_bottom = [_guestGameStatsView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor];
    NSLayoutConstraint *g_height = [_guestGameStatsView.heightAnchor constraintEqualToAnchor:_hostGameStatsView.heightAnchor];
    
    [NSLayoutConstraint activateConstraints:@[g_leading, g_trailing, g_top, g_bottom, g_height]];
    _guestGameStatsView.teamModel = _guest;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


@end
