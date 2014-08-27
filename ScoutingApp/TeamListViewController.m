//
//  TeamListViewController.m
//  ScoutingApp
//
//  Created by Patrick Dong on 8/25/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "TeamListViewController.h"
#import "ListTableViewCell.h"
#import "TeamViewController.h"
#import "Parse/Parse.h"

@implementation TeamListViewController{
    NSMutableArray *teamNumbers;
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
    
    teamNumbers = [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"MatchData"];
    [query whereKey:@"autoAttempted" notEqualTo:@"-1"];
    [query findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            for (PFObject *object in objects) {
                [teamNumbers addObject:object[@"teamNumber"]];
            }
        } else {
            // lol don't fail pls
        }
    }];
    
    NSLog(@"team number %d", teamNumbers.count);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"team numbers %d", teamNumbers.count);
    if(teamNumbers.count > 1)
    {
        for (int i = 0; i < teamNumbers.count - 1; i++) {
            if([[teamNumbers objectAtIndex:i] isEqualToNumber:[teamNumbers objectAtIndex:i + 1]])
            {
                [teamNumbers replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:-1]];
            }
        }
    }

            [teamNumbers removeObject:[NSNumber numberWithInt:-1]];

    
    teamNumbers = [NSMutableArray arrayWithArray:[teamNumbers sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] ];
    
    return teamNumbers.count;
}

-(IBAction)refresh:(UIButton*)sender
{
    NSLog(@"reload");
    [self.reviewTable reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath
                                                                               *)indexPath
{
    static NSString *CellIdentifier = @"ListTableViewCell";
    ListTableViewCell *cell = (ListTableViewCell *)[tableView
                                                        dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:CellIdentifier];
    }
    // Display recipe in the table cell
    NSLog(@"%@", [teamNumbers objectAtIndex:indexPath.row]);
    cell.teamNumber.text = [[teamNumbers objectAtIndex:indexPath.row] stringValue];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"nextView"]) {
        NSIndexPath *indexPath = [self.reviewTable indexPathForSelectedRow];
        TeamViewController *destViewController = segue.destinationViewController;
        destViewController.teamNumbertext = [[teamNumbers objectAtIndex:indexPath.row] stringValue];
    }
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
