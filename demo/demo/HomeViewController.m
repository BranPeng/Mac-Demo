//
//  HomeViewController.m
//  demo
//
//  Created by Binfeng Peng - Vendor on 2019/3/14.
//  Copyright © 2019年 Binfeng Peng - Vendor. All rights reserved.
//

#import "HomeViewController.h"
#import "View/CenteredTextFieldCell.h"
#import "Masonry.h"
#import "Common/Constants/UCConst.h"
#import "TwoController.h"
#import "PresentAnimator.h"

@interface HomeViewController ()

@property(nonatomic, strong) NSButton *button;

@property(nonatomic, strong) NSTextField *textField;
@property(nonatomic, strong) NSTextField *centerField;

@property(nonatomic, strong) NSView *fieldView;
@property(nonatomic, strong) NSTextField *field;

@property (nonatomic, copy) void (^didClickCancel)(NSButton *button);

@end

@implementation HomeViewController

#pragma mark - Life Cycle
- (void)loadView{
    NSRect frame = [[[NSApplication sharedApplication] mainWindow] frame];
    self.view = [[NSView alloc] initWithFrame:frame];
    
    // 设置背景颜色
    self.view.wantsLayer = true;
    // 代码调用Assets Color: "Color"是在Assets 中创建的颜色名称
    self.view.layer.backgroundColor = [NSColor colorNamed:@"BgColor"].CGColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //do like ios
    [self setupUI];
    [self setupConstraints];
    
//    self.view.backgroundColor = [NSColor cyanColor];
}

- (void)setupUI {
    // 1. button
    NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
    home = @"dsds";
    [button setTarget:self];
    [button setAction:@selector(clickBtn:)];
    [button setTitle:home];
    
    [self.view addSubview:button];
    self.button = button;
    
    // 2.textField
    [self.view addSubview:self.textField];
    
    // 3. centerField
    [self.view addSubview:self.centerField];
    
    // 4. fieldView
    [self.view addSubview:self.fieldView];
    [self.fieldView addSubview:self.field];
    self.field.textColor = NSColor.labelColor;
}

- (void)setupConstraints {
    
    // 1. textField
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button.mas_right).with.offset(10);
        //        make.bottom.equalTo(self.view).with.offset(-10);
        make.centerY.equalTo(self.button.mas_centerY);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
    }];
    
    // 2.centerField
    [self.centerField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.equalTo(self.button.mas_top).with.offset(-15);
        make.height.equalTo(@50);
        make.width.equalTo(self.button.mas_width);
    }];
    
    // 3. fieldView
    [self.fieldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.centerField.mas_right).with.offset(20);
        make.bottom.equalTo(self.centerField.mas_bottom);
        make.width.equalTo(self.centerField.mas_width);
        make.height.equalTo(self.centerField.mas_height);
    }];
    [self.field mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.fieldView);
        make.centerY.equalTo(self.fieldView.mas_centerY);
    }];
}

#pragma mark - Lifetime -- 在这三个方法中，你必须要调用他们的父类实现。
-(void)updateViewConstraints {
    [super updateViewConstraints];
    // 每次layout改变都会调用这个方法。如窗口大小的变化。
}

-(void)viewWillLayout {
    [super viewWillLayout];
    // 会在前一个视图控制器视图的layout() 方法调用前调用，例如，你可以用这个方法来调整约束条件
}

-(void)viewDidLayout {
    [super viewDidLayout];
    // 在 layout()调用方法之后调用。
}

#pragma mark -- lazy load
- (NSTextField *)textField {
    if (_textField == nil) {
        _textField = [[NSTextField alloc]init];
        
        //设置默认显示的提示字符串
        _textField.placeholderString = @"请填写你的梦想";
        //设置默认显示的提示字符串 使用的带属性的字符串
        NSMutableAttributedString * attriString = [[NSMutableAttributedString alloc]initWithString:@"请填写你的梦想"];
        [attriString addAttribute:NSForegroundColorAttributeName value:[NSColor redColor] range:NSMakeRange(5, 2)];
        _textField.placeholderAttributedString = attriString;
        
        //设置文本框背景颜色
        _textField.backgroundColor = [NSColor greenColor];
        //设置是否绘制背景
        _textField.drawsBackground = YES;
        //设置文字颜色
        _textField.textColor = [NSColor blueColor];
        //设置是否显示边框
        _textField.bordered = YES;
        //设置是否绘制贝塞尔风格的边框
        _textField.bezeled = YES;
        //设置是否可以编辑
        _textField.editable = YES;
        //设置文本框是否可以选中
        _textField.selectable = YES;
        //设置贝塞尔风格
        _textField.bezelStyle = NSTextFieldSquareBezel;
        //设置倾向布局宽度
        _textField.preferredMaxLayoutWidth = 100;
        //设置最大行数
        _textField.maximumNumberOfLines = 5;
        //设置断行模式
        [[_textField cell] setLineBreakMode:NSLineBreakByCharWrapping];
        //设置是否启用单行模式
        [[_textField cell]setUsesSingleLineMode:NO];
        //设置超出行数是否隐藏
        [[_textField cell] setTruncatesLastVisibleLine:NO];
        
        // 取消焦点的高亮状态 -- 点击的时候不显示蓝色外框
        _textField.focusRingType = NSFocusRingTypeNone;
        
    }
    
    return _textField;
}

