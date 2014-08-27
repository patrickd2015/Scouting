//
//  TeamViewController.h
//  ScoutingApp
//
//  Created by Patrick Dong on 8/25/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UILabel *teamNumber;
@property(nonatomic, strong) NSString *teamNumbertext;
@property(nonatomic, retain) IBOutlet UITableView *reviewTable;
@property(nonatomic, retain) IBOutlet UISegmentedControl *modeSelect;

@end
