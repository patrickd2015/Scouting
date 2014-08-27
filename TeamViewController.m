//
//  TeamViewController.m
//  ScoutingApp
//
//  Created by Patrick Dong on 8/25/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "TeamViewController.h"
#import "CustomTableViewCell2.h"
#import "Parse/Parse.h"

@interface TeamViewController ()

@end

@implementation TeamViewController{
    NSArray *titleData;
    NSArray *descriptionData;
    NSArray *valueData;
    NSArray *titleData2;
    NSArray *descriptionData2;
    NSArray *valueData2;
    NSMutableArray *tempHold;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.teamNumbertext;
    
    NSString *str = @"Team ";
    str = [str stringByAppendingString:self.teamNumbertext];
    self.teamNumber.text = str;
    
    [self loadArrays];
    
    [self loadLabels];
    
    [self.modeSelect addTarget:self
                         action:@selector(action)
               forControlEvents:UIControlEventValueChanged];}

- (void)action
{
    NSLog(@"printed");
    [self reloadArrays];
    [self.reviewTable reloadData];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self reloadArrays];
}


-(void) loadArrays{
    titleData = [NSArray arrayWithObjects:@"Attempted",@"Made",@"Made",@"Missed",@"Made", @"Missed", nil];
    descriptionData = [NSArray arrayWithObjects:@"Autonomous Period", @"Autonomous Period", @"Tele-Operated Period", @"Tele-Operated Period", @"Tele-Operated Period", @"Tele-Operated Period", nil];
    valueData = [NSArray arrayWithObjects:@"0",@"0", @"0",@"0",@"0", @"0",nil];
    titleData2 = [NSArray arrayWithObjects:@"Shooter",@"Inbounder",@"Defender",@"Trusser",@"Human Player",@"Other", nil];
    descriptionData2 = [NSArray arrayWithObjects:@"Rating",@"Rating",@"Rating",@"Rating",@"Rating",@"Rating", nil];
    valueData2 = [NSArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0", nil];
}

-(void) reloadArrays{
    valueData = [NSArray arrayWithObjects:[tempHold objectAtIndex:0],[tempHold objectAtIndex:1], [tempHold objectAtIndex:2],[tempHold objectAtIndex:3],[tempHold objectAtIndex:4], [tempHold objectAtIndex:5],nil];
    valueData2 = [NSArray arrayWithObjects:[tempHold objectAtIndex:6],[tempHold objectAtIndex:7],[tempHold objectAtIndex:8],[tempHold objectAtIndex:9],[tempHold objectAtIndex:10],[tempHold objectAtIndex:11], nil];
    NSLog(@"loading %d", tempHold.count);
    [self.reviewTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(void) loadLabels{
    tempHold = [[NSMutableArray alloc] init];
    int length = 0;
    
    PFQuery *query = [PFQuery queryWithClassName:@"MatchData"];
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:self.teamNumbertext];
    [query whereKey:@"teamNumber" equalTo:myNumber];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
//NSLog(@"%d %d %f", x, objects.count, y);

            __block length = objects.count;
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            float y = 0;
            for (PFObject *object in objects) {
                y += [object[@"autoAttempted"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"autoMade"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"highGoalMade"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"highGoalMissed"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"trussMade"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"trussMissed"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"shooterRating"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"inbounderRating"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"defenderRating"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"trusserRating"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"humanRating"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            for (PFObject *object in objects) {
                y += [object[@"otherRating"] intValue];
            }
            [tempHold addObject:[NSString stringWithFormat:@"%.2f", y / objects.count]];
            y = 0.f;
            [self reloadArrays];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath
                                                                               *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableViewCell2";
    CustomTableViewCell2 *cell = (CustomTableViewCell2 *)[tableView
                                                        dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[CustomTableViewCell2 alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:CellIdentifier];
    }
    // Display
    if([[self.modeSelect titleForSegmentAtIndex:self.modeSelect.selectedSegmentIndex] isEqualToString:@"Totals"])
    {
        cell.titleLabel.text = [titleData objectAtIndex:indexPath.row];
        cell.descriptionLabel.text = [descriptionData objectAtIndex:indexPath.row];
        cell.valueLabel.text = [valueData objectAtIndex:indexPath.row];
    }
    else
    {
        cell.titleLabel.text = [titleData2 objectAtIndex:indexPath.row];
        cell.descriptionLabel.text = [descriptionData2 objectAtIndex:indexPath.row];
        cell.valueLabel.text = [valueData2 objectAtIndex:indexPath.row];
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
