//
//  YZStatus.m
//  CardBasedFeedTableView
//
//  Created by Yong Zeng on 11/15/16.
//  Copyright © 2016 Yong Zeng. All rights reserved.
//

#import "YZStatus.h"

@implementation YZStatus

- (instancetype)initWithDic:(NSDictionary*)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)statusWithDic:(NSDictionary*)dic{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray*)statusList{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"status" ofType:@"plist"];
    NSArray* dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray* tmpArray = [NSMutableArray array];
    for (NSDictionary* dic in dicArray) {
        YZStatus* status = [YZStatus statusWithDic:dic];
        [tmpArray addObject:status];
    }
    return tmpArray;
}

@end
