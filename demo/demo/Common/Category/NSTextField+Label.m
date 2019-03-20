//
//  NSTextField+Label.m
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/14.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import "NSTextField+Label.h"

@implementation NSTextField (Label)
/**
 cocoa 中并没有 UILable ，也没有 NSLabel
 cocoa 中的 label 实际上是 NSTextField，并将editable = NO; 来实现显示效果
*/
- (void)msLabelStyle{
    self.editable = NO;
    self.bordered = NO;
    self.font = [NSFont systemFontOfSize:14];
    self.textColor = [NSColor darkGrayColor];
    
    self.backgroundColor = [NSColor clearColor];
    self.stringValue = @"";
}

- (void)addAttriText:(NSString *)linkURLText
{
    
//    NSString *linkURLText = @"http://www.apple.com/";
    NSString *text = [NSString stringWithFormat:@"please visit %@",linkURLText];
    
    NSURL *linkURL = [NSURL URLWithString:linkURLText];
    
    NSRange selectedRange = [text rangeOfString:linkURLText];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:text];
    
    
    
    [string beginEditing];
    [string addAttribute:NSLinkAttributeName
                   value:linkURL
                   range:selectedRange];
    
    [string addAttribute:NSForegroundColorAttributeName
                   value:[NSColor blueColor]
                   range:selectedRange];
    
    [string addAttribute:NSUnderlineStyleAttributeName
                   value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:selectedRange];
    
    [string endEditing];
    
    self.attributedStringValue = string;
}

// 文字内容富文本显示
//- (void)richText:(NSString *)text
//{
//    NSString *string = @"这是蓝色文字，这是红色文字。";
//    NSMutableAttributedString *colorTitle = [[NSMutableAttributedString alloc] initWithString: string];
//    [colorTitle addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:NSMakeRange(0, 7)];
//    [colorTitle addAttribute:NSForegroundColorAttributeName value:HEX_RGB_COLOR(0x38b162) range:NSMakeRange(7, 7)];
//    self.attributedStringValue = colorTitle;
//}

// 改变边框颜色
- (void)borderColor:(NSColor *)color
{
    self.bordered = YES;
    self.wantsLayer = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = 1.0f;
    
    // 重要：一定要设置如下属性，否则无法显示效果
    [[self cell] setBezeled:NO];
    [[self cell] setBordered:NO];
}

@end
