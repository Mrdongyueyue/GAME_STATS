//
//  YYGameStatsHeader.m
//  GAME_STATS
//
//  Created by 董知樾 on 2017/5/31.
//  Copyright © 2017年 董知樾. All rights reserved.
//

#import "YYGameStatsHeader.h"
#import "UIImageView+WebCache.h"
#import "YYPlayerModel.h"

static NSString *YYGameStatsHorizontalHeaderIden = @"YYGameStatsHorizontalHeaderIden";
static NSString *YYGameStatsVerticalHeaderIden = @"YYGameStatsVerticalHeaderIden";

@interface YYGameStatsHorizontalHeader ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *layout;

@property (strong, nonatomic) NSArray *titles;

@end

@implementation YYGameStatsHorizontalHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    self.clipsToBounds = YES;
    
    _titles = @[@"时间",@"得分",@"篮板",@"助攻",@"抢断",@"盖帽",@"投篮",@"三分",@"罚球",@"前场篮板",@"后场篮板",@"失误",@"犯规"];
    
    _layout = [[UICollectionViewFlowLayout alloc] init];
//    _layout.itemSize = CGSizeMake(60, 25);
    _layout.minimumLineSpacing = 0;
    _layout.minimumInteritemSpacing = 0;
    _layout.sectionInset = UIEdgeInsetsZero;
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    _collectionView.backgroundColor = UIColor.whiteColor;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:YYGameStatsHorizontalHeaderIden];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.scrollEnabled = NO;
    
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leading = [_collectionView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor];
    NSLayoutConstraint *trailing = [_collectionView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor];
    NSLayoutConstraint *top = [_collectionView.topAnchor constraintEqualToAnchor:self.topAnchor];
    NSLayoutConstraint *bottom = [_collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor];
    
    [NSLayoutConstraint activateConstraints:@[leading, trailing, top, bottom]];
}

//MARK:~~~~ UICollectionViewDataSource, UICollectionViewDelegateFlowLayout ~~~~
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 13;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YYGameStatsHorizontalHeaderIden forIndexPath:indexPath];
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
    label.text = _titles[indexPath.item];
    
    return cell;
}

- (void)setOffX:(CGFloat)offX {
    _offX = offX;
    [_collectionView setContentOffset:CGPointMake(offX, 0)];
}

- (void)setItemSize:(CGSize)itemSize {
    _itemSize = itemSize;
    _layout.itemSize = itemSize;
}

@end


@interface YYGameStatsVerticalHeader ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *layout;

@end

@implementation YYGameStatsVerticalHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
//    _titles = @[@"时间",@"得分",@"篮板",@"助攻",@"抢断",@"盖帽",@"投篮",@"三分",@"罚球",@"前场篮板",@"后场篮板",@"失误",@"犯规"];
    self.clipsToBounds = YES;
    
    _layout = [[UICollectionViewFlowLayout alloc] init];
//    _layout.itemSize = CGSizeMake(60, 45);
    _layout.minimumLineSpacing = 0;
    _layout.minimumInteritemSpacing = 0;
    _layout.sectionInset = UIEdgeInsetsZero;
    _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    _collectionView.backgroundColor = UIColor.whiteColor;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:YYGameStatsVerticalHeaderIden];
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.scrollEnabled = NO;
    
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leading = [_collectionView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor];
    NSLayoutConstraint *trailing = [_collectionView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor];
    NSLayoutConstraint *top = [_collectionView.topAnchor constraintEqualToAnchor:self.topAnchor];
    NSLayoutConstraint *bottom = [_collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor];
    
    [NSLayoutConstraint activateConstraints:@[leading, trailing, top, bottom]];
}

//MARK:~~~~ UICollectionViewDataSource, UICollectionViewDelegateFlowLayout ~~~~
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _teamModel.on.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YYGameStatsVerticalHeaderIden forIndexPath:indexPath];
    if (![cell.contentView viewWithTag:1024]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.cornerRadius = 12.5;
        imageView.layer.masksToBounds = YES;
        imageView.tag = 1023;
        [cell.contentView addSubview:imageView];
        
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *i_top = [imageView.topAnchor constraintEqualToAnchor:cell.contentView.topAnchor constant:2];
        NSLayoutConstraint *i_centerX = [imageView.centerXAnchor constraintEqualToAnchor:cell.contentView.centerXAnchor];
        NSLayoutConstraint *width = [imageView.widthAnchor constraintEqualToConstant:25];
        NSLayoutConstraint *height = [imageView.heightAnchor constraintEqualToConstant:25];
        [NSLayoutConstraint activateConstraints:@[i_top, i_centerX, width, height]];
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = UIColor.darkGrayColor;
        label.font = [UIFont systemFontOfSize:12];
        label.tag = 1024;
        [cell.contentView addSubview:label];
        
        label.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *l_bottom = [label.bottomAnchor constraintEqualToAnchor:cell.contentView.bottomAnchor];
        NSLayoutConstraint *l_centerX = [label.centerXAnchor constraintEqualToAnchor:cell.contentView.centerXAnchor constant:2];
        [NSLayoutConstraint activateConstraints:@[l_bottom, l_centerX]];
        
    }
    
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:1024];
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:1023];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_teamModel.on[indexPath.item].player_logo]];
    label.text = [NSString stringWithFormat:@"%@",_teamModel.on[indexPath.item].player_name_cn];
    
    return cell;
}

- (void)setOffY:(CGFloat)offY {
    _offY = offY;
    [_collectionView setContentOffset:CGPointMake(0, offY)];
}

- (void)setItemSize:(CGSize)itemSize {
    _itemSize = itemSize;
    _layout.itemSize = itemSize;
}

- (void)setTeamModel:(YYTeamModel *)teamModel {
    _teamModel = teamModel;
    [_collectionView reloadData];
}

@end
