//
//  JBInputTableViewDelegate.h
//  JBInputTableView
//
//  Created by Josip Bernat on 2/26/15.
//  Copyright (c) 2015 Clover-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JBInputTableView;

@protocol JBInputTableViewDelegate <NSObject>

- (void)inputTableView:(JBInputTableView *)tableView didSelectSendButton:(UIButton *)button;

@end
