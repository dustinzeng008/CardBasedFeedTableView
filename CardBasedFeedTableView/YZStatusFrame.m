//
//  YZStatusFrame.m
//  CardBasedFeedTableView
//
//  Created by Yong Zeng on 11/15/16.
//  Copyright © 2016 Yong Zeng. All rights reserved.
//

#import "YZStatusFrame.h"
#import "YZStatus.h"

@implementation YZStatusFrame

- (void)setStatus:(YZStatus *)status{
    _status = status;

    CGFloat margin = 10;
    // icon
    CGFloat iconW = YZIconWidth;
    CGFloat iconH = YZIconWidth;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // name
    CGSize nameSize = [self sizeWithText:self.status.name maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:YZNameFont];
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + margin;
    CGFloat nameY = iconY;
    _nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    // location
    CGSize locationSize = [self sizeWithText:self.status.location maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:YZLocationFont];
    CGFloat locationX = CGRectGetMaxX(_iconFrame) + margin;
    CGFloat locationY = CGRectGetMaxY(_nameFrame) + margin;
    _locationFrame = CGRectMake(locationX, locationY, locationSize.width, locationSize.height);
    
    // online number
    CGSize onlineNumberSize = [self sizeWithText:self.status.onlineNumber maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:YZLocationFont];
    CGFloat onlineNumberX = KDEVICEWIDTH - margin -  onlineNumberSize.width;
    CGFloat onlineNumberY = CGRectGetMaxY(_nameFrame) + margin;
    _onlineNumberFrame = CGRectMake(onlineNumberX, onlineNumberY, onlineNumberSize.width, onlineNumberSize.height);
    
    // picture
    CGFloat pictureW = KDEVICEWIDTH;
    CGFloat pictureH = 400;
    CGFloat pictureX = 0;
    CGFloat pictureY = CGRectGetMaxY(_iconFrame) + margin;
    _pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    
    _rowHeight = CGRectGetMaxY(_pictureFrame) > CGRectGetMaxY(_locationFrame) ?
    CGRectGetMaxY(_pictureFrame)+ margin : CGRectGetMaxY(_locationFrame)+ margin;
}

- (CGSize)sizeWithText: (NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    CGSize textSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    return textSize;
}

@end
