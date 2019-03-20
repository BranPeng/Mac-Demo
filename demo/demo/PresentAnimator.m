//
//  PresentAnimator.m
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/18.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import "PresentAnimator.h"
#import "View/TwoView.h"

@interface PresentAnimator()

@property (nonatomic, strong)  TwoView *backgroundView;

@end

@implementation PresentAnimator

/** present animation */
- (void)animatePresentationOfViewController:(NSViewController *)viewController fromViewController:(NSViewController *)fromViewController{
    NSView *containerView = fromViewController.view;
    self.backgroundView.frame = containerView.bounds;
    [containerView addSubview:self.backgroundView];
    NSView *modalView = viewController.view;
    
    modalView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    NSRect finalRect = NSInsetRect(containerView.bounds, 50, 50);
    //    modalView.frame = NSMakeRect(finalRect.origin.x, -100, finalRect.size.width, finalRect.size.height);
    [modalView setFrameOrigin:NSMakePoint(finalRect.origin.x, -100)];
    [modalView setFrameSize:finalRect.size];
    [self.backgroundView addSubview:modalView];
    
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 0.5;
        self.backgroundView.animator.alphaValue = 1;
        [modalView.animator setFrameOrigin:NSMakePoint(finalRect.origin.x, finalRect.origin.y)];
        //NSInsetRect(containerView.bounds, 50, 50);
    } completionHandler:nil];
}

/** dismiss animation */
- (void)animateDismissalOfViewController:(NSViewController *)viewController fromViewController:(NSViewController *)fromViewController{
    
    
    NSRect startRect = viewController.view.frame;
    
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5;
        self.backgroundView.animator.alphaValue = 0;
        [viewController.view.animator setFrameOrigin:NSMakePoint(startRect.origin.x, startRect.origin.y - 100)]; //= NSMakeRect(startRect.origin.x, startRect.origin.y - 100, startRect.size.width, startRect.size.height) ;
    } completionHandler:^{
        [viewController.view removeFromSuperview];
        [self.backgroundView removeFromSuperview];
    }];
}

#pragma mark - Lazy method
- (NSView *)backgroundView{
    if (_backgroundView == nil) {
        _backgroundView = [[TwoView alloc]initWithFrame:NSZeroRect];
        _backgroundView.wantsLayer = YES;
        _backgroundView.layer.backgroundColor = [NSColor colorWithCalibratedWhite:0 alpha:0.5].CGColor;
        _backgroundView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        _backgroundView.alphaValue = 0;
        
    }
    return  _backgroundView;
}


@end
