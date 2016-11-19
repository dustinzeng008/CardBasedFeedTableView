//
//  YZStatus.h
//  CardBasedFeedTableView
//
//  Created by Yong Zeng on 11/15/16.
//  Copyright © 2016 Yong Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZStatus : NSObject
@property (nonatomic, copy) NSString* icon;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* location;
@property (nonatomic, copy) NSString* onlineNumber;
@property (nonatomic, copy) NSString* picture;

- (instancetype)initWithDic:(NSDictionary*)dic;
+ (instancetype)statusWithDic:(NSDictionary*)dic;
+ (NSArray*)statusList;

@end
