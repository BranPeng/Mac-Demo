//
//  AppDelegate.m
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/14.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "FirstWindowController.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) HomeViewController *homeVC;
@property (nonatomic, strong) FirstWindowController *firstWindowC;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    //窗口 关闭，缩小，放大等功能，根据需求自行组合
    NSUInteger style =  NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable;
    float w = [[NSScreen mainScreen] frame].size.width/2;
    float h = [[NSScreen mainScreen] frame].size.height/2;
    self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, w, h) styleMask:style backing:NSBackingStoreBuffered defer:YES];
    self.window.title = @"hello";
    
    [self.window makeKeyAndOrderFront:nil];
    [self.window center];
    
    // 整个窗体失去焦点，不闪烁光标
    [self.window makeFirstResponder:nil];
    if (@available(macOS 10.14, *)) {
        self.window.appearance = [NSAppearance appearanceNamed:NSAppearanceNameDarkAqua];
    } else {
        // Fallback on earlier versions
//        NSLog(@"Fallback");
        self.window.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantDark];
    }
    
    self.homeVC = [[HomeViewController alloc] init];
    [self.window setContentViewController:self.homeVC];
    
    [self addEffectView];
    
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

- (void)handleURLEvent:(NSAppleEventDescriptor*)theEvent withReplyEvent:(NSAppleEventDescriptor*)replyEvent {
    
    NSString* path = [[theEvent paramDescriptorForKeyword:keyDirectObject] stringValue];
    
    [[NSAlert alertWithMessageText:@"URL Request" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"%@", path] runModal];
}

- (void)addEffectView {
    NSVisualEffectView *effectView = [[NSVisualEffectView alloc] initWithFrame:CGRectMake(15, 250, 235, 300)];
    effectView.blendingMode = NSVisualEffectBlendingModeWithinWindow;
    effectView.state = NSVisualEffectStateActive;
    
    effectView.wantsLayer = YES;
    effectView.layer.backgroundColor = [NSColor magentaColor].CGColor;
    
    [self.window.contentView addSubview:effectView];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