-(NSTextField *)centerField {
    if (_centerField == nil) {
        _centerField = [[NSTextField alloc] init];
        CenteredTextFieldCell *cell = [[CenteredTextFieldCell alloc] initTextCell:@""];
        _centerField.cell = cell;
        
        //设置默认显示的提示字符串
        _centerField.placeholderString = @"请填写你的梦想";
        //设置默认显示的提示字符串 使用的带属性的字符串
//        NSMutableAttributedString * attriString = [[NSMutableAttributedString alloc]initWithString:@"请填写你的梦想"];
//        [attriString addAttribute:NSForegroundColorAttributeName value:[NSColor redColor] range:NSMakeRange(5, 2)];
//        _centerField.placeholderAttributedString = attriString;
        
        //设置文本框背景颜色
        _centerField.backgroundColor = [NSColor greenColor];
        //设置是否绘制背景
        _centerField.drawsBackground = YES;
        //设置文字颜色
        _centerField.textColor = [NSColor blueColor];
        //设置是否显示边框
        _centerField.bordered = YES;
        //设置是否绘制贝塞尔风格的边框
        _centerField.bezeled = YES;
        //设置是否可以编辑
        _centerField.editable = YES;
        //设置文本框是否可以选中
        _centerField.selectable = YES;
        //设置贝塞尔风格
        _centerField.bezelStyle = NSTextFieldSquareBezel;
        //设置倾向布局宽度
        _centerField.preferredMaxLayoutWidth = 100;
        //设置最大行数
        _centerField.maximumNumberOfLines = 5;
        //设置断行模式
        [[_centerField cell] setLineBreakMode:NSLineBreakByCharWrapping];
        //设置是否启用单行模式
        [[_centerField cell]setUsesSingleLineMode:NO];
        //设置超出行数是否隐藏
        [[_centerField cell] setTruncatesLastVisibleLine:NO];
        
        // 取消焦点的高亮状态 -- 点击的时候不显示蓝色外框
        _centerField.focusRingType = NSFocusRingTypeNone;
    }
    
    return _centerField;
}

-(NSView *)fieldView {
    if (_fieldView == nil) {
        _fieldView = [[NSView alloc] init];
        _fieldView.wantsLayer = YES;
        _fieldView.layer.backgroundColor = [NSColor cyanColor].CGColor;
    }
    
    return _fieldView;
}

-(NSTextField *)field {
    if (_field == nil) {
        _field = [[NSTextField alloc] init];
        _field.bordered = NO;
        //设置文本框背景颜色
        _field.backgroundColor = [NSColor clearColor];

        //设置文字颜色
        _field.textColor = [NSColor blueColor];
        //设置是否显示边框
        _field.bordered = NO;

        //设置是否可以编辑
        _field.editable = YES;
        //设置文本框是否可以选中
        _field.selectable = YES;

        // 取消焦点的高亮状态 -- 点击的时候不显示蓝色外框
        _field.focusRingType = NSFocusRingTypeNone;
    }
    
    return _field;
}

#pragma mark -- Actions
- (void)clickBtn:(NSButton *)sender
{
    NSLog(@"btn");
#if NS_BLOCKS_AVAILABLE
    if(self.didClickCancel){
        self.didClickCancel(self.button);
    }
#else
    // do something
#endif
    
    // 添加Badge
    NSDockTile *dock = [NSApp dockTile];
    if (dock) {
        [dock setBadgeLabel:@"2"];
        [dock setShowsApplicationBadge:YES];
    }
    
    TwoController *twoVc  = [[TwoController alloc]init];
    /**  1. 以 sheet 方式(共享当前的window),弹出后,当前windows close 不可用 */
//    [self presentViewControllerAsSheet:twoVc];
    
    /** 2. 以modal 窗口的方式弹出新控制器(有独立的window)  */
//    [self presentViewControllerAsModalWindow:twoVc];
    
    /** 3. 自定义方式弹控制器, 需提供一个实现<NSViewControllerPresentationAnimator> 协议的类,完成动画 */
    PresentAnimator *modalAnimator = [[PresentAnimator alloc]init];
    [self presentViewController:twoVc animator:modalAnimator];
    
    /** 4. 以 popover 方式弹出新的控制器
     asPopoverRelativeToRect : 弹出popover时,附着的矩形区域(即被popover剪头指向的那一块矩形区域)
     ofView: 矩形区域( asPopoverRelativeToRect)所属的view
     preferredEdge:矩形区域( asPopoverRelativeToRect)的参考边界:
     NSRectEdgeMinX:(在矩形区域左边显示popover)
     NSRectEdgeMaxX:(在矩形区域右边显示popover)
     NSRectEdgeMinY:(在矩形区域顶部显示popover)
     NSRectEdgeMaxY:(在矩形区域底部显示popover)
     behavior : popover的行为模式
     NSPopoverBehaviorApplicationDefined :点击popover 视图以外的操作不会自动关闭(不支持ESC键盘关闭)
     NSPopoverBehaviorTransient :  点击popover 视图以外的操作会自动关闭(支持ESC键盘关闭)
     NSPopoverBehaviorSemitransient: : 点击popover 视图以外的操作不会自动关闭(支持ESC键盘关闭)
     
     */
    
//    [self presentViewController:twoVc asPopoverRelativeToRect:sender.frame ofView:self.view preferredEdge:NSRectEdgeMinY behavior:NSPopoverBehaviorApplicationDefined];
}

@end
