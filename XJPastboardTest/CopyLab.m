//
//  CopyLab.m
//  XJPastboardTest
//
//  Created by Hincat on 2018/11/1.
//  Copyright © 2018 Hincat. All rights reserved.
//

#import "CopyLab.h"

@implementation CopyLab

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = NSTextAlignmentCenter;
        [self attachTapHandler];
    }
    return self;
}

-(void)handleTap:(UIGestureRecognizer*) recognizer{
    [self becomeFirstResponder];
    NSLog(@"handleTap");
    UIMenuItem *pasteLink = [[UIMenuItem alloc] initWithTitle:@"拷贝来~" action:@selector(pa:)];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setMenuItems:@[pasteLink]];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}


-(void)attachTapHandler{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    touch.numberOfTapsRequired = 1;
    [self addGestureRecognizer:touch];
}

//这样就没有系统的copy paste了...
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
//    return (action == @selector(paste:));
//}

- (void)pa:(id)sender {
    UIPasteboard *past = [UIPasteboard generalPasteboard];
    self.text = past.string;
    NSLog(@"past %@\n",past.string);
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

@end
