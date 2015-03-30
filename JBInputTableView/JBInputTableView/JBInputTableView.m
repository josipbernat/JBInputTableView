//
//  JBInputTableView.m
//  JBInputTableView
//
//  Created by Josip Bernat on 2/25/15.
//  Copyright (c) 2015 Clover-Studio. All rights reserved.
//

#import "JBInputTableView.h"

@interface JBInputTableView ()

@property (nonatomic, readwrite, retain) UIView *inputAccessoryView;

@end

@implementation JBInputTableView {
    
    NSLayoutConstraint *_heightConstraint;
}

#pragma mark - Memory Management

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
    _composeBarView.delegate = nil;
}

#pragma mark - UIResponder

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (UIView *)inputAccessoryView {
    
    if (!_inputAccessoryView) {
        
        self.composeBarView = [[PHFComposeBarView alloc] initWithFrame:CGRectMake(0.0f, 0.0f,
                                                                                  CGRectGetWidth(self.frame),
                                                                                  PHFComposeBarViewInitialHeight)];
        _composeBarView.autoAdjustTopOffset = NO;
        _composeBarView.delegate = self;
        _composeBarView.maxLinesCount = 4;
        _composeBarView.placeholder = NSLocalizedString(@"Type message...", nil);
        
        _inputAccessoryView = _composeBarView;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWasShown:)
                                                     name:UIKeyboardDidShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillBeHidden:)
                                                     name:UIKeyboardWillHideNotification object:nil];
        
        [self keyboardWillBeHidden:nil];
    }
    return _inputAccessoryView;
}

#pragma mark - Keyboard Handling

- (void)keyboardWasShown:(NSNotification *)note {
    
    if (![_composeBarView.textView isFirstResponder]) {
        return;
    }
    
    CGRect keyboardEndFrame = CGRectZero;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    
    CGFloat keyboardHeight = ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown) ?
    keyboardEndFrame.size.height : keyboardEndFrame.size.width;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0f, 0.0f, keyboardHeight, 0.0f);
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
    
    NSIndexPath *indexPath = [self indexPathWhenKeyboardBecomesVisible];
    if (indexPath) {
        [self scrollToRowAtIndexPath:indexPath
                    atScrollPosition:UITableViewScrollPositionTop
                            animated:YES];
    }
}

- (void)keyboardWillBeHidden:(NSNotification *)note {
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0f, 0.0f, CGRectGetHeight(_composeBarView.frame), 0.0f);
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
}

#pragma mark - Keyboard Scroll Adjustment

- (NSIndexPath *)indexPathWhenKeyboardBecomesVisible {
    
    NSInteger sections = [self numberOfSections];
    if (sections) {
        NSInteger section = sections - 1;
        if ([self numberOfRowsInSection:section]) {
            return [NSIndexPath indexPathForRow:[self numberOfRowsInSection:section] - 1 inSection:section];
        }
        return nil;
    }
    return nil;
}

#pragma mark - Text

- (void)clearInputText {
    
    self.composeBarView.text = @"";
}

#pragma mark - Constraints

- (NSLayoutConstraint *)__heightConstraint {
    
    if (!_heightConstraint) {
        
        for (NSLayoutConstraint *constraint in _inputAccessoryView.constraints) {
            
            if (constraint.firstAttribute == NSLayoutAttributeHeight) {
                _heightConstraint = constraint;
                break;
            }
        }
    }
    return _heightConstraint;
}

#pragma mark - PHFComposeBarViewDelegate

- (void)composeBarView:(PHFComposeBarView *)composeBarView
   willChangeFromFrame:(CGRect)startFrame
               toFrame:(CGRect)endFrame
              duration:(NSTimeInterval)duration
        animationCurve:(UIViewAnimationCurve)animationCurve {
    
    [self __heightConstraint].constant = CGRectGetHeight(endFrame);
    
    __weak id this = self;
    [UIView animateWithDuration:duration
                          delay:0.0f
                        options:(UIViewAnimationOptions)animationCurve
                     animations:^{
                         
                         __strong typeof(self) strongThis = this;
                         [strongThis.inputAccessoryView.superview layoutIfNeeded];
                     } completion:nil];
}

- (void)composeBarViewDidPressButton:(PHFComposeBarView *)composeBarView {

    if ([(NSObject *)self.inputDelegate respondsToSelector:@selector(inputTableView:didSelectSendButton:)]) {
        [self.inputDelegate  inputTableView:self didSelectSendButton:composeBarView.button];
    }
}

- (void)composeBarViewDidPressUtilityButton:(PHFComposeBarView *)composeBarView {
    
}

@end
