//
//  JBInputTableView.h
//  JBInputTableView
//
//  Created by Josip Bernat on 2/25/15.
//  Copyright (c) 2015 Clover-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHFComposeBarView.h"
#import "JBInputTableViewDelegate.h"

@interface JBInputTableView : UITableView  <PHFComposeBarViewDelegate>

@property (strong, nonatomic) PHFComposeBarView *composeBarView;
@property (weak, nonatomic) id<JBInputTableViewDelegate> inputDelegate;

@end
