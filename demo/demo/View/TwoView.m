//
//  TwoView.m
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/18.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import "TwoView.h"

@implementation TwoView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)mouseDown:(NSEvent *)event{
    NSLog(@"mouseDown");
}

//鼠标左键起来
- (void)mouseUp:(NSEvent *)event{
    NSLog(@"mouseUp ========== ");
    
    self.layer.backgroundColor = [NSColor greenColor].CGColor;
    
}

//鼠标右键按下
- (void)rightMouseDown:(NSEvent *)event{
    NSLog(@"rightMouseDown ========== ");
}

//鼠标右键起来
- (void)rightMouseUp:(NSEvent *)event{
    NSLog(@"rightMouseUp ========== ");
}

//鼠标移动
- (void)mouseMoved:(NSEvent *)event{
    //    NSLog(@"mouseMoved ========== ");
}

//鼠标按住左键进行拖拽
- (void)mouseDragged:(NSEvent *)event{
    NSLog(@"mouseDragged ========== ");
}

//鼠标按住右键进行拖拽
- (void)rightMouseDragged:(NSEvent *)event{
    NSLog(@"rightMouseDragged ========== ");
}
@end
