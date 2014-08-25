//
//  AutoEntryViewController.m
//  ScoutingApp
//
//  Created by Patrick Dong on 8/23/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "AutoEntryViewController.h"

@interface AutoEntryViewController ()

@end

@implementation AutoEntryViewController

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
    self.title = @"Data Entry";
}

-(void)viewWillAppear:(BOOL)animated
{
    NSMutableString* nameString = [NSMutableString stringWithString:@"Hello, "];
    if(!([[NSUserDefaults standardUserDefaults] stringForKey:@"name"] == nil))
    {
        [nameString appendString:[[NSUserDefaults standardUserDefaults] stringForKey:@"name"]];
    }
    self.helloLabel.text = nameString;
    self.helloLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)storeValues:(UIButton*)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:[self.attempted titleForSegmentAtIndex:self.attempted.selectedSegmentIndex] forKey:@"autoAttempted"];
    [[NSUserDefaults standardUserDefaults] setObject:[self.made titleForSegmentAtIndex:self.made.selectedSegmentIndex] forKey:@"autoMade"];
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
