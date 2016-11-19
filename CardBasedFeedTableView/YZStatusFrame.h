//
//  YZStatusFrame.h
//  CardBasedFeedTableView
//
//  Created by Yong Zeng on 11/15/16.
//  Copyright © 2016 Yong Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define YZNameFont 15
#define YZLocationFont 13
#define YZIconWidth 44
#define KDEVICEWIDTH [[UIScreen mainScreen] bounds].size.width
#define KDEVICEHEIGHT [[UIScreen mainScreen] bounds].size.height

@class YZStatus;
@interface YZStatusFrame : NSObject

@property (nonatomic, strong) YZStatus* status;

@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect nameFrame;
@property (nonatomic, assign, readonly) CGRect locationFrame;
@property (nonatomic, assign, readonly) CGRect onlineNumberFrame;
@property (nonatomic, assign, readonly) CGRect pictureFrame;

@property (nonatomic, assign, readonly) CGFloat rowHeight;

@end
