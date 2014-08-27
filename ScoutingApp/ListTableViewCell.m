//
//  ListTableViewCell.m
//  ScoutingApp
//
//  Created by Patrick Dong on 8/25/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
