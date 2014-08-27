//
//  ReviewViewController.m
//  ScoutingApp
//
//  Created by Patrick Dong on 8/23/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "ReviewViewController.h"
#import "CustomTableViewCell.h"

@implementation ReviewViewController{
    NSArray *titleData;
    NSArray *descriptionData;
    NSArray *valueData;
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
    self.title = @"Review";
    titleData = [NSArray arrayWithObjects:@"Attempted",@"Made",@"Made",@"Missed",@"Made",@"Missed",@"Shooter",@"Inbounder",@"Defender",@"Trusser",@"Human Player",@"Other", nil];
    descriptionData = [NSArray arrayWithObjects:@"Autonomous Period", @"Autonomous Period", @"Tele-Operated Period", @"Tele-Operated Period", @"Tele-Operated Period", @"Tele-Operated Period",@"Rating",@"Rating",@"Rating",@"Rating",@"Rating",@"Rating",  nil];
    valueData = [NSArray arrayWithObjects:[[NSUserDefaults standardUserDefaults]
                                           stringForKey:@"autoAttempted"],[[NSUserDefaults standardUserDefaults]
                                                                           stringForKey:@"autoMade"], [[NSUserDefaults standardUserDefaults]
                                                                                                       stringForKey:@"highGoalMade"],[[NSUserDefaults standardUserDefaults]
                                                                                                                                  stringForKey:@"highGoalMissed"],[[NSUserDefaults standardUserDefaults]
                                                                                                                                                             stringForKey:@"trussMade"],[[NSUserDefaults standardUserDefaults]
                                                                                                                                                                                        stringForKey:@"trussMissed"],[[NSUserDefaults standardUserDefaults]
                                                                                                                                                                                                                   stringForKey:@"shooterRating"],[[NSUserDefaults standardUserDefaults]
                                                                                                                                                                                                                                              stringForKey:@"inbounderRating"],[[NSUserDefaults standardUserDefaults]
                                                                                                                                                                                                                                                                         stringForKey:@"defenderRating"],[[NSUserDefaults standardUserDefaults]
                                                                                                                                                                                                                                                                                                    stringForKey:@"trusserRating"],[[NSUserDefaults standardUserDefaults]
                                                                                                                                                                                                                                                                                                                               stringForKey:@"humanRating"],[[NSUserDefaults standardUserDefaults]
                                                                                                                                                                                                                                                                                                                                                          stringForKey:@"otherRating"],nil];
}

-(IBAction)submitData:(UIButton*)sender
{
    PFObject *matchData = [PFObject objectWithClassName:@"MatchData"];
    matchData[@"autoAttempted"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"autoAttempted"];
    matchData[@"autoMade"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"autoMade"];
    matchData[@"highGoalMade"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"highGoalMade"];
    matchData[@"highGoalMissed"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"highGoalMissed"];
    matchData[@"trussMade"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"trussMade"];
    matchData[@"trussMissed"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"trussMissed"];
    matchData[@"shooterRating"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"shooterRating"];
    matchData[@"inbounderRating"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"inbounderRating"];
    matchData[@"defenderRating"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"defenderRating"];
    matchData[@"trusserRating"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"trusserRating"];
    matchData[@"humanRating"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"humanRating"];
    matchData[@"otherRating"] = [[NSUserDefaults standardUserDefaults] stringForKey:@"otherRating"];
    matchData[@"teamNumber"] = @254;

    [matchData saveInBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)nextMatch:(UIButton*)sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titleData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath
                                                                               *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableViewCell";
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView
                                                dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    // Display recipe in the table cell
    cell.titleLabel.text = [titleData objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = [descriptionData objectAtIndex:indexPath.row];
    cell.valueLabel.text = [valueData objectAtIndex:indexPath.row];
    
    return cell;
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
