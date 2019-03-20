//
//  VerticallyCenteredTextFieldCell.m
//  MacUITest
//
//  Created by Binfeng Peng - Vendor on 2019/3/14.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import "VerticallyCenteredTextFieldCell.h"

@implementation VerticallyCenteredTextFieldCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _cFlags.vCentered = 1;
    }
    return self;
}

@end

@implementation VerticallyCenteredSecureTextFieldCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _cFlags.vCentered = 1;
    }
    return self;
}

@end
