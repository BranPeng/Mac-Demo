//
//  NSTextField+Label.h
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/14.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTextField (Label)

// 调用 msLabelStyle 来使field 作为label 来显示
- (void)msLabelStyle;
- (void)addAttriText:(NSString *)linkURLText;

// 改变边框颜色
- (void)borderColor:(NSColor *)color;

@end

NS_ASSUME_NONNULL_END
