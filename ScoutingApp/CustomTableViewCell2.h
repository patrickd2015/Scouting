//
//  CustomTableViewCell2.h
//  ScoutingApp
//
//  Created by Patrick Dong on 8/26/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell2 : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel* titleLabel;
@property(nonatomic, weak) IBOutlet UILabel* valueLabel;
@property(nonatomic, weak) IBOutlet UILabel* descriptionLabel;

@end
