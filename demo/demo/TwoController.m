//
//  TwoController.m
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/18.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import "TwoController.h"
#import "Masonry.h"

@interface TwoController ()

@end

@implementation TwoController

#pragma mark - Life Cycle
- (void)loadView{
    NSRect frame = [[[NSApplication sharedApplication] mainWindow] frame];
    self.view = [[NSView alloc] initWithFrame:frame];
    
    // 设置背景颜色
    self.view.wantsLayer = true;
    self.view.layer.backgroundColor = [NSColor cyanColor].CGColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Dismiss";
    
    // dismiss
    NSButtonCell *btn = [[NSButtonCell alloc] initTextCell:@"Dismiss Controller"];
    [btn setBackgroundColor:[NSColor greenColor]];
    [btn setTarget:self];
    [btn setAction:@selector(dismiss)];
    NSButton *button = [[NSButton alloc] init];
    button.cell = btn;
//    button.bordered = NO;
    button.state = 1;
    button.bezelStyle =  NSRoundedBezelStyle;
    [button setButtonType:NSButtonTypePushOnPushOff];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@45);
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
}

-(void)dismiss {
    // 移除Badge
    [[NSApp dockTile] setBadgeLabel:nil];
    [self dismissController:self];
}

@end
