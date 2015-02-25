//
//  ViewController.h
//  JBInputTableView
//
//  Created by Josip Bernat on 2/25/15.
//  Copyright (c) 2015 Clover-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

