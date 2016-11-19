//
//  YZStatusTableViewCell.h
//  CardBasedFeedTableView
//
//  Created by Yong Zeng on 11/15/16.
//  Copyright © 2016 Yong Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZStatusFrame;
@interface YZStatusTableViewCell : UITableViewCell

@property (nonatomic, strong) YZStatusFrame *statusFrame;

+ (instancetype)statusCellWithTableView:(UITableView *)tableView;

@end
