//
//  YYGameStatsView.m
//  GAME_STATS
//
//  Created by 董知樾 on 2017/5/31.
//  Copyright © 2017年 董知樾. All rights reserved.
//

#import "YYGameStatsView.h"
#import "YYPlayerModel.h"
#import "YYGameStatsHeader.h"

static NSString *YYGameStatsViewIden = @"YYGameStatsViewCell";

@interface YYGameStatsView()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UICollectionViewFlowLayout *layout;

@property (strong, nonatomic) UICollectionView *collectionView;

@property (weak, nonatomic) NSLayoutConstraint *collectionH;
@property (weak, nonatomic) NSLayoutConstraint *collectionW;

@property (strong, nonatomic) YYGameStatsHorizontalHeader *horizontalHeader;
@property (strong, nonatomic) YYGameStatsVerticalHeader *verticalHeader;

@property (strong, nonatomic) UILabel *teamNameLabel;

@end

@implementation YYGameStatsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    CGFloat horizontalH = 25;
    
    ///scrollView创建
    _scrollView = [[UIScrollView alloc] init];
    [self addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *s_leading = [_scrollView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor];
    NSLayoutConstraint *s_trailing = [_scrollView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor];
    NSLayoutConstraint *s_top = [_scrollView.topAnchor constraintEqualToAnchor:self.topAnchor];
    NSLayoutConstraint *s_bottom = [_scrollView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor];
    
    [NSLayoutConstraint activateConstraints:@[s_leading, s_trailing, s_top, s_bottom]];
    
    ///collectionView创建
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.itemSize = CGSizeMake(60, 45);
    _layout.minimumLineSpacing = 0;
    _layout.minimumInteritemSpacing = 0;
    _layout.sectionInset = UIEdgeInsetsZero;
    _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    _collectionView.backgroundColor = UIColor.whiteColor;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_scrollView addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:YYGameStatsViewIden];
    
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leading = [_collectionView.leadingAnchor constraintEqualToAnchor:_scrollView.leadingAnchor constant:60];
    NSLayoutConstraint *trailing = [_collectionView.trailingAnchor constraintEqualToAnchor:_scrollView.trailingAnchor];
    NSLayoutConstraint *top = [_collectionView.topAnchor constraintEqualToAnchor:_scrollView.topAnchor constant:horizontalH];
    NSLayoutConstraint *bottom = [_collectionView.bottomAnchor constraintEqualToAnchor:_scrollView.bottomAnchor];
    NSLayoutConstraint *height = [_collectionView.heightAnchor constraintEqualToConstant:_layout.itemSize.height];
    NSLayoutConstraint *width = [_collectionView.widthAnchor constraintEqualToConstant:_layout.itemSize.width * 13];
    
    [NSLayoutConstraint activateConstraints:@[leading, trailing, top, bottom, height, width]];
    _collectionH = height;
    _collectionW = width;
    
    ///水平header创建
    _horizontalHeader = [[YYGameStatsHorizontalHeader alloc] init];
    [self addSubview:_horizontalHeader];
    _horizontalHeader.itemSize = CGSizeMake(_layout.itemSize.width, horizontalH);
    
    _horizontalHeader.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *h_leading = [_horizontalHeader.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:_layout.itemSize.width];
    NSLayoutConstraint *h_trailing = [_horizontalHeader.trailingAnchor constraintEqualToAnchor:self.trailingAnchor];
    NSLayoutConstraint *h_top = [_horizontalHeader.topAnchor constraintEqualToAnchor:self.topAnchor];
    NSLayoutConstraint *h_height = [_horizontalHeader.heightAnchor constraintEqualToConstant:horizontalH];
    [NSLayoutConstraint activateConstraints:@[h_leading, h_trailing, h_top, h_height]];
    
    ///竖直header创建
    _verticalHeader = [[YYGameStatsVerticalHeader alloc] init];
    [self addSubview:_verticalHeader];
    _verticalHeader.itemSize = _layout.itemSize;
    
    _verticalHeader.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *v_leading = [_verticalHeader.leadingAnchor constraintEqualToAnchor:self.leadingAnchor];
    NSLayoutConstraint *v_top = [_verticalHeader.topAnchor constraintEqualToAnchor:self.topAnchor constant:horizontalH];
    NSLayoutConstraint *v_bottom = [_verticalHeader.bottomAnchor constraintEqualToAnchor:self.bottomAnchor];
    NSLayoutConstraint *v_width = [_verticalHeader.widthAnchor constraintEqualToConstant:_layout.itemSize.width];
    [NSLayoutConstraint activateConstraints:@[v_leading, v_top, v_bottom, v_width]];
    
    ///左上角label创建
    _teamNameLabel = [[UILabel alloc] init];
    _teamNameLabel.textColor = UIColor.darkGrayColor;
    _teamNameLabel.font = [UIFont systemFontOfSize:12];
    _teamNameLabel.textAlignment = NSTextAlignmentCenter;
    _teamNameLabel.backgroundColor = UIColor.whiteColor;
    [self addSubview:_teamNameLabel];
    
    _teamNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *t_leading = [_teamNameLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor];
    NSLayoutConstraint *t_top = [_teamNameLabel.topAnchor constraintEqualToAnchor:self.topAnchor];
    NSLayoutConstraint *t_width = [_teamNameLabel.widthAnchor constraintEqualToConstant:_layout.itemSize.width];
    NSLayoutConstraint *t_height = [_teamNameLabel.heightAnchor constraintEqualToConstant:horizontalH];
    [NSLayoutConstraint activateConstraints:@[t_leading, t_top, t_width, t_height]];
}

//MARK:~~~~ UICollectionViewDataSource, UICollectionViewDelegateFlowLayout ~~~~
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _teamModel.on.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _teamModel.on[section].statsArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YYGameStatsViewIden forIndexPath:indexPath];
    if (![cell.contentView viewWithTag:1024]) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = UIColor.darkGrayColor;
        label.font = [UIFont systemFontOfSize:12];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.tag = 1024;
        [cell.contentView addSubview:label];
        
        NSLayoutConstraint *centerX = [label.centerXAnchor constraintEqualToAnchor:cell.contentView.centerXAnchor];
        NSLayoutConstraint *centerY = [label.centerYAnchor constraintEqualToAnchor:cell.contentView.centerYAnchor];
        [NSLayoutConstraint activateConstraints:@[centerX, centerY]];
        
    }
    
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:1024];
    label.text = [NSString stringWithFormat:@"%@",_teamModel.on[indexPath.section].statsArray[indexPath.item]];
    
    return cell;
}

//MARK:~~~~ UIScrollViewDelegate ~~~~
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:_scrollView]) {
        _horizontalHeader.offX = scrollView.contentOffset.x;
        _verticalHeader.offY = scrollView.contentOffset.y;
    }
}

- (void)setTeamModel:(YYTeamModel *)teamModel {
    _teamModel = teamModel;
    _verticalHeader.teamModel = teamModel;
    _teamNameLabel.text = teamModel.team_name_cn;
    [_collectionView reloadData];
    
    _collectionH.constant = teamModel.on.count * _layout.itemSize.height;
    _collectionW.constant = teamModel.on.lastObject.statsArray.count * _layout.itemSize.width;
}

@end
