//
//  NSButton+Manager.h
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/18.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSButton (Manager)

/**
 一个简单地没有边框的按钮
*/
- (void)msCommonSetting;

/**
 纯图片按钮
*/
- (void)msPureImageBtn:(NSImage *)image;

// 设置按钮文字颜色
- (void)msSetButtonTitle:(NSString *)title color:(NSColor*)color;

//文字居中
- (void)msSetButtonCenterTitle:(NSString *)title color:(NSColor*)color;

@end

NS_ASSUME_NONNULL_END
