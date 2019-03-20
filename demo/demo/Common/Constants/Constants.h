//
//  Constants.h
//  MacUITest
//
//  Created by Binfeng Peng - Vendor on 2019/3/14.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

// 用宏定义检测block是否可用!
#define EPIC_BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

#define NSColorFromRGB(r,g,b) [NSColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

#define NSColorFromRGBA(r,g,b,a) [NSColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

//#pragma mark - 16进制色值转RGBa
#define NSColorFromRGBHex(rgbValue) [NSColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif /* Constants_h */
