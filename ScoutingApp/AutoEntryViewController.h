//
//  AutoEntryViewController.h
//  ScoutingApp
//
//  Created by Patrick Dong on 8/23/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoEntryViewController : UIViewController

@property(nonatomic, retain) IBOutlet UILabel* helloLabel;

@property(nonatomic, retain) IBOutlet UISegmentedControl* attempted;
@property(nonatomic, retain) IBOutlet UISegmentedControl* made;

@end
