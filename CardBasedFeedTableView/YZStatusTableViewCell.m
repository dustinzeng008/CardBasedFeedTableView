//
//  YZStatusTableViewCell.m
//  CardBasedFeedTableView
//
//  Created by Yong Zeng on 11/15/16.
//  Copyright © 2016 Yong Zeng. All rights reserved.
//

#import "YZStatusTableViewCell.h"
#import "YZStatus.h"
#import "YZStatusFrame.h"

@interface YZStatusTableViewCell()
@property (nonatomic, weak) UIImageView* iconView;
@property (nonatomic, weak) UILabel* nameView;
@property (nonatomic, weak) UILabel* locationView;
@property (nonatomic, weak) UILabel* onlineNumberView;
@property (nonatomic, weak) UIImageView* pictureView;

@end

@implementation YZStatusTableViewCell

+ (instancetype)statusCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"statusCell";
    YZStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell){
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
    return cell;
}

// overrite countructor, initialization (create customize child components inside the cell)
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        self.iconView.layer.cornerRadius = YZIconWidth/2;
        self.iconView.layer.masksToBounds = YES;
        
        UILabel *nameView = [[UILabel alloc] init];
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        nameView.font = [UIFont systemFontOfSize:YZNameFont];
        
        UILabel *locationView = [[UILabel alloc] init];
        [self.contentView addSubview:locationView];
        self.locationView = locationView;
        locationView.font = [UIFont systemFontOfSize:YZLocationFont];
        
        UILabel *onlineNumberView = [[UILabel alloc] init];
        [self.contentView addSubview:onlineNumberView];
        self.onlineNumberView = onlineNumberView;
        onlineNumberView.font = [UIFont systemFontOfSize:YZLocationFont];
        
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
        pictureView.contentMode = UIViewContentModeScaleToFill;
    }
    return self;
}

- (void)setStatusFrame:(YZStatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    // set component value
    [self setSubViewsContent];
    // set frame
    [self setSubViewsFrame];
}

- (void)setSubViewsContent{
    YZStatus *status = self.statusFrame.status;
    self.iconView.image = [UIImage imageNamed:status.icon];
    self.nameView.text = status.name;
    self.locationView.text = status.location;
    self.onlineNumberView.text = status.onlineNumber;
    if (status.picture){
        self.pictureView.image = [UIImage imageNamed:status.picture];
    }
}

- (void)setSubViewsFrame{
    self.iconView.frame = self.statusFrame.iconFrame;
    self.nameView.frame = self.statusFrame.nameFrame;
    self.locationView.frame = self.statusFrame.locationFrame;
    self.onlineNumberView.frame = self.statusFrame.onlineNumberFrame;
    self.pictureView.frame = self.statusFrame.pictureFrame;
}

@end
