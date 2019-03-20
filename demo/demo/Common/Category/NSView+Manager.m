//
//  NSView+Manager.m
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/18.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import "NSView+Manager.h"

@implementation NSView (Manager)

#pragma mark -- frame
-(void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


#pragma mark -- backgroundColor
-(void)setBackgroundColor:(NSColor *)backgroundColor
{
    self.wantsLayer = YES;
    self.layer.backgroundColor = backgroundColor.CGColor;
}

//-(NSColor *)backgroundColor {
//    return [NSColor colorWithCGColor:self.layer.backgroundColor];
//}
//
//+ (NSColor *)colorWithCGColor:(CGColorRef)CGColor
//{
//    if (CGColor == NULL) return nil;
//    return [NSColor colorWithCIColor:[CIColor colorWithCGColor:CGColor]];
//}

@end
