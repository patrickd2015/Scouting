//
//  TeleOpViewController.h
//  ScoutingApp
//
//  Created by Patrick Dong on 8/23/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeleOpViewController : UIViewController

@property(nonatomic, retain) IBOutlet UIStepper* step1;
@property(nonatomic, retain) IBOutlet UIStepper* step2;
@property(nonatomic, retain) IBOutlet UIStepper* step3;
@property(nonatomic, retain) IBOutlet UIStepper* step4;

@property(nonatomic, retain) IBOutlet UILabel* label1;
@property(nonatomic, retain) IBOutlet UILabel* label2;
@property(nonatomic, retain) IBOutlet UILabel* label3;
@property(nonatomic, retain) IBOutlet UILabel* label4;

@end
