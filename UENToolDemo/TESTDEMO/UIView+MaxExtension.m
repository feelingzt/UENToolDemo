//
//  UIView+MaxExtension.m
//  MaxTestDemo
//
//  Created by 张涛 on 2020/10/24.
//  Copyright © 2020 zhangtao. All rights reserved.
//

#import "UIView+MaxExtension.h"

@implementation UIView (MaxExtension)

- (void)setTt_x:(CGFloat)tt_x
{
    CGRect frame = self.frame;
    frame.origin.x = tt_x;
    self.frame = frame;
}
- (CGFloat)tt_x
{
    return self.frame.origin.x;
}


- (void)setTt_y:(CGFloat)tt_y
{
    CGRect frame = self.frame;
    frame.origin.y = tt_y;
    self.frame = frame;
}
- (CGFloat)tt_y
{
    return self.frame.origin.y;
}


- (void)setTt_width:(CGFloat)tt_width
{
    CGRect frame = self.frame;
    frame.size.width = tt_width;
    self.frame = frame;
}
- (CGFloat)tt_width {
    return self.frame.size.width;
}


- (void)setTt_height:(CGFloat)tt_height
{
    CGRect frame = self.frame;
    frame.size.height = tt_height;
    self.frame = frame;
}
- (CGFloat)tt_height
{
    return self.frame.size.height;
}


- (void)setTt_centerX:(CGFloat)tt_centerX
{
    CGPoint center = self.center;
    center.x = tt_centerX;
    self.center = center;
}
- (CGFloat)tt_centerX
{
    return self.center.x;
}


- (void)setTt_centerY:(CGFloat)tt_centerY
{
    CGPoint center = self.center;
    center.y = tt_centerY;
    self.center = center;
}
- (CGFloat)tt_centerY
{
    return self.center.y;
}


- (void)setTt_maxX:(CGFloat)tt_maxX
{
    self.tt_x = tt_maxX - self.tt_width;
}
- (CGFloat)tt_maxX
{
    return CGRectGetMaxX(self.frame);
}


- (void)setTt_maxY:(CGFloat)tt_maxY
{
    self.tt_y = tt_maxY - self.tt_height;
}
- (CGFloat)tt_maxY
{
    return CGRectGetMaxY(self.frame);
}


- (void)setTt_size:(CGSize)tt_size
{
    CGRect frame = self.frame;
    frame.size = tt_size;
    self.frame = frame;
}
- (CGSize)tt_size
{
    return self.frame.size;
}


@end
