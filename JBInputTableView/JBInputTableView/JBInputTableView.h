//
//  JBInputTableView.h
//  JBInputTableView
//
//  Created by Josip Bernat on 2/25/15.
//  Copyright (c) 2015 Clover-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PHFComposeBarView/PHFComposeBarView.h>
#import "JBInputTableViewDelegate.h"

@interface JBInputTableView : UITableView  <PHFComposeBarViewDelegate>

@property (strong, nonatomic) PHFComposeBarView *composeBarView;
@property (weak, nonatomic) id<JBInputTableViewDelegate> inputDelegate;

#pragma mark - Keyboard Scroll Adjustment
/**
 *  Index path to which tableView will be scrolled once keyboard is up. Default is last row in last section of tableView. If you provide nil no scroll will happen.
 *
 *  @return NSIndexPath of desired row in tableView.
 */
- (NSIndexPath *)indexPathWhenKeyboardBecomesVisible;

#pragma mark - Text
/**
 *  Removes text from input view.
 */
- (void)clearInputText;

@end
