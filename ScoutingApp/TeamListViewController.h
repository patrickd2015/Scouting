//
//  TeamListViewController.h
//  ScoutingApp
//
//  Created by Patrick Dong on 8/25/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) IBOutlet UITableView* reviewTable;

@end
