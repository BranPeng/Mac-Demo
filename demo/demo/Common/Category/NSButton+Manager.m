//
//  NSButton+Manager.m
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/18.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import "NSButton+Manager.h"

#define kColor_TextBlack [NSColor blackColor]

@implementation NSButton (Manager)

- (void)msCommonSetting{
    
//    [self msSetLayerColor:[NSColor clearColor]];
    [self setBezelStyle:NSBezelStyleRoundRect];
    self.bordered = NO;
    self.imagePosition = NSImageLeft;
}

- (void)msPureImageBtn:(NSImage *)image{
    
    [self msCommonSetting];
    
    [self setImage:image];
    self.imageScaling = NSImageScaleNone;
    self.imagePosition =  NSImageOnly;
}

// 设置按钮文字颜色
- (void)msSetButtonTitle:(NSString *)title color:(NSColor*)color{
    
    if(color ==nil) {
        color = kColor_TextBlack;
    }
    NSFont *font = self.font;
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:font,
                           NSFontAttributeName,
                           color,
                           NSForegroundColorAttributeName,
                           nil];
    NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:title attributes:attrs];
    [self setAttributedTitle:attributedString];
    
}

//文字居中
- (void)msSetButtonCenterTitle:(NSString *)title color:(NSColor*)color{
    
    if(color ==nil) {
        color = kColor_TextBlack;
    }
    NSFont *font = self.font;
    NSMutableParagraphStyle *centredStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [centredStyle setAlignment:NSCenterTextAlignment];
    
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:centredStyle,NSParagraphStyleAttributeName,
                           font,NSFontAttributeName,
                           color,NSForegroundColorAttributeName,
                           nil];
    NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:title attributes:attrs];
    [self setAttributedTitle:attributedString];
    
}

@end
