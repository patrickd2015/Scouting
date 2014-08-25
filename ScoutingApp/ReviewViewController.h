//
//  ReviewViewController.h
//  ScoutingApp
//
//  Created by Patrick Dong on 8/23/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ReviewViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) IBOutlet UITableView* reviewTable;

@end
